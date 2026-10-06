#!/usr/bin/env python3
"""
Generate the 90 photographable Lucky Emblem spots of the tracker.

Input : the apworld's worlds/kh3/data/lucky_emblem_spots.json (path as argument)
Outputs (idempotent -- re-running replaces what a previous run wrote):
  - items/lucky_emblem_spots.json       one toggle per spot (lucky_emblem_spot_NNN)
  - locations/lucky_emblem_spots.json   one pin per spot, hosting its toggle

The spots are not AP locations: the KH3 client stores the photographed ones in
the AP DataStorage key kh3_lucky_emblems_<team>_<slot> ({"<global_id>": true}),
and autotracking.lua mirrors that key onto the toggles. Each pin's access rule
reuses LUCKY_EMBLEM_SPOTS of logic.lua through $can_reach_emblem_spot|<id>.

Pin coordinates are the green Mickey markers already printed on the map
images; the number beside each marker is the spot's world_index (same order
as the apworld catalog, which follows the GameFAQs guide).

Usage:  generate_lucky_emblem_spots.py <path/to/lucky_emblem_spots.json>
"""
import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[2]
ITEMS_JSON = ROOT / "items/lucky_emblem_spots.json"
LOCATIONS_JSON = ROOT / "locations/lucky_emblem_spots.json"
ICON = "images/items/Lucky Emblems.png"

# global_id -> [(map, x, y), ...]; several pins when the guide prints the
# spot on more than one map (Arendelle's labyrinth configurations A and B).
PINS = {
    # Olympus
    1: [("map_olympus_thebes", 503, 478)],
    2: [("map_olympus_thebes", 309, 272)],
    3: [("map_olympus_thebes", 102, 278)],
    4: [("map_olympus_thebes", 674, 654)],
    5: [("map_olympus_mount_olympus_p1", 421, 654)],
    6: [("map_olympus_mount_olympus_p1", 517, 127)],
    7: [("map_olympus_mount_olympus_p1", 542, 408)],
    8: [("map_olympus_mount_olympus_p2", 479, 279)],
    9: [("map_olympus_realm_of_the_gods", 459, 340)],
    10: [("map_olympus_realm_of_the_gods", 398, 256)],
    11: [("map_olympus_realm_of_the_gods", 158, 316)],
    12: [("map_olympus_realm_of_the_gods", 227, 657)],
    # Twilight Town (2 rides the moving tram: pinned on the map's note)
    13: [("map_twilight_town", 91, 369)],
    14: [("map_twilight_town", 44, 255)],
    15: [("map_twilight_town", 94, 447)],
    16: [("map_twilight_town", 349, 198)],
    17: [("map_twilight_town", 294, 354)],
    18: [("map_twilight_town", 454, 442)],
    19: [("map_twilight_town", 425, 467)],
    20: [("map_twilight_town", 645, 453)],
    21: [("map_twilight_town", 627, 106)],
    # Toy Box
    22: [("map_toybox_andys_house", 660, 631)],
    23: [("map_toybox_andys_house", 193, 455)],
    24: [("map_toybox_andys_house", 436, 393)],
    25: [("map_toybox_andys_house", 586, 83)],
    26: [("map_toybox_galaxy_1st_top", 277, 344)],
    27: [("map_toybox_galaxy_1st_top", 184, 70)],
    28: [("map_toybox_galaxy_2nd_vents", 577, 127)],
    29: [("map_toybox_galaxy_3rd", 514, 292)],
    30: [("map_toybox_galaxy_3rd", 688, 259)],
    31: [("map_toybox_galaxy_3rd", 509, 502)],
    32: [("map_toybox_galaxy_1st_top", 130, 500)],
    # Kingdom of Corona
    33: [("map_corona_hills_a", 669, 279)],
    34: [("map_corona_marsh", 273, 142)],
    35: [("map_corona_campsite", 92, 420)],
    36: [("map_corona_campsite", 726, 203)],
    37: [("map_corona_kingdom", 534, 207)],
    38: [("map_corona_kingdom", 495, 28)],
    39: [("map_corona_kingdom", 311, 193)],
    40: [("map_corona_kingdom", 462, 387)],
    41: [("map_corona_kingdom", 67, 442)],
    # Monstropolis (map_monstropolis_door_vault also holds Power Plant 2/2)
    42: [("map_monstropolis_monsters_inc", 552, 150)],
    43: [("map_monstropolis_monsters_inc", 593, 279)],
    44: [("map_monstropolis_monsters_inc", 492, 238)],
    45: [("map_monstropolis_monsters_inc", 18, 364)],
    46: [("map_monstropolis_factory", 511, 349)],
    47: [("map_monstropolis_factory", 471, 174)],
    48: [("map_monstropolis_factory", 358, 408)],
    49: [("map_monstropolis_power_plant", 367, 25)],
    50: [("map_monstropolis_power_plant", 47, 500)],
    51: [("map_monstropolis_door_vault", 502, 97)],
    52: [("map_monstropolis_door_vault", 504, 486)],
    # Arendelle
    53: [("map_arendelle_treescape", 303, 139)],
    54: [("map_arendelle_lab_middle", 73, 200)],
    55: [("map_arendelle_lab_mid_lower", 62, 218), ("map_arendelle_lab_mid_lower", 569, 76)],
    56: [("map_arendelle_lab_mid_lower", 120, 54), ("map_arendelle_lab_mid_lower", 704, 197)],
    57: [("map_arendelle_lab_upper", 69, 88)],
    58: [("map_arendelle_gorge", 235, 143)],
    59: [("map_arendelle_frozen_wall", 280, 147)],
    60: [("map_arendelle_frozen_wall", 55, 141)],
    61: [("map_arendelle_snowfield", 565, 235)],
    62: [("map_arendelle_snowfield", 241, 392)],
    63: [("map_arendelle_foothills", 89, 225)],
    # The Caribbean
    64: [("map_caribbean_port_royal", 165, 211)],
    65: [("map_caribbean_port_royal", 143, 392)],
    66: [("map_caribbean_port_royal", 211, 497)],
    67: [("map_caribbean_port_royal", 274, 497)],
    68: [("map_caribbean_port_royal", 646, 335)],
    69: [("map_caribbean_port_royal", 618, 438)],
    70: [("map_caribbean_isla_verdemontana", 216, 465)],
    71: [("map_caribbean_isle_of_luck", 200, 198)],
    72: [("map_caribbean_horseshoe_island", 164, 261)],
    73: [("map_caribbean_isla_mastiles", 18, 289)],
    74: [("map_caribbean_ships_end", 456, 428)],
    75: [("map_caribbean_sandbar_isle", 463, 584)],
    76: [("map_caribbean_sandbar_isle", 426, 596)],
    # San Fransokyo (9 and 11 share one marker labelled "9, 11")
    77: [("map_sanfransokyo", 367, 931)],
    78: [("map_sanfransokyo", 337, 835)],
    79: [("map_sanfransokyo", 154, 735)],
    80: [("map_sanfransokyo", 77, 678)],
    81: [("map_sanfransokyo", 228, 446)],
    82: [("map_sanfransokyo", 345, 359)],
    83: [("map_sanfransokyo", 556, 312)],
    84: [("map_sanfransokyo", 425, 107)],
    85: [("map_sanfransokyo", 352, 152)],
    86: [("map_sanfransokyo", 220, 109)],
    87: [("map_sanfransokyo", 368, 152)],
    # 100 Acre Wood (the map is three photos of the emblems themselves)
    88: [("map_100AcreWoods_rabbitHouse", 810, 562)],
    89: [("map_100AcreWoods_rabbitHouse", 404, 492)],
    90: [("map_100AcreWoods_rabbitHouse", 291, 190)],
}


def code(global_id):
    return f"lucky_emblem_spot_{global_id:03d}"


def main():
    if len(sys.argv) != 2:
        sys.exit(__doc__)
    catalog = json.loads(Path(sys.argv[1]).read_text(encoding="utf-8"))
    spots = sorted(catalog["spots"], key=lambda s: s["global_id"])
    ids = [s["global_id"] for s in spots]
    if ids != list(range(1, 91)) or set(PINS) != set(ids):
        sys.exit("catalog spots and PINS must both cover global ids 1..90")

    items = [
        {
            "name": f"{s['friendly_name']} (Global {s['global_id']})",
            "type": "toggle",
            "codes": code(s["global_id"]),
            "img": ICON,
        }
        for s in spots
    ]

    worlds = {}
    for s in spots:
        worlds.setdefault(s["world"], []).append({
            "name": s["friendly_name"],
            "sections": [{
                "name": s["location"],
                "hosted_item": code(s["global_id"]),
                "access_rules": [f"$can_reach_emblem_spot|{s['global_id']}"],
            }],
            "map_locations": [
                {"map": m, "x": x, "y": y} for m, x, y in PINS[s["global_id"]]
            ],
        })
    locations = [{
        "name": "Lucky Emblem Spots",
        "visibility_rules": ["active_lucky_emblems"],
        "children": [
            {"name": world, "children": children}
            for world, children in worlds.items()
        ],
    }]

    for path, data in ((ITEMS_JSON, items), (LOCATIONS_JSON, locations)):
        path.write_text(json.dumps(data, indent=2, ensure_ascii=False) + "\n", encoding="utf-8")
        print(f"wrote {path.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
