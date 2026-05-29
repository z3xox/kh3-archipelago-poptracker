-- KH3 Archipelago Auto-Tracking
ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

OVERWORLD_SECTION_MAP = {
    ["Olympus - Large Chest 1"] = "@Olympus - All Checks/Olympus - Large Chest 1",
    ["Olympus - Large Chest 2"] = "@Olympus - All Checks/Olympus - Large Chest 2",
    ["Olympus - Large Chest 3"] = "@Olympus - All Checks/Olympus - Large Chest 3",
    ["Olympus - Large Chest 4"] = "@Olympus - All Checks/Olympus - Large Chest 4",
    ["Olympus - Small Chest 1"] = "@Olympus - All Checks/Olympus - Small Chest 1",
    ["Olympus - Small Chest 2"] = "@Olympus - All Checks/Olympus - Small Chest 2",
    ["Olympus - Small Chest 3"] = "@Olympus - All Checks/Olympus - Small Chest 3",
    ["Olympus - Small Chest 4"] = "@Olympus - All Checks/Olympus - Small Chest 4",
    ["Olympus - Small Chest 6"] = "@Olympus - All Checks/Olympus - Small Chest 6",
    ["Olympus - Small Chest 8"] = "@Olympus - All Checks/Olympus - Small Chest 8",
    ["Olympus - Small Chest 9"] = "@Olympus - All Checks/Olympus - Small Chest 9",
    ["Olympus - Small Chest 10"] = "@Olympus - All Checks/Olympus - Small Chest 10",
    ["Olympus - Small Chest 11"] = "@Olympus - All Checks/Olympus - Small Chest 11",
    ["Olympus - Small Chest 12"] = "@Olympus - All Checks/Olympus - Small Chest 12",
    ["Olympus - Small Chest 13"] = "@Olympus - All Checks/Olympus - Small Chest 13",
    ["Olympus - Small Chest 14"] = "@Olympus - All Checks/Olympus - Small Chest 14",
    ["Olympus - Small Chest 15"] = "@Olympus - All Checks/Olympus - Small Chest 15",
    ["Olympus - Small Chest 16"] = "@Olympus - All Checks/Olympus - Small Chest 16",
    ["Olympus - Small Chest 17"] = "@Olympus - All Checks/Olympus - Small Chest 17",
    ["Olympus - Small Chest 20"] = "@Olympus - All Checks/Olympus - Small Chest 20",
    ["Olympus - Small Chest 21"] = "@Olympus - All Checks/Olympus - Small Chest 21",
    ["Olympus - Small Chest 22"] = "@Olympus - All Checks/Olympus - Small Chest 22",
    ["Olympus - Small Chest 23"] = "@Olympus - All Checks/Olympus - Small Chest 23",
    ["Olympus - Small Chest 24"] = "@Olympus - All Checks/Olympus - Small Chest 24",
    ["Olympus - Small Chest 25"] = "@Olympus - All Checks/Olympus - Small Chest 25",
    ["Olympus - Small Chest 26"] = "@Olympus - All Checks/Olympus - Small Chest 26",
    ["Olympus - Small Chest 27"] = "@Olympus - All Checks/Olympus - Small Chest 27",
    ["Olympus - Small Chest 28"] = "@Olympus - All Checks/Olympus - Small Chest 28",
    ["Olympus - Small Chest 29"] = "@Olympus - All Checks/Olympus - Small Chest 29",
    ["Olympus - Small Chest 30"] = "@Olympus - All Checks/Olympus - Small Chest 30",
    ["Olympus - Small Chest 31"] = "@Olympus - All Checks/Olympus - Small Chest 31",
    ["Olympus - Small Chest 33"] = "@Olympus - All Checks/Olympus - Small Chest 33",
    ["Olympus - EVENT_001 - RandomizedItem"] = "@Olympus - All Checks/Olympus - EVENT_001 - RandomizedItem",
    ["Olympus - EVENT_002 - RandomizedItem"] = "@Olympus - All Checks/Olympus - EVENT_002 - RandomizedItem",
    ["Olympus - EVENT_003 - RandomizedItem"] = "@Olympus - All Checks/Olympus - EVENT_003 - RandomizedItem",
    ["Olympus - EVENT_004 - RandomizedItem"] = "@Olympus - All Checks/Olympus - EVENT_004 - RandomizedItem",
    ["Olympus - EVENT_005 - RandomizedItem"] = "@Olympus - All Checks/Olympus - EVENT_005 - RandomizedItem",
    ["Olympus - EVENT_006 - RandomizedItem"] = "@Olympus - All Checks/Olympus - EVENT_006 - RandomizedItem",
    ["Olympus - EVENT_007 - RandomizedItem"] = "@Olympus - All Checks/Olympus - EVENT_007 - RandomizedItem",
    ["Olympus - EVENT_KEYBLADE_001 - RandomizedItem"] = "@Olympus - All Checks/Olympus - EVENT_KEYBLADE_001 - RandomizedItem",
    ["Olympus - Victory Bonus 001"] = "@Olympus - All Checks/Olympus - Victory Bonus 001",
    ["Olympus - Victory Bonus 002"] = "@Olympus - All Checks/Olympus - Victory Bonus 002",
    ["Olympus - Victory Bonus 004"] = "@Olympus - All Checks/Olympus - Victory Bonus 004",
    ["Olympus - Victory Bonus 005"] = "@Olympus - All Checks/Olympus - Victory Bonus 005",
    ["Olympus - Victory Bonus 006"] = "@Olympus - All Checks/Olympus - Victory Bonus 006",
    ["Olympus - Victory Bonus 007"] = "@Olympus - All Checks/Olympus - Victory Bonus 007",
    ["Olympus - Victory Bonus 008"] = "@Olympus - All Checks/Olympus - Victory Bonus 008",
    ["Olympus - Victory Bonus 010"] = "@Olympus - All Checks/Olympus - Victory Bonus 010",
    ["Olympus - Victory Bonus 011"] = "@Olympus - All Checks/Olympus - Victory Bonus 011",
    ["Olympus - Victory Bonus 013"] = "@Olympus - All Checks/Olympus - Victory Bonus 013",
    ["Olympus - Victory Bonus 082"] = "@Olympus - All Checks/Olympus - Victory Bonus 082",
    ["Twilight Town - Large Chest 1"] = "@Twilight Town - All Checks/Twilight Town - Large Chest 1",
    ["Twilight Town - Small Chest 1"] = "@Twilight Town - All Checks/Twilight Town - Small Chest 1",
    ["Twilight Town - Small Chest 2"] = "@Twilight Town - All Checks/Twilight Town - Small Chest 2",
    ["Twilight Town - Small Chest 3"] = "@Twilight Town - All Checks/Twilight Town - Small Chest 3",
    ["Twilight Town - Small Chest 4"] = "@Twilight Town - All Checks/Twilight Town - Small Chest 4",
    ["Twilight Town - Small Chest 5"] = "@Twilight Town - All Checks/Twilight Town - Small Chest 5",
    ["Twilight Town - Small Chest 6"] = "@Twilight Town - All Checks/Twilight Town - Small Chest 6",
    ["Twilight Town - Small Chest 7"] = "@Twilight Town - All Checks/Twilight Town - Small Chest 7",
    ["Twilight Town - Small Chest 8"] = "@Twilight Town - All Checks/Twilight Town - Small Chest 8",
    ["Twilight Town - Small Chest 9"] = "@Twilight Town - All Checks/Twilight Town - Small Chest 9",
    ["Twilight Town - EVENT_KEYBLADE_002 - RandomizedItem"] = "@Twilight Town - All Checks/Twilight Town - EVENT_KEYBLADE_002 - RandomizedItem",
    ["Twilight Town - EVENT_KEYBLADE_010 - RandomizedItem"] = "@Twilight Town - All Checks/Twilight Town - EVENT_KEYBLADE_010 - RandomizedItem",
    ["Twilight Town - EVENT_CKGAME_001 - RandomizedItem"] = "@Twilight Town - All Checks/Twilight Town - EVENT_CKGAME_001 - RandomizedItem",
    ["Twilight Town - Victory Bonus 014"] = "@Twilight Town - All Checks/Twilight Town - Victory Bonus 014",
    ["Twilight Town - Victory Bonus 015"] = "@Twilight Town - All Checks/Twilight Town - Victory Bonus 015",
    ["Twilight Town - Victory Bonus 016"] = "@Twilight Town - All Checks/Twilight Town - Victory Bonus 016",
    ["Toy Box - Large Chest 1"] = "@Toy Box - All Checks/Toy Box - Large Chest 1",
    ["Toy Box - Large Chest 2"] = "@Toy Box - All Checks/Toy Box - Large Chest 2",
    ["Toy Box - Large Chest 3"] = "@Toy Box - All Checks/Toy Box - Large Chest 3",
    ["Toy Box - Large Chest 4"] = "@Toy Box - All Checks/Toy Box - Large Chest 4",
    ["Toy Box - Large Chest 5"] = "@Toy Box - All Checks/Toy Box - Large Chest 5",
    ["Toy Box - Large Chest 6"] = "@Toy Box - All Checks/Toy Box - Large Chest 6",
    ["Toy Box - Small Chest 1"] = "@Toy Box - All Checks/Toy Box - Small Chest 1",
    ["Toy Box - Small Chest 2"] = "@Toy Box - All Checks/Toy Box - Small Chest 2",
    ["Toy Box - Small Chest 3"] = "@Toy Box - All Checks/Toy Box - Small Chest 3",
    ["Toy Box - Small Chest 4"] = "@Toy Box - All Checks/Toy Box - Small Chest 4",
    ["Toy Box - Small Chest 5"] = "@Toy Box - All Checks/Toy Box - Small Chest 5",
    ["Toy Box - Small Chest 6"] = "@Toy Box - All Checks/Toy Box - Small Chest 6",
    ["Toy Box - Small Chest 7"] = "@Toy Box - All Checks/Toy Box - Small Chest 7",
    ["Toy Box - Small Chest 8"] = "@Toy Box - All Checks/Toy Box - Small Chest 8",
    ["Toy Box - Small Chest 9"] = "@Toy Box - All Checks/Toy Box - Small Chest 9",
    ["Toy Box - Small Chest 11"] = "@Toy Box - All Checks/Toy Box - Small Chest 11",
    ["Toy Box - Small Chest 12"] = "@Toy Box - All Checks/Toy Box - Small Chest 12",
    ["Toy Box - Small Chest 13"] = "@Toy Box - All Checks/Toy Box - Small Chest 13",
    ["Toy Box - Small Chest 14"] = "@Toy Box - All Checks/Toy Box - Small Chest 14",
    ["Toy Box - Small Chest 15"] = "@Toy Box - All Checks/Toy Box - Small Chest 15",
    ["Toy Box - Small Chest 16"] = "@Toy Box - All Checks/Toy Box - Small Chest 16",
    ["Toy Box - Small Chest 17"] = "@Toy Box - All Checks/Toy Box - Small Chest 17",
    ["Toy Box - Small Chest 18"] = "@Toy Box - All Checks/Toy Box - Small Chest 18",
    ["Toy Box - Small Chest 19"] = "@Toy Box - All Checks/Toy Box - Small Chest 19",
    ["Toy Box - Small Chest 20"] = "@Toy Box - All Checks/Toy Box - Small Chest 20",
    ["Toy Box - Small Chest 22"] = "@Toy Box - All Checks/Toy Box - Small Chest 22",
    ["Toy Box - Small Chest 23"] = "@Toy Box - All Checks/Toy Box - Small Chest 23",
    ["Toy Box - Small Chest 24"] = "@Toy Box - All Checks/Toy Box - Small Chest 24",
    ["Toy Box - Small Chest 25"] = "@Toy Box - All Checks/Toy Box - Small Chest 25",
    ["Toy Box - EVENT_KEYBLADE_003 - RandomizedItem"] = "@Toy Box - All Checks/Toy Box - EVENT_KEYBLADE_003 - RandomizedItem",
    ["Toy Box - EVENT_HEARTBINDER_002 - RandomizedItem"] = "@Toy Box - All Checks/Toy Box - EVENT_HEARTBINDER_002 - RandomizedItem",
    ["Toy Box - Victory Bonus 017"] = "@Toy Box - All Checks/Toy Box - Victory Bonus 017",
    ["Toy Box - Victory Bonus 018"] = "@Toy Box - All Checks/Toy Box - Victory Bonus 018",
    ["Toy Box - Victory Bonus 019"] = "@Toy Box - All Checks/Toy Box - Victory Bonus 019",
    ["Toy Box - Victory Bonus 020"] = "@Toy Box - All Checks/Toy Box - Victory Bonus 020",
    ["Toy Box - Victory Bonus 021"] = "@Toy Box - All Checks/Toy Box - Victory Bonus 021",
    ["Toy Box - Victory Bonus 022"] = "@Toy Box - All Checks/Toy Box - Victory Bonus 022",
    ["Toy Box - Victory Bonus 023"] = "@Toy Box - All Checks/Toy Box - Victory Bonus 023",
    ["Kingdom of Corona - Large Chest 1"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Large Chest 1",
    ["Kingdom of Corona - Large Chest 2"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Large Chest 2",
    ["Kingdom of Corona - Large Chest 3"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Large Chest 3",
    ["Kingdom of Corona - Large Chest 4"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Large Chest 4",
    ["Kingdom of Corona - Large Chest 5"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Large Chest 5",
    ["Kingdom of Corona - Large Chest 6"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Large Chest 6",
    ["Kingdom of Corona - Small Chest 1"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 1",
    ["Kingdom of Corona - Small Chest 2"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 2",
    ["Kingdom of Corona - Small Chest 3"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 3",
    ["Kingdom of Corona - Small Chest 4"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 4",
    ["Kingdom of Corona - Small Chest 5"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 5",
    ["Kingdom of Corona - Small Chest 6"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 6",
    ["Kingdom of Corona - Small Chest 7"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 7",
    ["Kingdom of Corona - Small Chest 8"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 8",
    ["Kingdom of Corona - Small Chest 9"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 9",
    ["Kingdom of Corona - Small Chest 10"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 10",
    ["Kingdom of Corona - Small Chest 11"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 11",
    ["Kingdom of Corona - Small Chest 12"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 12",
    ["Kingdom of Corona - Small Chest 13"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 13",
    ["Kingdom of Corona - Small Chest 14"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 14",
    ["Kingdom of Corona - Small Chest 15"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 15",
    ["Kingdom of Corona - Small Chest 16"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 16",
    ["Kingdom of Corona - Small Chest 17"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 17",
    ["Kingdom of Corona - Small Chest 18"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 18",
    ["Kingdom of Corona - Small Chest 19"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 19",
    ["Kingdom of Corona - Small Chest 20"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 20",
    ["Kingdom of Corona - Small Chest 21"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 21",
    ["Kingdom of Corona - Small Chest 22"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Small Chest 22",
    ["Kingdom of Corona - EVENT_KEYBLADE_004 - RandomizedItem"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - EVENT_KEYBLADE_004 - RandomizedItem",
    ["Kingdom of Corona - Victory Bonus 024"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Victory Bonus 024",
    ["Kingdom of Corona - Victory Bonus 025"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Victory Bonus 025",
    ["Kingdom of Corona - Victory Bonus 026"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Victory Bonus 026",
    ["Kingdom of Corona - Victory Bonus 027"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Victory Bonus 027",
    ["Kingdom of Corona - Victory Bonus 028"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Victory Bonus 028",
    ["Kingdom of Corona - Victory Bonus 029"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Victory Bonus 029",
    ["Kingdom of Corona - Victory Bonus 030"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Victory Bonus 030",
    ["Monstropolis - Large Chest 1"] = "@Monstropolis - All Checks/Monstropolis - Large Chest 1",
    ["Monstropolis - Large Chest 2"] = "@Monstropolis - All Checks/Monstropolis - Large Chest 2",
    ["Monstropolis - Large Chest 3"] = "@Monstropolis - All Checks/Monstropolis - Large Chest 3",
    ["Monstropolis - Large Chest 4"] = "@Monstropolis - All Checks/Monstropolis - Large Chest 4",
    ["Monstropolis - Small Chest 1"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 1",
    ["Monstropolis - Small Chest 2"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 2",
    ["Monstropolis - Small Chest 3"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 3",
    ["Monstropolis - Small Chest 5"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 5",
    ["Monstropolis - Small Chest 6"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 6",
    ["Monstropolis - Small Chest 7"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 7",
    ["Monstropolis - Small Chest 8"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 8",
    ["Monstropolis - Small Chest 9"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 9",
    ["Monstropolis - Small Chest 10"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 10",
    ["Monstropolis - Small Chest 11"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 11",
    ["Monstropolis - Small Chest 12"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 12",
    ["Monstropolis - Small Chest 13"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 13",
    ["Monstropolis - Small Chest 14"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 14",
    ["Monstropolis - Small Chest 15"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 15",
    ["Monstropolis - Small Chest 16"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 16",
    ["Monstropolis - Small Chest 17"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 17",
    ["Monstropolis - Small Chest 18"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 18",
    ["Monstropolis - Small Chest 19"] = "@Monstropolis - All Checks/Monstropolis - Small Chest 19",
    ["Monstropolis - EVENT_008 - RandomizedItem"] = "@Monstropolis - All Checks/Monstropolis - EVENT_008 - RandomizedItem",
    ["Monstropolis - EVENT_KEYBLADE_005 - RandomizedItem"] = "@Monstropolis - All Checks/Monstropolis - EVENT_KEYBLADE_005 - RandomizedItem",
    ["Monstropolis - EVENT_HEARTBINDER_003 - RandomizedItem"] = "@Monstropolis - All Checks/Monstropolis - EVENT_HEARTBINDER_003 - RandomizedItem",
    ["Monstropolis - Victory Bonus 032"] = "@Monstropolis - All Checks/Monstropolis - Victory Bonus 032",
    ["Monstropolis - Victory Bonus 033"] = "@Monstropolis - All Checks/Monstropolis - Victory Bonus 033",
    ["Monstropolis - Victory Bonus 034"] = "@Monstropolis - All Checks/Monstropolis - Victory Bonus 034",
    ["Monstropolis - Victory Bonus 035"] = "@Monstropolis - All Checks/Monstropolis - Victory Bonus 035",
    ["Monstropolis - Victory Bonus 036"] = "@Monstropolis - All Checks/Monstropolis - Victory Bonus 036",
    ["Monstropolis - Victory Bonus 037"] = "@Monstropolis - All Checks/Monstropolis - Victory Bonus 037",
    ["Monstropolis - Victory Bonus 038"] = "@Monstropolis - All Checks/Monstropolis - Victory Bonus 038",
    ["Monstropolis - Victory Bonus 039"] = "@Monstropolis - All Checks/Monstropolis - Victory Bonus 039",
    ["Monstropolis - Victory Bonus 040"] = "@Monstropolis - All Checks/Monstropolis - Victory Bonus 040",
    ["Arendelle - Large Chest 1"] = "@Arendelle - All Checks/Arendelle - Large Chest 1",
    ["Arendelle - Large Chest 2"] = "@Arendelle - All Checks/Arendelle - Large Chest 2",
    ["Arendelle - Large Chest 3"] = "@Arendelle - All Checks/Arendelle - Large Chest 3",
    ["Arendelle - Large Chest 4"] = "@Arendelle - All Checks/Arendelle - Large Chest 4",
    ["Arendelle - Large Chest 5"] = "@Arendelle - All Checks/Arendelle - Large Chest 5",
    ["Arendelle - Large Chest 6"] = "@Arendelle - All Checks/Arendelle - Large Chest 6",
    ["Arendelle - Small Chest 1"] = "@Arendelle - All Checks/Arendelle - Small Chest 1",
    ["Arendelle - Small Chest 2"] = "@Arendelle - All Checks/Arendelle - Small Chest 2",
    ["Arendelle - Small Chest 4"] = "@Arendelle - All Checks/Arendelle - Small Chest 4",
    ["Arendelle - Small Chest 5"] = "@Arendelle - All Checks/Arendelle - Small Chest 5",
    ["Arendelle - Small Chest 7"] = "@Arendelle - All Checks/Arendelle - Small Chest 7",
    ["Arendelle - Small Chest 11"] = "@Arendelle - All Checks/Arendelle - Small Chest 11",
    ["Arendelle - Small Chest 12"] = "@Arendelle - All Checks/Arendelle - Small Chest 12",
    ["Arendelle - Small Chest 13"] = "@Arendelle - All Checks/Arendelle - Small Chest 13",
    ["Arendelle - Small Chest 15"] = "@Arendelle - All Checks/Arendelle - Small Chest 15",
    ["Arendelle - Small Chest 16"] = "@Arendelle - All Checks/Arendelle - Small Chest 16",
    ["Arendelle - Small Chest 17"] = "@Arendelle - All Checks/Arendelle - Small Chest 17",
    ["Arendelle - Small Chest 19"] = "@Arendelle - All Checks/Arendelle - Small Chest 19",
    ["Arendelle - Small Chest 20"] = "@Arendelle - All Checks/Arendelle - Small Chest 20",
    ["Arendelle - Small Chest 22"] = "@Arendelle - All Checks/Arendelle - Small Chest 22",
    ["Arendelle - Small Chest 23"] = "@Arendelle - All Checks/Arendelle - Small Chest 23",
    ["Arendelle - Small Chest 24"] = "@Arendelle - All Checks/Arendelle - Small Chest 24",
    ["Arendelle - Small Chest 25"] = "@Arendelle - All Checks/Arendelle - Small Chest 25",
    ["Arendelle - Small Chest 27"] = "@Arendelle - All Checks/Arendelle - Small Chest 27",
    ["Arendelle - Small Chest 29"] = "@Arendelle - All Checks/Arendelle - Small Chest 29",
    ["Arendelle - EVENT_KEYBLADE_007 - RandomizedItem"] = "@Arendelle - All Checks/Arendelle - EVENT_KEYBLADE_007 - RandomizedItem",
    ["Arendelle - Victory Bonus 041"] = "@Arendelle - All Checks/Arendelle - Victory Bonus 041",
    ["Arendelle - Victory Bonus 042"] = "@Arendelle - All Checks/Arendelle - Victory Bonus 042",
    ["Arendelle - Victory Bonus 043"] = "@Arendelle - All Checks/Arendelle - Victory Bonus 043",
    ["Arendelle - Victory Bonus 044"] = "@Arendelle - All Checks/Arendelle - Victory Bonus 044",
    ["Arendelle - Victory Bonus 045"] = "@Arendelle - All Checks/Arendelle - Victory Bonus 045",
    ["Arendelle - Victory Bonus 047"] = "@Arendelle - All Checks/Arendelle - Victory Bonus 047",
    ["Arendelle - Victory Bonus 048"] = "@Arendelle - All Checks/Arendelle - Victory Bonus 048",
    ["Arendelle - Victory Bonus 049"] = "@Arendelle - All Checks/Arendelle - Victory Bonus 049",
    ["Arendelle - Victory Bonus 050"] = "@Arendelle - All Checks/Arendelle - Victory Bonus 050",
    ["The Caribbean - Large Chest 1"] = "@The Caribbean - All Checks/The Caribbean - Large Chest 1",
    ["The Caribbean - Large Chest 2"] = "@The Caribbean - All Checks/The Caribbean - Large Chest 2",
    ["The Caribbean - Large Chest 3"] = "@The Caribbean - All Checks/The Caribbean - Large Chest 3",
    ["The Caribbean - Large Chest 4"] = "@The Caribbean - All Checks/The Caribbean - Large Chest 4",
    ["The Caribbean - Large Chest 5"] = "@The Caribbean - All Checks/The Caribbean - Large Chest 5",
    ["The Caribbean - Large Chest 6"] = "@The Caribbean - All Checks/The Caribbean - Large Chest 6",
    ["The Caribbean - Large Chest 7"] = "@The Caribbean - All Checks/The Caribbean - Large Chest 7",
    ["The Caribbean - Large Chest 8"] = "@The Caribbean - All Checks/The Caribbean - Large Chest 8",
    ["The Caribbean - Large Chest 9"] = "@The Caribbean - All Checks/The Caribbean - Large Chest 9",
    ["The Caribbean - Large Chest 10"] = "@The Caribbean - All Checks/The Caribbean - Large Chest 10",
    ["The Caribbean - Large Chest 11"] = "@The Caribbean - All Checks/The Caribbean - Large Chest 11",
    ["The Caribbean - Small Chest 1"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 1",
    ["The Caribbean - Small Chest 2"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 2",
    ["The Caribbean - Small Chest 3"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 3",
    ["The Caribbean - Small Chest 4"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 4",
    ["The Caribbean - Small Chest 5"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 5",
    ["The Caribbean - Small Chest 6"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 6",
    ["The Caribbean - Small Chest 7"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 7",
    ["The Caribbean - Small Chest 8"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 8",
    ["The Caribbean - Small Chest 9"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 9",
    ["The Caribbean - Small Chest 10"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 10",
    ["The Caribbean - Small Chest 11"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 11",
    ["The Caribbean - Small Chest 12"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 12",
    ["The Caribbean - Small Chest 13"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 13",
    ["The Caribbean - Small Chest 14"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 14",
    ["The Caribbean - Small Chest 15"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 15",
    ["The Caribbean - Small Chest 16"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 16",
    ["The Caribbean - Small Chest 17"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 17",
    ["The Caribbean - Small Chest 18"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 18",
    ["The Caribbean - Small Chest 19"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 19",
    ["The Caribbean - Small Chest 20"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 20",
    ["The Caribbean - Small Chest 21"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 21",
    ["The Caribbean - Small Chest 22"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 22",
    ["The Caribbean - Small Chest 23"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 23",
    ["The Caribbean - Small Chest 24"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 24",
    ["The Caribbean - Small Chest 25"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 25",
    ["The Caribbean - Small Chest 26"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 26",
    ["The Caribbean - Small Chest 27"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 27",
    ["The Caribbean - Small Chest 28"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 28",
    ["The Caribbean - Small Chest 29"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 29",
    ["The Caribbean - Small Chest 30"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 30",
    ["The Caribbean - Small Chest 31"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 31",
    ["The Caribbean - Small Chest 32"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 32",
    ["The Caribbean - Small Chest 33"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 33",
    ["The Caribbean - Small Chest 34"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 34",
    ["The Caribbean - Small Chest 35"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 35",
    ["The Caribbean - Small Chest 36"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 36",
    ["The Caribbean - Small Chest 37"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 37",
    ["The Caribbean - Small Chest 38"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 38",
    ["The Caribbean - Small Chest 39"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 39",
    ["The Caribbean - Small Chest 40"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 40",
    ["The Caribbean - Small Chest 41"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 41",
    ["The Caribbean - Small Chest 42"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 42",
    ["The Caribbean - Small Chest 43"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 43",
    ["The Caribbean - Small Chest 44"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 44",
    ["The Caribbean - Small Chest 45"] = "@The Caribbean - All Checks/The Caribbean - Small Chest 45",
    ["The Caribbean - EVENT_KEYBLADE_008 - RandomizedItem"] = "@The Caribbean - All Checks/The Caribbean - EVENT_KEYBLADE_008 - RandomizedItem",
    ["The Caribbean - Victory Bonus 058"] = "@The Caribbean - All Checks/The Caribbean - Victory Bonus 058",
    ["The Caribbean - Victory Bonus 059"] = "@The Caribbean - All Checks/The Caribbean - Victory Bonus 059",
    ["The Caribbean - Victory Bonus 060"] = "@The Caribbean - All Checks/The Caribbean - Victory Bonus 060",
    ["The Caribbean - Victory Bonus 061"] = "@The Caribbean - All Checks/The Caribbean - Victory Bonus 061",
    ["The Caribbean - Victory Bonus 062"] = "@The Caribbean - All Checks/The Caribbean - Victory Bonus 062",
    ["The Caribbean - Victory Bonus 063"] = "@The Caribbean - All Checks/The Caribbean - Victory Bonus 063",
    ["The Caribbean - Victory Bonus 064"] = "@The Caribbean - All Checks/The Caribbean - Victory Bonus 064",
    ["The Caribbean - Victory Bonus 065"] = "@The Caribbean - All Checks/The Caribbean - Victory Bonus 065",
    ["The Caribbean - Victory Bonus 066"] = "@The Caribbean - All Checks/The Caribbean - Victory Bonus 066",
    ["San Fransokyo - Large Chest 1"] = "@San Fransokyo - All Checks/San Fransokyo - Large Chest 1",
    ["San Fransokyo - Large Chest 5"] = "@San Fransokyo - All Checks/San Fransokyo - Large Chest 5",
    ["San Fransokyo - Large Chest 6"] = "@San Fransokyo - All Checks/San Fransokyo - Large Chest 6",
    ["San Fransokyo - Large Chest 7"] = "@San Fransokyo - All Checks/San Fransokyo - Large Chest 7",
    ["San Fransokyo - Small Chest 1"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 1",
    ["San Fransokyo - Small Chest 2"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 2",
    ["San Fransokyo - Small Chest 3"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 3",
    ["San Fransokyo - Small Chest 4"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 4",
    ["San Fransokyo - Small Chest 5"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 5",
    ["San Fransokyo - Small Chest 6"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 6",
    ["San Fransokyo - Small Chest 7"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 7",
    ["San Fransokyo - Small Chest 8"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 8",
    ["San Fransokyo - Small Chest 9"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 9",
    ["San Fransokyo - Small Chest 10"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 10",
    ["San Fransokyo - Small Chest 11"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 11",
    ["San Fransokyo - Small Chest 12"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 12",
    ["San Fransokyo - Small Chest 13"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 13",
    ["San Fransokyo - Small Chest 14"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 14",
    ["San Fransokyo - Small Chest 15"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 15",
    ["San Fransokyo - Small Chest 16"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 16",
    ["San Fransokyo - Small Chest 17"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 17",
    ["San Fransokyo - Small Chest 18"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 18",
    ["San Fransokyo - Small Chest 19"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 19",
    ["San Fransokyo - Small Chest 20"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 20",
    ["San Fransokyo - Small Chest 21"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 21",
    ["San Fransokyo - Small Chest 22"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 22",
    ["San Fransokyo - Small Chest 23"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 23",
    ["San Fransokyo - Small Chest 24"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 24",
    ["San Fransokyo - Small Chest 25"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 25",
    ["San Fransokyo - Small Chest 26"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 26",
    ["San Fransokyo - Small Chest 27"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 27",
    ["San Fransokyo - Small Chest 28"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 28",
    ["San Fransokyo - Small Chest 29"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 29",
    ["San Fransokyo - Small Chest 30"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 30",
    ["San Fransokyo - Small Chest 31"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 31",
    ["San Fransokyo - Small Chest 32"] = "@San Fransokyo - All Checks/San Fransokyo - Small Chest 32",
    ["San Fransokyo - EVENT_009 - RandomizedItem"] = "@San Fransokyo - All Checks/San Fransokyo - EVENT_009 - RandomizedItem",
    ["San Fransokyo - EVENT_KEYBLADE_009 - RandomizedItem"] = "@San Fransokyo - All Checks/San Fransokyo - EVENT_KEYBLADE_009 - RandomizedItem",
    ["San Fransokyo - EVENT_HEARTBINDER_004 - RandomizedItem"] = "@San Fransokyo - All Checks/San Fransokyo - EVENT_HEARTBINDER_004 - RandomizedItem",
    ["San Fransokyo - EVENT_KEYITEM_002 - RandomizedItem"] = "@San Fransokyo - All Checks/San Fransokyo - EVENT_KEYITEM_002 - RandomizedItem",
    ["San Fransokyo - Victory Bonus 051"] = "@San Fransokyo - All Checks/San Fransokyo - Victory Bonus 051",
    ["San Fransokyo - Victory Bonus 052"] = "@San Fransokyo - All Checks/San Fransokyo - Victory Bonus 052",
    ["San Fransokyo - Victory Bonus 053"] = "@San Fransokyo - All Checks/San Fransokyo - Victory Bonus 053",
    ["San Fransokyo - Victory Bonus 054"] = "@San Fransokyo - All Checks/San Fransokyo - Victory Bonus 054",
    ["San Fransokyo - Victory Bonus 055"] = "@San Fransokyo - All Checks/San Fransokyo - Victory Bonus 055",
    ["San Fransokyo - Victory Bonus 056"] = "@San Fransokyo - All Checks/San Fransokyo - Victory Bonus 056",
    ["San Fransokyo - Victory Bonus 057"] = "@San Fransokyo - All Checks/San Fransokyo - Victory Bonus 057",
    ["Keyblade Graveyard - Large Chest 1"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Large Chest 1",
    ["Keyblade Graveyard - Large Chest 2"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Large Chest 2",
    ["Keyblade Graveyard - Small Chest 1"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Small Chest 1",
    ["Keyblade Graveyard - Small Chest 2"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Small Chest 2",
    ["Keyblade Graveyard - Small Chest 3"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Small Chest 3",
    ["Keyblade Graveyard - Small Chest 4"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Small Chest 4",
    ["The Final World - Large Chest 1"] = "@Keyblade Graveyard - All Checks/The Final World - Large Chest 1",
    ["Keyblade Graveyard - EVENT_KEYBLADE_011 - RandomizedItem"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - EVENT_KEYBLADE_011 - RandomizedItem",
    ["Keyblade Graveyard - Victory Bonus 068"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Victory Bonus 068",
    ["Keyblade Graveyard - Victory Bonus 069"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Victory Bonus 069",
    ["Keyblade Graveyard - Victory Bonus 070"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Victory Bonus 070",
    ["Keyblade Graveyard - Victory Bonus 071"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Victory Bonus 071",
    ["Keyblade Graveyard - Victory Bonus 072"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Victory Bonus 072",
    ["Keyblade Graveyard - Victory Bonus 073"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Victory Bonus 073",
    ["Keyblade Graveyard - Victory Bonus 074"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Victory Bonus 074",
    ["Keyblade Graveyard - Victory Bonus 075"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Victory Bonus 075",
    ["Keyblade Graveyard - Victory Bonus 076"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Victory Bonus 076",
    ["Keyblade Graveyard - Victory Bonus 083"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Victory Bonus 083",
    ["Keyblade Graveyard - Victory Bonus 084"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Victory Bonus 084",
    ["Dark World - Victory Bonus 067"] = "@Dark World - All Checks/Dark World - Victory Bonus 067",
    ["Re Mind - Victory Bonus DLC 1"] = "@Re Mind - All Checks/Re Mind - Victory Bonus DLC 1",
    ["Re Mind - Victory Bonus DLC 2"] = "@Re Mind - All Checks/Re Mind - Victory Bonus DLC 2",
    ["Re Mind - Victory Bonus DLC 3"] = "@Re Mind - All Checks/Re Mind - Victory Bonus DLC 3",
    ["Re Mind - Victory Bonus DLC 4"] = "@Re Mind - All Checks/Re Mind - Victory Bonus DLC 4",
    ["Re Mind - Victory Bonus DLC 5"] = "@Re Mind - All Checks/Re Mind - Victory Bonus DLC 5",
    ["Re Mind - Victory Bonus DLC 6"] = "@Re Mind - All Checks/Re Mind - Victory Bonus DLC 6",
    ["Re Mind - Victory Bonus DLC 7"] = "@Re Mind - All Checks/Re Mind - Victory Bonus DLC 7",
    ["Re Mind - Victory Bonus DLC 8"] = "@Re Mind - All Checks/Re Mind - Victory Bonus DLC 8",
    ["Re Mind - Victory Bonus DLC 10"] = "@Re Mind - All Checks/Re Mind - Victory Bonus DLC 10",
    ["Re Mind - Victory Bonus DLC 15"] = "@Re Mind - All Checks/Re Mind - Victory Bonus DLC 15",
    ["Re Mind - Large Chest 1"] = "@Re Mind - All Checks/Re Mind - Large Chest 1",
    ["Re Mind - Large Chest 2"] = "@Re Mind - All Checks/Re Mind - Large Chest 2",
    ["Re Mind - Small Chest 1"] = "@Re Mind - All Checks/Re Mind - Small Chest 1",
    ["Re Mind - Small Chest 2"] = "@Re Mind - All Checks/Re Mind - Small Chest 2",
    ["Re Mind - Small Chest 3"] = "@Re Mind - All Checks/Re Mind - Small Chest 3",
    ["Re Mind - Small Chest 4"] = "@Re Mind - All Checks/Re Mind - Small Chest 4",
    ["Re Mind - Small Chest 5"] = "@Re Mind - All Checks/Re Mind - Small Chest 5",
    ["Re Mind - Small Chest 6"] = "@Re Mind - All Checks/Re Mind - Small Chest 6",
    ["Re Mind - Small Chest 7"] = "@Re Mind - All Checks/Re Mind - Small Chest 7",
    ["Radiant Garden Progress"] = "@Radiant Garden - All Checks/Radiant Garden Progress",
    ["Victory"] = "@Victory Check/Victory",
    ["100 Acre Wood - EVENT_KEYBLADE_006 - RandomizedItem"] = "@100 Acre Wood - All Checks/100 Acre Wood - EVENT_KEYBLADE_006 - RandomizedItem",
    ["Level Ups - Sora Level 2"] = "@Level Ups - All Checks/Level Ups - Sora Level 2",
    ["Level Ups - Sora Level 3"] = "@Level Ups - All Checks/Level Ups - Sora Level 3",
    ["Level Ups - Sora Level 4"] = "@Level Ups - All Checks/Level Ups - Sora Level 4",
    ["Level Ups - Sora Level 5"] = "@Level Ups - All Checks/Level Ups - Sora Level 5",
    ["Level Ups - Sora Level 6"] = "@Level Ups - All Checks/Level Ups - Sora Level 6",
    ["Level Ups - Sora Level 7"] = "@Level Ups - All Checks/Level Ups - Sora Level 7",
    ["Level Ups - Sora Level 8"] = "@Level Ups - All Checks/Level Ups - Sora Level 8",
    ["Level Ups - Sora Level 9"] = "@Level Ups - All Checks/Level Ups - Sora Level 9",
    ["Level Ups - Sora Level 10"] = "@Level Ups - All Checks/Level Ups - Sora Level 10",
    ["Level Ups - Sora Level 11"] = "@Level Ups - All Checks/Level Ups - Sora Level 11",
    ["Level Ups - Sora Level 12"] = "@Level Ups - All Checks/Level Ups - Sora Level 12",
    ["Level Ups - Sora Level 13"] = "@Level Ups - All Checks/Level Ups - Sora Level 13",
    ["Level Ups - Sora Level 14"] = "@Level Ups - All Checks/Level Ups - Sora Level 14",
    ["Level Ups - Sora Level 15"] = "@Level Ups - All Checks/Level Ups - Sora Level 15",
    ["Level Ups - Sora Level 16"] = "@Level Ups - All Checks/Level Ups - Sora Level 16",
    ["Level Ups - Sora Level 17"] = "@Level Ups - All Checks/Level Ups - Sora Level 17",
    ["Level Ups - Sora Level 18"] = "@Level Ups - All Checks/Level Ups - Sora Level 18",
    ["Level Ups - Sora Level 19"] = "@Level Ups - All Checks/Level Ups - Sora Level 19",
    ["Level Ups - Sora Level 20"] = "@Level Ups - All Checks/Level Ups - Sora Level 20",
    ["Level Ups - Sora Level 21"] = "@Level Ups - All Checks/Level Ups - Sora Level 21",
    ["Level Ups - Sora Level 22"] = "@Level Ups - All Checks/Level Ups - Sora Level 22",
    ["Level Ups - Sora Level 23"] = "@Level Ups - All Checks/Level Ups - Sora Level 23",
    ["Level Ups - Sora Level 24"] = "@Level Ups - All Checks/Level Ups - Sora Level 24",
    ["Level Ups - Sora Level 25"] = "@Level Ups - All Checks/Level Ups - Sora Level 25",
    ["Level Ups - Sora Level 26"] = "@Level Ups - All Checks/Level Ups - Sora Level 26",
    ["Level Ups - Sora Level 27"] = "@Level Ups - All Checks/Level Ups - Sora Level 27",
    ["Level Ups - Sora Level 28"] = "@Level Ups - All Checks/Level Ups - Sora Level 28",
    ["Level Ups - Sora Level 29"] = "@Level Ups - All Checks/Level Ups - Sora Level 29",
    ["Level Ups - Sora Level 30"] = "@Level Ups - All Checks/Level Ups - Sora Level 30",
    ["Level Ups - Sora Level 31"] = "@Level Ups - All Checks/Level Ups - Sora Level 31",
    ["Level Ups - Sora Level 32"] = "@Level Ups - All Checks/Level Ups - Sora Level 32",
    ["Level Ups - Sora Level 33"] = "@Level Ups - All Checks/Level Ups - Sora Level 33",
    ["Level Ups - Sora Level 34"] = "@Level Ups - All Checks/Level Ups - Sora Level 34",
    ["Level Ups - Sora Level 35"] = "@Level Ups - All Checks/Level Ups - Sora Level 35",
    ["Battlegate Reports - EVENT_REPORT_001a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_001a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_002a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_002a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_003a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_003a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_004a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_004a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_005a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_005a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_006a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_006a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_007a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_007a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_008a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_008a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_009a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_009a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_010a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_010a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_011a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_011a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_012a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_012a - RandomizedItem",
    ["Battlegate Reports - EVENT_REPORT_013a - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Reports - EVENT_REPORT_013a - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_001b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_001b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_002b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_002b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_003b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_003b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_004b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_004b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_005b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_005b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_006b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_006b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_007b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_007b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_008b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_008b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_009b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_009b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_010b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_010b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_011b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_011b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_012b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_012b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_013b - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_013b - RandomizedItem",
    ["Battlegate Rewards - EVENT_REPORT_014 - RandomizedItem"] = "@Battlegates - All Checks/Battlegate Rewards - EVENT_REPORT_014 - RandomizedItem",
    ["Lucky Emblems - Milestone 1"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 1",
    ["Lucky Emblems - Milestone 3"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 3",
    ["Lucky Emblems - Milestone 5"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 5",
    ["Lucky Emblems - Milestone 10"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 10",
    ["Lucky Emblems - Milestone 15"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 15",
    ["Lucky Emblems - Milestone 20"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 20",
    ["Lucky Emblems - Milestone 25"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 25",
    ["Lucky Emblems - Milestone 30"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 30",
    ["Lucky Emblems - Milestone 35"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 35",
    ["Lucky Emblems - Milestone 40"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 40",
    ["Lucky Emblems - Milestone 45"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 45",
    ["Lucky Emblems - Milestone 50"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 50",
    ["Lucky Emblems - Milestone 55"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 55",
    ["Lucky Emblems - Milestone 60"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 60",
    ["Lucky Emblems - Milestone 65"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 65",
    ["Lucky Emblems - Milestone 70"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 70",
    ["Lucky Emblems - Milestone 80"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 80",
    ["Lucky Emblems - Milestone 90"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 90",
}

-- Highlight level mapping (matches AP hint item_flags and status codes)
-- status=0 means use item_flags: 100+flags
-- item_flags: 0=Filler, 1=Progression, 2=Useful, 4=Trap (bitflag)
-- status: 10=NoPriority, 20=Avoid, 30=Priority, 40=None
HIGHLIGHT_LEVEL = nil
if Highlight then
    HIGHLIGHT_LEVEL = {
        [10]  = Highlight.NoPriority,
        [20]  = Highlight.Avoid,
        [30]  = Highlight.Priority,
        [40]  = Highlight.None,
        [100] = Highlight.Unspecified,  -- Filler
        [101] = Highlight.Priority,     -- Progression
        [102] = Highlight.NoPriority,   -- Useful
        [103] = Highlight.Priority,     -- Progression + Useful
        [104] = Highlight.Avoid,        -- Trap
        [105] = Highlight.Priority,     -- Progression + Trap
        [106] = Highlight.NoPriority,   -- Useful + Trap
        [107] = Highlight.Priority,     -- Progression + Useful + Trap
    }
end

PLAYER_ID = -1
TEAM_NUMBER = 0
HINTS_ID = nil
CUR_INDEX = -1

-- Apply highlight to every location section that maps to this AP location ID
function UpdateHints(locationID, hint)
    if not Highlight then return end

    local highlight
    if hint.status ~= 0 then
        -- player has manually set a priority in the AP client
        highlight = HIGHLIGHT_LEVEL[hint.status] or Highlight.Unspecified
    elseif (hint.item_flags & 1) == 1 then
        highlight = Highlight.Priority      -- Progression -> blue
    elseif hint.item_flags == 4 then
        highlight = Highlight.Avoid         -- Trap -> red
    else
        highlight = Highlight.NoPriority    -- Useful/Filler -> yellow
    end

    local mapping = LOCATION_MAPPING[locationID]
    if mapping then
        local obj = Tracker:FindObjectForCode(mapping.code)
        if obj then
            obj.Highlight = highlight
        else
            print(string.format("UpdateHints: no object for code %s", mapping.code))
        end
        local section_name = mapping.code:match("^@[^/]+/(.+)$")
        if section_name then
            local ow_code = OVERWORLD_SECTION_MAP[section_name]
            if ow_code then
                local ow_obj = Tracker:FindObjectForCode(ow_code)
                if ow_obj then
                    ow_obj.Highlight = highlight
                end
            end
        end
    else
        print(string.format("UpdateHints: location %s not in LOCATION_MAPPING", locationID))
    end
end

function OnNotify(key, value, old_value)
    if value ~= old_value and key == HINTS_ID then
        Tracker.BulkUpdate = true
        for _, hint in ipairs(value) do
            if hint.finding_player == Archipelago.PlayerNumber then
                UpdateHints(hint.location, hint)
            end
        end
        Tracker.BulkUpdate = false
    end
end

function OnNotifyLaunch(key, value)
    if key == HINTS_ID then
        Tracker.BulkUpdate = true
        for _, hint in ipairs(value) do
            if hint.finding_player == Archipelago.PlayerNumber then
                UpdateHints(hint.location, hint)
            end
        end
        Tracker.BulkUpdate = false
    end
end

function onItem(index, item_id, item_name, player_id)
    if index <= CUR_INDEX then
        return
    end
    CUR_INDEX = index

    if not item_name then
        print(string.format("onItem: nil item_name for id %s", item_id))
        return
    end

    local mapping = ITEM_MAPPING_BY_NAME[item_name]
    if not mapping then
        return
    end

    local obj = Tracker:FindObjectForCode(mapping.code)
    if not obj then
        return
    end

    if mapping.type == "toggle" then
        obj.Active = true
    elseif mapping.type == "progressive" then
        if obj.CurrentStage then
            obj.CurrentStage = obj.CurrentStage + 1
        end
    elseif mapping.type == "consumable" then
        obj.AcquiredCount = (obj.AcquiredCount or 0) + 1
    end
    print(string.format("onItem: tracked '%s' -> %s", item_name, mapping.code))
end

function onLocation(location_id, location_name)
    local mapping = LOCATION_MAPPING[location_id]
    if not mapping then return end

    local section = Tracker:FindObjectForCode(mapping.code)
    if section then
        section.AvailableChestCount = 0
    end

    local section_name = mapping.code:match("^@[^/]+/(.+)$")
    if section_name and OVERWORLD_SECTION_MAP[section_name] then
        local ow_section = Tracker:FindObjectForCode(OVERWORLD_SECTION_MAP[section_name])
        if ow_section then
            ow_section.AvailableChestCount = 0
        end
    end
end

function onClear(slot_data)
    CUR_INDEX = -1

    for name, mapping in pairs(ITEM_MAPPING_BY_NAME) do
        local obj = Tracker:FindObjectForCode(mapping.code)
        if obj then
            if mapping.type == "toggle" then
                obj.Active = false
            elseif mapping.type == "progressive" then
                obj.CurrentStage = 0
            elseif mapping.type == "consumable" then
                obj.AcquiredCount = 0
            end
        end
    end

    PLAYER_ID = Archipelago.PlayerNumber or -1
    TEAM_NUMBER = Archipelago.TeamNumber or 0

    if PLAYER_ID > -1 then
        HINTS_ID = "_read_hints_" .. TEAM_NUMBER .. "_" .. PLAYER_ID
        Archipelago:SetNotify({HINTS_ID})
        Archipelago:Get({HINTS_ID})
    end
end

Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
Archipelago:AddSetReplyHandler("notify handler", OnNotify)
Archipelago:AddRetrievedHandler("notify launch handler", OnNotifyLaunch)
