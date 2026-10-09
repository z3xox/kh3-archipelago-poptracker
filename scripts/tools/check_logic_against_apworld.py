#!/usr/bin/env python3
"""
Differential test of the tracker's logic against the apworld's real rules.

What it does
------------
1. Installs the apworld into an Archipelago source checkout (--ap-root) and
   builds a real one-player multiworld with every optional location pool on,
   so the apworld's own rules (rule_builder since 0.17) answer can_reach.
2. Evaluates the tracker on the same inventories: locations/*.json access_rules
   (parents ANDed with sections, "parent" attachments, bracketed tokens counted
   as required) and the $functions of scripts/logic.lua, executed in Lua.
3. Draws random inventories, and reports every location where the two
   disagree, with a minimal inventory that shows it.

It covers what check_pack_schema / sync_access_rules cannot: world access
(portal keyblades, tiers), Twilight Town / Caribbean gates, level-ups, Lucky
Emblems, Coliseum cups, Moogle Workshop, classic kingdom, ingredients.

Settings are modelled as "everything on": every optional pool active (see
EVERYTHING_ON), Lucky Emblems per check = vanilla milestones.

Scenarios: plain, starts (start_with_* unlocks), base (default base abilities),
hearts (goal = 7 Heart Pieces), levels_shared / levels_each (Keyblade Levels
shuffled / keyblade upgrade sanity, with random Progressive Keyblade Level counts).
The other scenarios use "start at max".

Needs `pip install lupa` and an Archipelago source checkout with its
requirements installed (--ap-root, or the AP_ROOT environment variable); the
checkout's worlds/kh3 is replaced by the apworld under test.

Usage:
    python scripts/tools/check_logic_against_apworld.py --ap-root ../Archipelago --apworld kh3.apworld
    python scripts/tools/check_logic_against_apworld.py --inventories 3000 --seed 7
Exit status is 1 when a disagreement is found.
"""
import argparse
import collections
import importlib
import json
import os
import random
import re
import sys
import shutil
import zipfile
from pathlib import Path

if hasattr(sys.stdout, "reconfigure"):
    sys.stdout.reconfigure(encoding="utf-8", errors="replace")

ROOT = Path(__file__).resolve().parents[2]
VANILLA_EMBLEMS = {1, 3, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55, 60, 65, 70, 80, 90}
HEART_PIECE = "Heart Piece"


# ------------------------------------------------------------------ fake Archipelago
# Options that create every optional location; pools left at junk still exist.
EVERYTHING_ON = dict(include_space=True, include_grindy_space_missions=True, include_space_superbosses=True,
                     chestsanity=True, classic_kingdom_checks="high_score", ingredients="ingredientsanity_plus",
                     music_chest_bonus_checks=True, moogle_shop_checks=20, battlegates_pool="randomize",
                     olympus_coliseum_pool="randomize", kh02_objectives=[str(n) for n in range(1, 52)])

SCENARIOS = {
    "plain": dict(unlocks=(), base=False, goal="three_proofs", levels=0),
    "starts": dict(unlocks=("start_with_wall_run", "start_with_magic", "start_with_attraction_flow",
                            "start_with_links"), base=False, goal="three_proofs", levels=0),
    "base": dict(unlocks=(), base=True, goal="three_proofs", levels=0),
    "hearts": dict(unlocks=(), base=False, goal="seven_heart_pieces", levels=0),
    "levels_shared": dict(unlocks=(), base=False, goal="three_proofs", levels=1),
    "levels_each": dict(unlocks=(), base=False, goal="three_proofs", levels=2),
    # Portal Unlocks = party members; the tracker learns it from slot_data as the portal_party code.
    "party": dict(unlocks=(), base=False, goal="three_proofs", levels=0,
                  options=dict(portal_unlocks="party_members"), codes=("portal_party",)),
}
SHARED_LEVEL_ITEM = "Progressive Keyblade Level"


# ------------------------------------------------------------------ one scenario
class Harness:
    def __init__(self, apworld, ap_root, scenario):
        self.scenario = SCENARIOS[scenario]
        self.load_apworld(apworld, ap_root)
        self.build_ap_world()
        self.build_tracker()
        self.pair_locations()

    def load_apworld(self, apworld, ap_root):
        target = ap_root / "worlds" / "kh3"
        shutil.rmtree(target, ignore_errors=True)
        with zipfile.ZipFile(apworld) as archive:
            archive.extractall(ap_root / "worlds")
        os.chdir(ap_root)
        sys.path.insert(0, str(ap_root))
        self.Data = importlib.import_module("worlds.kh3.Data")
        data = self.Data.load_extracted_data()
        self.catalog = data["locations"]
        self.base_id = data.get("meta", {}).get("base_location_id", 1263022848)

    def build_ap_world(self):
        from argparse import Namespace
        from BaseClasses import CollectionState, MultiWorld
        from worlds import AutoWorld
        sc = self.scenario
        values = dict(EVERYTHING_ON, goal=sc["goal"], keyblade_levels=sc["levels"],
                      default_base_abilities=sc["base"], **{name: True for name in sc["unlocks"]},
                      **sc.get("options", {}))
        world_cls = AutoWorld.AutoWorldRegister.world_types["Kingdom Hearts III"]
        self.mw = MultiWorld(1)
        self.mw.game[1] = world_cls.game
        self.mw.player_name = {1: "Tester"}
        self.mw.set_seed(1)
        args = Namespace(**{name: {1: option.from_any(values.get(name, option.default))}
                            for name, option in world_cls.options_dataclass.type_hints.items()})
        self.mw.set_options(args)
        self.mw.state = CollectionState(self.mw)
        for step in ("generate_early", "create_regions", "create_items", "set_rules", "connect_entrances"):
            AutoWorld.call_all(self.mw, step)
        self.world = self.mw.worlds[1]
        # Precollected unlocks (start_with_*, base abilities) are in every state already;
        # the tracker gets them from slot_data, modelled here as owned items.
        self.free = {item.name for item in self.mw.precollected_items[1]}
        if sc["base"]:  # Rules.py adds these to the logic without precollecting them
            self.free |= set(self.Data.DEFAULT_BASE_ABILITY_ITEM_NAMES)
        self.free.add("Unlock: Airstep")

    def build_tracker(self):
        try:
            from lupa import LuaRuntime
        except ImportError:
            raise SystemExit("error: this check needs lupa (pip install lupa)")
        mapping = (ROOT / "scripts/autotracking/item_mapping.lua").read_text(encoding="utf-8")
        self.name_to_code = dict(re.findall(r'\["([^"]+)"\]\s*=\s*\{\s*code\s*=\s*"([^"]+)"', mapping))
        # `also` switches on a second toggle (Endymion: its ship and its own gate).
        self.name_to_also = dict(re.findall(r'\["([^"]+)"\]\s*=\s*\{[^}]*also\s*=\s*"([^"]+)"', mapping))
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
        # Chestsanity: the seed's chest keyblades, as LoadChestKeyblades reads them from slot_data.
        ids = {location.name: location.address for location in self.mw.get_locations(1)}
        chest_keyblade = self.lua.eval("CHEST_KEYBLADE")
        for row in self.world.active_locations:
            blade = row.get("keyblade_chest_keyblade")
            if blade and not row.get("keyblade_chest_native") and ids.get(row["name"]):
                chest_keyblade[ids[row["name"]]] = self.name_to_code[blade]

        self.occurrences = collections.defaultdict(list)  # section -> [(file, rule chain)]
        registry = {}
        by_ref = {}  # "Location/.../Section" -> rule chain, for "ref" sections
        refs = []

        def walk(node, chain, path, names):
            if "parent" in node and not chain:
                chain = registry.get(node["parent"], [])
            chain = chain + [node.get("access_rules")]
            names = names + [node["name"]]
            registry[node["name"]] = chain
            for section in node.get("sections", []) or []:
                if "ref" in section:
                    refs.append((section["name"], path, section["ref"]))
                    continue
                section_chain = chain + [section.get("access_rules")]
                by_ref["/".join(names + [section["name"]])] = section_chain
                self.occurrences[section["name"]].append((path, section_chain))
            for child in node.get("children", []) or []:
                walk(child, chain, path, names)

        order = re.findall(r'AddLocations\("locations/([^"]+)"\)',
                           (ROOT / "scripts/locations.lua").read_text(encoding="utf-8"))
        for name in order:
            if name == "overworld.json":
                continue
            for node in json.loads((ROOT / "locations" / name).read_text(encoding="utf-8")):
                walk(node, [], name, [])
        # A "ref" section mirrors its target, rules included.
        for section_name, path, ref in refs:
            if ref in by_ref:
                self.occurrences[section_name].append((path, by_ref[ref]))

    def pair_locations(self):
        mapping = (ROOT / "scripts/autotracking/location_mapping.lua").read_text(encoding="utf-8")
        id_to_section = {int(i): c.split("/", 1)[1]
                         for i, c in re.findall(r'\[(\d+)\]\s*=\s*\{\s*code\s*=\s*"([^"]+)"', mapping)}
        rows_by_name = {row["name"]: row for row in self.catalog}
        self.pairs, self.untracked = [], []
        for location in self.mw.get_locations(1):
            if location.address is None:
                continue  # events
            row = rows_by_name.get(location.name, {"type": "?"})
            section = id_to_section.get(location.address)
            if section is None or section not in self.occurrences:
                self.untracked.append(location.name)
                continue
            self.pairs.append((row, section, location))

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
        for name, copies in counted.items():
            ap_counts[name] = copies
        # Several items can share one code (the Gummi special weapons), which then counts them.
        counts = collections.Counter()
        for name, copies in ap_counts.items():
            if name in self.name_to_code:
                counts[self.name_to_code[name]] += copies
            if name in self.name_to_also and copies:
                counts[self.name_to_also[name]] = 1
        counts["unlock_airstep"] = 1
        for code in self.scenario.get("codes", ()):
            counts[code] = 1
        from BaseClasses import CollectionState
        state = CollectionState(self.mw)
        for name, copies in ap_counts.items():
            for _ in range(copies - state.count(name, 1)):
                state.collect(self.world.create_item(name), True)
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
    parser.add_argument("--ap-root", type=Path, default=os.environ.get("AP_ROOT"),
                        help="Archipelago source checkout (its worlds/kh3 is replaced)")
    parser.add_argument("--inventories", type=int, default=600, help="random inventories per scenario")
    parser.add_argument("--seed", type=int, default=1)
    parser.add_argument("--scenarios", nargs="*", default=list(SCENARIOS), choices=list(SCENARIOS))
    parser.add_argument("--show", type=int, default=12, help="how many disagreements to detail")
    args = parser.parse_args()

    if args.ap_root is None:
        parser.error("--ap-root (or AP_ROOT) is required")
    apworld, ap_root = args.apworld.resolve(), args.ap_root.resolve()
    os.chdir(ROOT)
    failed = False
    for name in args.scenarios:
        harness = Harness(apworld, ap_root, name)
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
