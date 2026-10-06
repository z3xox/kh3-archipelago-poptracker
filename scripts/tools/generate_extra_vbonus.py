#!/usr/bin/env python3
"""
Add the two extra rewards of every victory bonus ("<parent> - Reward 2" / "- Reward 3").

The apworld (ExtraVictoryBonuses.py) gives each victory bonus two more checks in
every seed, opened with their parent (CanReachLocation(parent)) and filled from
the shared pool. The tracker shows them as two more sections right after the
parent's, with the parent's access and visibility rules.

Inputs : scripts/tools/extracted_locations.json  (key "extra_vbonus_locations")
         scripts/autotracking/location_mapping.lua (parent and extra codes, written
                                                    by sync_location_names.py)
Outputs (idempotent -- re-running replaces what a previous run wrote):
  - locations/*.json    the two sections after each parent section, and two refs
                        after each ref to it (world files and Overworld mirrors)
  - scripts/autotracking/autotracking.lua  OVERWORLD_SECTION_MAP block between markers

Run order:  dump_apworld_catalog.py -> sync_location_names.py -> generate_extra_vbonus.py
"""
import json
import re
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
DUMP = ROOT / "scripts/tools/extracted_locations.json"
MAPPING = ROOT / "scripts/autotracking/location_mapping.lua"
AUTOTRACKING = ROOT / "scripts/autotracking/autotracking.lua"
BEGIN = "    -- BEGIN generated: extra victory bonus rewards (scripts/tools/generate_extra_vbonus.py)"
END = "    -- END generated: extra victory bonus rewards"
EXTRA_RE = re.compile(r" - Reward [23]$")
COPIED = ("access_rules", "visibility_rules")


def read_text(path):
    return path.read_bytes().decode("utf-8").replace("\r\n", "\n")


def write_text(path, text):
    crlf = path.exists() and b"\r\n" in path.read_bytes()
    path.write_bytes((text.replace("\n", "\r\n") if crlf else text).encode("utf-8"))


def load_extras():
    """{(parent location, parent section): [extra section names]}"""
    codes = dict((int(i), c[1:].split("/", 1)) for i, c in
                 re.findall(r'\[(\d+)\]\s*=\s*\{\s*code\s*=\s*"([^"]+)"', read_text(MAPPING)))
    extras = {}
    for row in json.loads(read_text(DUMP))["extra_vbonus_locations"]:
        if row["parent_ap_id"] not in codes or row["ap_id"] not in codes:
            continue  # parent excluded from the tracker
        parent = tuple(codes[row["parent_ap_id"]])
        extras.setdefault(parent, []).append(codes[row["ap_id"]][1])
    return extras


def rewrite_sections(node, extras, by_ref_target, counts):
    for child in node.get("children", []) or []:
        rewrite_sections(child, extras, by_ref_target, counts)
    sections = node.get("sections")
    if not sections:
        return
    out = []
    for section in sections:
        if EXTRA_RE.search(section["name"]) and section.get("generated_extra_vbonus"):
            continue  # dropped, re-added below from its parent
        out.append(section)
        if "ref" in section:
            target_loc, target_sec = section["ref"].rsplit("/", 2)[-2:]
            target = by_ref_target.get(target_loc, {}).get(target_sec)
            if target:
                prefix = section["ref"][: -len(target_sec)]
                for name in target:
                    out.append({"name": name, "ref": prefix + name, "generated_extra_vbonus": True})
                    counts["refs"] += 1
        else:
            names = extras.get((node["name"], section["name"]))
            if names:
                for name in names:
                    extra = {"name": name, "item_count": 1}
                    extra.update({k: section[k] for k in COPIED if k in section})
                    extra["generated_extra_vbonus"] = True
                    out.append(extra)
                    counts["sections"] += 1
    node["sections"] = out


def strip_marker(node):
    for section in node.get("sections", []) or []:
        section.pop("generated_extra_vbonus", None)
    for child in node.get("children", []) or []:
        strip_marker(child)


def main():
    extras = load_extras()
    # A ref names "<...>/<parent location>/<parent section>": index by both halves.
    by_ref_target = {}
    for (loc, sec), names in extras.items():
        by_ref_target.setdefault(loc, {})[sec] = names
    counts = {"sections": 0, "refs": 0}
    generated = set(n for names in extras.values() for n in names)
    for path in sorted((ROOT / "locations").glob("*.json")):
        docs = json.loads(read_text(path))
        before = json.dumps(docs)

        def mark(node):  # recognise sections a previous run wrote
            for s in node.get("sections", []) or []:
                if s["name"] in generated:
                    s["generated_extra_vbonus"] = True
            for c in node.get("children", []) or []:
                mark(c)
        for top in docs:
            mark(top)
            rewrite_sections(top, extras, by_ref_target, counts)
            strip_marker(top)
        if json.dumps(docs) != before:
            write_text(path, json.dumps(docs, indent=2, ensure_ascii=False) + "\n")

    # Overworld mirrors are also cleared through OVERWORLD_SECTION_MAP, keyed by section name.
    text = read_text(AUTOTRACKING)
    pattern = re.compile(re.escape(BEGIN) + r".*?" + re.escape(END) + r"\n", re.S)
    text = pattern.sub("", text)
    mirror = dict(re.findall(r'^\s*\["([^"]+)"\]\s*=\s*"@([^/"]+)/', text, re.M))
    lines = [f'    ["{name}"] = "@{mirror[sec]}/{name}",'
             for (_, sec), names in sorted(extras.items()) if sec in mirror for name in names]
    block = "\n".join([BEGIN, *lines, END]) + "\n"
    anchor = "OVERWORLD_SECTION_MAP = {\n"
    head, sep, rest = text.partition(anchor)
    assert sep, "OVERWORLD_SECTION_MAP not found"
    write_text(AUTOTRACKING, head + sep + block + rest)
    print(f"{len(generated)} extra rewards: {counts['sections']} sections, {counts['refs']} refs, "
          f"{len(lines)} Overworld map entries")


if __name__ == "__main__":
    main()
