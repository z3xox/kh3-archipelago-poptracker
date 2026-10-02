#!/usr/bin/env python3
"""
Differential test of the tracker's logic against the apworld's real rules.

What it does
------------
1. Stages the apworld, builds a tiny fake multiworld (regions, entrances,
   locations, a state with has()/has_from_list_unique()) and runs the apworld's
   own Rules.set_rules on it, with every catalog location active.
2. Evaluates the tracker on the same inventories: locations/*.json access_rules
   (parents ANDed with sections, "parent" attachments, bracketed tokens counted
   as required) and the $functions of scripts/logic.lua, executed in Lua.
3. Draws random inventories, and reports every location where the two
   disagree, with a minimal inventory that shows it.

It covers what check_pack_schema / sync_access_rules cannot: world access
(portal keyblades, tiers), Twilight Town / Caribbean gates, level-ups, Lucky
Emblems, Coliseum cups, Moogle Workshop, classic kingdom, ingredients.

Settings are modelled as "everything on": every pool active, Lucky Emblems per
check = vanilla milestones.

Scenarios: plain, starts (start_with_* unlocks), base (default base abilities),
hearts (goal = 7 Heart Pieces), levels_shared / levels_each (Keyblade Levels
shuffled / keyblade upgrade sanity, with random Progressive Keyblade Level counts).
The other scenarios use "start at max".

Needs `pip install lupa`. Targets the 0.16.x Rules.py (plain lambdas on a state);
0.17's rule-builder classes would need the fake state extended.

Usage:
    python scripts/tools/check_logic_against_apworld.py --apworld kh3_public.apworld
    python scripts/tools/check_logic_against_apworld.py --inventories 3000 --seed 7
Exit status is 1 when a disagreement is found.
"""
import argparse
import collections
import enum
import glob
import importlib
import json
import os
import random
import re
import sys
import tempfile
import types
import zipfile
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = Path(__file__).resolve().parents[2]
VANILLA_EMBLEMS = {1, 3, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 80, 90}
HEART_PIECE = "Heart Piece"


# ------------------------------------------------------------------ fake Archipelago
class ItemClassification(enum.IntFlag):
    filler = 1
    progression = 2
    useful = 4
    trap = 8
    skip_balancing = 16
    progression_skip_balancing = 18


class Location:
    def __init__(self, player, name="", address=None, parent=None):
        self.player, self.name, self.address, self.parent_region = player, name, address, parent
        self.access_rule = lambda state: True
        self.item_rule = lambda item: True

    def can_reach(self, state):
        return self.parent_region.can_reach(state) and self.access_rule(state)


class Entrance:
    def __init__(self, player, name="", parent=None):
        self.player, self.name, self.parent_region = player, name, parent
        self.access_rule = lambda state: True
        self.connected_region = None

    def connect(self, region):
        self.connected_region = region
        region.entrances.append(self)


class Region:
    def __init__(self, name, player, multiworld=None):
        self.name, self.player, self.multiworld = name, player, multiworld
        self.locations, self.exits, self.entrances = [], [], []

    def can_reach(self, state):
        return self in state.reachable


class MultiWorld:
    def __init__(self):
        self.regions = []

    def get_region(self, name, player):
        return next(r for r in self.regions if r.name == name)

    def get_regions(self, player):
        return list(self.regions)

    def get_location(self, name, player):
        for region in self.regions:
            for location in region.locations:
                if location.name == name:
                    return location
        raise KeyError(name)

    def get_entrance(self, name, player):
        for region in self.regions:
            for entrance in region.exits:
                if entrance.name == name:
                    return entrance
        raise KeyError(name)

    def register_indirect_condition(self, *args):
        pass


class State:
    def __init__(self, multiworld, counts):
        self.mw, self.counts = multiworld, counts
        self.queried = set()
        self.reachable = set()

    def has(self, item, player, count=1):
        self.queried.add(item)
        return self.counts.get(item, 0) >= count

    def has_from_list_unique(self, items, player, count):
        self.queried.update(items)
        return sum(1 for i in set(items) if self.counts.get(i, 0) > 0) >= count

    def compute(self):
        menu = next(r for r in self.mw.regions if r.name == "Menu")
        self.reachable = {menu}
        changed = True
        while changed:  # rules read self.reachable, which only ever grows
            changed = False
            for region in list(self.reachable):
                for entrance in region.exits:
                    if entrance.connected_region not in self.reachable and entrance.access_rule(self):
                        self.reachable.add(entrance.connected_region)
                        changed = True


def install_fakes():
    bc = types.ModuleType("BaseClasses")
    for cls in (Location, Entrance, Region, MultiWorld, ItemClassification):
        setattr(bc, cls.__name__, cls)
    bc.Item = type("Item", (), {})
    bc.CollectionState = State
    bc.Tutorial = type("Tutorial", (), {"__init__": lambda self, *a, **k: None})

    class LocationProgressType(enum.IntEnum):
        DEFAULT = 0
        PRIORITY = 1
        EXCLUDED = 2

    bc.LocationProgressType = LocationProgressType
    sys.modules["BaseClasses"] = bc
    for name in ("worlds", "worlds.generic", "worlds.generic.Rules"):
        sys.modules[name] = types.ModuleType(name)

    def add_rule(spot, rule, combine="and"):
        old = spot.access_rule
        spot.access_rule = ((lambda state: old(state) and rule(state)) if combine == "and"
                            else (lambda state: old(state) or rule(state)))

    sys.modules["worlds.generic.Rules"].add_rule = add_rule
    sys.modules["worlds.generic.Rules"].add_item_rule = lambda *a, **k: None


class Opt:
    def __init__(self, value):
        self.value = value


SCENARIOS = {
    "plain": dict(unlocks=(), base=False, goal="three_proofs", levels=0),
    "starts": dict(unlocks=("start_with_wall_run", "start_with_magic", "start_with_attraction_flow",
                            "start_with_links"), base=False, goal="three_proofs", levels=0),
    "base": dict(unlocks=(), base=True, goal="three_proofs", levels=0),
    "hearts": dict(unlocks=(), base=False, goal="seven_heart_pieces", levels=0),
    "levels_shared": dict(unlocks=(), base=False, goal="three_proofs", levels=1),
    "levels_each": dict(unlocks=(), base=False, goal="three_proofs", levels=2),
}
SHARED_LEVEL_ITEM = "Progressive Keyblade Level"


# ------------------------------------------------------------------ one scenario
class Harness:
    def __init__(self, apworld, scenario):
        self.scenario = SCENARIOS[scenario]
        self.load_apworld(apworld)
        self.build_ap_world()
        self.build_tracker()
        self.pair_locations()

    def load_apworld(self, apworld):
        install_fakes()
        work = Path(tempfile.mkdtemp(prefix="kh3-ap-"))
        zipfile.ZipFile(apworld).extractall(work)
        package = next(p.name for p in work.iterdir() if (p / "Data.py").exists())
        (work / package / "__init__.py").write_text("", encoding="utf-8")
        sys.path.insert(0, str(work))
        self.Data = importlib.import_module(f"{package}.Data")
        self.Regions = importlib.import_module(f"{package}.Regions")
        self.Rules = importlib.import_module(f"{package}.Rules")
        # Item-placement helpers do not affect reachability.
        for fn in ("uses_replace_location_pool", "uses_minigame_rank_junk", "uses_level_up_junk",
                   "uses_strict_junk_setting"):
            setattr(self.Rules, fn, lambda *a, **k: False)
        self.Rules.ingredient_spot_is_junk = lambda *a, **k: False
        data = self.Data.load_extracted_data()
        self.catalog = data["locations"]
        self.base_id = data.get("meta", {}).get("base_location_id", 1263022848)

    def build_ap_world(self):
        sc = self.scenario
        goal = types.SimpleNamespace(current_key=sc["goal"], value=int(sc["goal"] != "three_proofs"))
        options = types.SimpleNamespace(default_base_abilities=Opt(int(sc["base"])),
                                        keyblade_levels=Opt(sc["levels"]), goal=goal)
        for option_name in self.Data.CONTROLLER_UNLOCK_ITEM_NAMES_BY_OPTION:
            setattr(options, option_name, Opt(int(option_name in sc["unlocks"])))
        self.Regions.location_name_to_id = {r["name"]: self.base_id + i for i, r in enumerate(self.catalog)}
        self.mw = MultiWorld()
        active = [dict(r) for r in self.catalog]
        self.Regions.create_regions(self.mw, 1, active, [])
        world = types.SimpleNamespace(player=1, multiworld=self.mw, active_locations=active,
                                      logic_reference_locations=[], options=options)
        self.Rules.set_rules(world)
        self.free = {self.Data.CONTROLLER_UNLOCK_ITEM_NAMES_BY_OPTION[o] for o in sc["unlocks"]}
        if sc["base"]:
            self.free |= set(self.Data.DEFAULT_BASE_ABILITY_ITEM_NAMES)
        self.free.add("Unlock: Airstep")

    def build_tracker(self):
        try:
            from lupa import LuaRuntime
        except ImportError:
            raise SystemExit("error: this check needs lupa (pip install lupa)")
        mapping = (ROOT / "scripts/autotracking/item_mapping.lua").read_text(encoding="utf-8")
        self.name_to_code = dict(re.findall(r'\["([^"]+)"\]\s*=\s*\{\s*code\s*=\s*"([^"]+)"', mapping))
        self.lua = LuaRuntime(unpack_returned_tuples=True)
        goal_stage = 1 if self.scenario["goal"] == "seven_heart_pieces" else 0
        self.lua.execute(f"""
            COUNTS = {{}}
            SETTINGS = {{goal={{CurrentStage={goal_stage}}}, lep_check={{AcquiredCount=0}},
                         le_limit={{AcquiredCount=90}}, lu_limit={{AcquiredCount=99}},
                         keyblade_levels_setting={{CurrentStage={self.scenario["levels"]}}}}}
            Tracker = {{}}
            function Tracker:ProviderCountForCode(c)
              if string.sub(c, 1, 7) == "active_" then return 1 end
              return COUNTS[c] or 0
            end
            function Tracker:FindObjectForCode(c) return SETTINGS[c] end
            function Tracker:AddLayouts() end
            ScriptHost = {{}}
            function ScriptHost:LoadScript() end
            function ScriptHost:AddWatchForCode() end
            dofile("{(ROOT / 'scripts/logic.lua').as_posix()}")
            function set_counts(t) COUNTS = t end
            function call_fn(name, ...) local f = _G[name]; if f == nil then return -1 end; return f(...) end
        """)
        self.set_counts, self.call_fn = self.lua.globals().set_counts, self.lua.globals().call_fn

        self.occurrences = collections.defaultdict(list)  # section -> [(file, rule chain)]
        registry = {}

        def walk(node, chain, path):
            if "parent" in node and not chain:
                chain = registry.get(node["parent"], [])
            chain = chain + [node.get("access_rules")]
            registry[node["name"]] = chain
            for section in node.get("sections", []) or []:
                self.occurrences[section["name"]].append((path, chain + [section.get("access_rules")]))
            for child in node.get("children", []) or []:
                walk(child, chain, path)

        order = re.findall(r'AddLocations\("locations/([^"]+)"\)',
                           (ROOT / "scripts/locations.lua").read_text(encoding="utf-8"))
        for name in order:
            if name == "overworld.json":
                continue
            for node in json.loads((ROOT / "locations" / name).read_text(encoding="utf-8")):
                walk(node, [], name)

    def pair_locations(self):
        mapping = (ROOT / "scripts/autotracking/location_mapping.lua").read_text(encoding="utf-8")
        id_to_section = {int(i): c.split("/", 1)[1]
                         for i, c in re.findall(r'\[(\d+)\]\s*=\s*\{\s*code\s*=\s*"([^"]+)"', mapping)}
        by_name = {loc.name: loc for region in self.mw.regions for loc in region.locations}
        self.pairs, self.untracked = [], []
        for index, row in enumerate(self.catalog):
            section = id_to_section.get(self.base_id + index)
            if row["type"] == "lucky_emblem" and int(row["source_id"]) not in VANILLA_EMBLEMS:
                continue  # not a check at the default "Lucky Emblems Per Check"
            if section is None or section not in self.occurrences:
                self.untracked.append(row["name"])
                continue
            self.pairs.append((row, section, by_name[row["name"]]))

    # -- evaluation
    def tracker_token(self, token, counts):
        token = token.strip()
        if token.startswith("[") and token.endswith("]"):
            token = token[1:-1]
        if token.startswith("$"):
            parts = token[1:].split("|")
            result = self.call_fn(parts[0], *parts[1:])
            return result is not None and result > 0
        code, _, need = token.partition(":")
        return code.startswith("active_") or counts.get(code, 0) >= (int(need) if need else 1)

    def tracker_ok(self, chain, counts):
        for rules in chain:
            if rules and not any(all(self.tracker_token(t, counts) for t in rule.split(",")) for rule in rules):
                return False
        return True

    def evaluate(self, owned, counted):
        """owned: set of AP item names; counted: {AP item name: copies}. Returns (state, tracker counts)."""
        names = set(owned) | self.free
        ap_counts = {n: 1 for n in names}
        counts = {self.name_to_code[n]: 1 for n in names if n in self.name_to_code}
        counts["unlock_airstep"] = 1
        for name, copies in counted.items():
            ap_counts[name] = copies
            counts[self.name_to_code[name]] = copies
        state = State(self.mw, ap_counts)
        state.compute()
        self.set_counts(self.lua.table_from(counts))
        return state, counts

    def disagreements(self, owned, counted):
        state, counts = self.evaluate(owned, counted)
        found = []
        for row, section, location in self.pairs:
            ap = bool(location.can_reach(state))
            for path, chain in self.occurrences[section]:
                if ap != self.tracker_ok(chain, counts):
                    found.append((section, path, ap, row["type"]))
        return found

    def minimal_inventory(self, section, path, owned, counted):
        items = sorted(owned)

        def differs(inv):
            return any(s == section and p == path for s, p, _, _ in self.disagreements(set(inv), counted))

        i = 0
        while i < len(items):
            trial = items[:i] + items[i + 1:]
            if differs(trial):
                items = trial
            else:
                i += 1
        return items

    def run(self, inventories, seed, show):
        rnd = random.Random(seed)
        level_items = {SHARED_LEVEL_ITEM} | set(self.Data.PROGRESSIVE_KEYBLADE_LEVEL_ITEM_NAME_BY_KEYBLADE.values())
        tracked_level_items = sorted(n for n in level_items if n in self.name_to_code)
        universe = sorted(set(self.name_to_code) - {"Unlock: Airstep", HEART_PIECE} - level_items)
        seen = {}
        for _ in range(inventories):
            density = rnd.choice([0.1, 0.2, 0.3, 0.45, 0.6, 0.75, 0.9])
            owned = {n for n in universe if rnd.random() < density}
            counted = {}
            if self.scenario["goal"] == "seven_heart_pieces":
                counted[HEART_PIECE] = rnd.randint(0, 9)
            if self.scenario["levels"] == 1:
                counted[SHARED_LEVEL_ITEM] = rnd.choice([0, rnd.randint(1, 10), 10])
            if self.scenario["levels"] == 2:
                for name in tracked_level_items:
                    counted[name] = rnd.choice([0, rnd.randint(1, 10), 10])
            for section, path, ap, kind in self.disagreements(owned, counted):
                entry = seen.setdefault((section, path), {"ap": 0, "tracker": 0, "kind": kind, "inv": (owned, counted)})
                entry["ap" if ap else "tracker"] += 1
        return seen


def main():
    parser = argparse.ArgumentParser(description=__doc__, formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument("--apworld", type=Path, default=ROOT / "kh3.apworld")
    parser.add_argument("--inventories", type=int, default=600, help="random inventories per scenario")
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--scenarios", nargs="*", default=list(SCENARIOS), choices=list(SCENARIOS))
    parser.add_argument("--show", type=int, default=12, help="how many disagreements to detail")
    args = parser.parse_args()

    os.chdir(ROOT)
    failed = False
    for name in args.scenarios:
        harness = Harness(args.apworld, name)
        seen = harness.run(args.inventories, args.seed, args.show)
        print(f"[{name}] {len(harness.pairs)} locations x {args.inventories} inventories "
              f"({len(harness.untracked)} apworld locations have no tracker section): "
              f"{len(seen)} disagreeing section(s)")
        for (section, path), entry in sorted(seen.items(), key=lambda kv: -(kv[1]["ap"] + kv[1]["tracker"]))[:args.show]:
            owned, counted = entry["inv"]
            minimal = harness.minimal_inventory(section, path, owned, counted)
            who = "tracker too strict" if entry["ap"] > entry["tracker"] else "tracker too permissive"
            print(f"    {section} [{path}] ({entry['kind']}, {who}: AP-only {entry['ap']}, tracker-only {entry['tracker']})"
                  f"\n        e.g. {minimal} + counts { {k: v for k, v in counted.items() if v} }")
        failed |= bool(seen)
    sys.exit(1 if failed else 0)


if __name__ == "__main__":
    main()
