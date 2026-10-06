#!/usr/bin/env python3
"""
Add the checks that hang off another check, next to their parent section.

- Extra victory bonus rewards (ExtraVictoryBonuses.py): every victory bonus has
  "<parent> - Reward 2" and "- Reward 3" in every seed, opened with the parent.
- Song Bonuses (MelodyOfMemory.music_chest_bonus_locations): opening a music
  chest (a converted vanilla chest or an authored Melody Chest) gives
  "<chest> - Song Bonus", opened with the chest. Which chests are music chests is
  the seed's draw: the section is only visible when its id is among the seed's
  checks ($song_bonus|<ap id>, filled from slot_data by autotracking.lua).

Each child section copies its parent's access and visibility rules.

Inputs : scripts/tools/extracted_locations.json  ("extra_vbonus_locations",
                                                   "song_bonus_locations")
         scripts/autotracking/location_mapping.lua (parent and child codes, written
                                                    by sync_location_names.py)
Outputs (idempotent -- re-running replaces what a previous run wrote):
  - locations/*.json    child sections after each parent section, and child refs
                        after each ref to it (world files and Overworld mirrors)
  - scripts/autotracking/autotracking.lua  OVERWORLD_SECTION_MAP block between markers

Run order:  dump_apworld_catalog.py -> sync_location_names.py -> generate_child_checks.py
"""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DUMP = ROOT / "scripts/tools/extracted_locations.json"
MAPPING = ROOT / "scripts/autotracking/location_mapping.lua"
AUTOTRACKING = ROOT / "scripts/autotracking/autotracking.lua"
BEGIN = "    -- BEGIN generated: child checks (scripts/tools/generate_child_checks.py)"
END = "    -- END generated: child checks"
OLD_BLOCKS = (("    -- BEGIN generated: extra victory bonus rewards", "    -- END generated: extra victory bonus rewards"),)
# dump key -> extra visibility atom of the child (None: the parent's visibility only)
FAMILIES = {
    "extra_vbonus_locations": None,
    "song_bonus_locations": "$song_bonus|{ap_id}",
}


def read_text(path):
    return path.read_bytes().decode("utf-8").replace("\r\n", "\n")


def write_text(path, text):
    crlf = path.exists() and b"\r\n" in path.read_bytes()
    path.write_bytes((text.replace("\n", "\r\n") if crlf else text).encode("utf-8"))


def load_children():
    """{(parent location, parent section): [(child section, extra visibility atom)]}"""
    codes = dict((int(i), c[1:].split("/", 1)) for i, c in
                 re.findall(r'\[(\d+)\]\s*=\s*\{\s*code\s*=\s*"([^"]+)"', read_text(MAPPING)))
    dump = json.loads(read_text(DUMP))
    children = {}
    for key, visibility in FAMILIES.items():
        for row in dump.get(key, []):
            if row["parent_ap_id"] not in codes or row["ap_id"] not in codes:
                continue  # parent excluded from the tracker
            atom = visibility.format(ap_id=row["ap_id"]) if visibility else None
            children.setdefault(tuple(codes[row["parent_ap_id"]]), []).append((codes[row["ap_id"]][1], atom))
    return children


def child_visibility(parent, atom):
    rules = parent.get("visibility_rules")
    if not atom:
        return rules
    return [f"{r},{atom}" for r in rules] if rules else [atom]


def rewrite(node, children, by_target, generated, counts):
    for child in node.get("children", []) or []:
        rewrite(child, children, by_target, generated, counts)
    sections = node.get("sections")
    if not sections:
        return
    out = []
    for section in sections:
        if section["name"] in generated:
            continue  # written by a previous run, re-added below from its parent
        out.append(section)
        if "ref" in section:
            target_loc, target_sec = section["ref"].rsplit("/", 2)[-2:]
            prefix = section["ref"][: -len(target_sec)]
            for name, _ in by_target.get((target_loc, target_sec), []):
                out.append({"name": name, "ref": prefix + name})
                counts["refs"] += 1
        else:
            for name, atom in children.get((node["name"], section["name"]), []):
                extra = {"name": name, "item_count": 1}
                if "access_rules" in section:
                    extra["access_rules"] = section["access_rules"]
                visibility = child_visibility(section, atom)
                if visibility:
                    extra["visibility_rules"] = visibility
                out.append(extra)
                counts["sections"] += 1
    node["sections"] = out


def main():
    children = load_children()
    generated = {name for names in children.values() for name, _ in names}
    counts = {"sections": 0, "refs": 0}
    for path in sorted((ROOT / "locations").glob("*.json")):
        docs = json.loads(read_text(path))
        before = json.dumps(docs)
        for top in docs:
            rewrite(top, children, children, generated, counts)
        if json.dumps(docs) != before:
            write_text(path, json.dumps(docs, indent=2, ensure_ascii=False) + "\n")

    # Overworld mirrors are also cleared through OVERWORLD_SECTION_MAP, keyed by section name.
    text = read_text(AUTOTRACKING)
    for begin, end in ((BEGIN, END), *OLD_BLOCKS):
        text = re.sub(re.escape(begin) + r".*?" + re.escape(end) + r"\n", "", text, flags=re.S)
    mirror = dict(re.findall(r'^\s*\["([^"]+)"\]\s*=\s*"@([^/"]+)/', text, re.M))
    lines = [f'    ["{name}"] = "@{mirror[sec]}/{name}",'
             for (_, sec), names in sorted(children.items()) if sec in mirror for name, _ in names]
    head, sep, rest = text.partition("OVERWORLD_SECTION_MAP = {\n")
    assert sep, "OVERWORLD_SECTION_MAP not found"
    write_text(AUTOTRACKING, head + sep + "\n".join([BEGIN, *lines, END]) + "\n" + rest)
    print(f"{len(generated)} child checks: {counts['sections']} sections, {counts['refs']} refs, "
          f"{len(lines)} Overworld map entries")


if __name__ == "__main__":
    main()
