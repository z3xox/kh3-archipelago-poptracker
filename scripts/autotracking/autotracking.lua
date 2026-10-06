-- KH3 Archipelago Auto-Tracking
ScriptHost:LoadScript("scripts/autotracking/item_mapping.lua")
ScriptHost:LoadScript("scripts/autotracking/location_mapping.lua")

OVERWORLD_SECTION_MAP = {
    -- BEGIN generated: child checks (scripts/tools/generate_child_checks.py)
    ["10,000 Enemy Fight in The Keyblade Graveyard: The Badlands a - Reward 2"] = "@Keyblade Graveyard - All Checks/10,000 Enemy Fight in The Keyblade Graveyard: The Badlands a - Reward 2",
    ["10,000 Enemy Fight in The Keyblade Graveyard: The Badlands a - Reward 3"] = "@Keyblade Graveyard - All Checks/10,000 Enemy Fight in The Keyblade Graveyard: The Badlands a - Reward 3",
    ["10,000 Enemy Fight in The Keyblade Graveyard: The Badlands b - Reward 2"] = "@Keyblade Graveyard - All Checks/10,000 Enemy Fight in The Keyblade Graveyard: The Badlands b - Reward 2",
    ["10,000 Enemy Fight in The Keyblade Graveyard: The Badlands b - Reward 3"] = "@Keyblade Graveyard - All Checks/10,000 Enemy Fight in The Keyblade Graveyard: The Badlands b - Reward 3",
    ["After the UFO Mini-Boss in Toy Box - Babies & Toddlers: Outdoors - Reward 2"] = "@Toy Box - All Checks/After the UFO Mini-Boss in Toy Box - Babies & Toddlers: Outdoors - Reward 2",
    ["After the UFO Mini-Boss in Toy Box - Babies & Toddlers: Outdoors - Reward 3"] = "@Toy Box - All Checks/After the UFO Mini-Boss in Toy Box - Babies & Toddlers: Outdoors - Reward 3",
    ["Arendelle - Chest 1 (Large Chest, The North Mountain: Treescape) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 1 (Large Chest, The North Mountain: Treescape) - Song Bonus",
    ["Arendelle - Chest 10 (Large Chest, The Labyrinth of Ice: Middle Tier) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 10 (Large Chest, The Labyrinth of Ice: Middle Tier) - Song Bonus",
    ["Arendelle - Chest 11 (Small Chest, The Labyrinth of Ice: Upper Tier) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 11 (Small Chest, The Labyrinth of Ice: Upper Tier) - Song Bonus",
    ["Arendelle - Chest 12 (Small Chest, The Labyrinth of Ice: Middle Tier) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 12 (Small Chest, The Labyrinth of Ice: Middle Tier) - Song Bonus",
    ["Arendelle - Chest 13 (Small Chest, The Labyrinth of Ice: Upper Tier) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 13 (Small Chest, The Labyrinth of Ice: Upper Tier) - Song Bonus",
    ["Arendelle - Chest 14 (Large Chest, The Labyrinth of Ice: Lower Tier) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 14 (Large Chest, The Labyrinth of Ice: Lower Tier) - Song Bonus",
    ["Arendelle - Chest 15 (Small Chest, The Labyrinth of Ice: Middle Tier) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 15 (Small Chest, The Labyrinth of Ice: Middle Tier) - Song Bonus",
    ["Arendelle - Chest 16 (Small Chest, The North Mountain: Valley of Ice) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 16 (Small Chest, The North Mountain: Valley of Ice) - Song Bonus",
    ["Arendelle - Chest 17 (Small Chest, The North Mountain: Valley of Ice) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 17 (Small Chest, The North Mountain: Valley of Ice) - Song Bonus",
    ["Arendelle - Chest 18 (Small Chest, The North Mountain: Valley of Ice) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 18 (Small Chest, The North Mountain: Valley of Ice) - Song Bonus",
    ["Arendelle - Chest 19 (Small Chest, The North Mountain: Valley of Ice) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 19 (Small Chest, The North Mountain: Valley of Ice) - Song Bonus",
    ["Arendelle - Chest 2 (Small Chest, The North Mountain: Treescape) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 2 (Small Chest, The North Mountain: Treescape) - Song Bonus",
    ["Arendelle - Chest 20 (Small Chest, The North Mountain: Valley of Ice) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 20 (Small Chest, The North Mountain: Valley of Ice) - Song Bonus",
    ["Arendelle - Chest 21 (Small Chest, The North Mountain: Frozen Wall) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 21 (Small Chest, The North Mountain: Frozen Wall) - Song Bonus",
    ["Arendelle - Chest 22 (Small Chest, The North Mountain: Frozen Wall) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 22 (Small Chest, The North Mountain: Frozen Wall) - Song Bonus",
    ["Arendelle - Chest 23 (Small Chest, The North Mountain: Frozen Wall) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 23 (Small Chest, The North Mountain: Frozen Wall) - Song Bonus",
    ["Arendelle - Chest 24 (Small Chest, The North Mountain: Foothills) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 24 (Small Chest, The North Mountain: Foothills) - Song Bonus",
    ["Arendelle - Chest 25 (Small Chest, The North Mountain: Foothills) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 25 (Small Chest, The North Mountain: Foothills) - Song Bonus",
    ["Arendelle - Chest 3 (Small Chest, The North Mountain: Treescape) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 3 (Small Chest, The North Mountain: Treescape) - Song Bonus",
    ["Arendelle - Chest 4 (Small Chest, The North Mountain: Gorge) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 4 (Small Chest, The North Mountain: Gorge) - Song Bonus",
    ["Arendelle - Chest 5 (Small Chest, The North Mountain: Gorge) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 5 (Small Chest, The North Mountain: Gorge) - Song Bonus",
    ["Arendelle - Chest 6 (Small Chest, The North Mountain: Snowfield) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 6 (Small Chest, The North Mountain: Snowfield) - Song Bonus",
    ["Arendelle - Chest 7 (Large Chest, The North Mountain: Snowfield) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 7 (Large Chest, The North Mountain: Snowfield) - Song Bonus",
    ["Arendelle - Chest 8 (Large Chest, The North Mountain: Treescape) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 8 (Large Chest, The North Mountain: Treescape) - Song Bonus",
    ["Arendelle - Chest 9 (Large Chest, The North Mountain: Snowfield) - Song Bonus"] = "@Arendelle - All Checks/Arendelle - Chest 9 (Large Chest, The North Mountain: Snowfield) - Song Bonus",
    ["Arendelle - The North Mountain: The Valley of Ice Heartless - Reward 2"] = "@Arendelle - All Checks/Arendelle - The North Mountain: The Valley of Ice Heartless - Reward 2",
    ["Arendelle - The North Mountain: The Valley of Ice Heartless - Reward 3"] = "@Arendelle - All Checks/Arendelle - The North Mountain: The Valley of Ice Heartless - Reward 3",
    ["Complete Verum Rex: Beat of Lead during the Story - Reward 2"] = "@Toy Box - All Checks/Complete Verum Rex: Beat of Lead during the Story - Reward 2",
    ["Complete Verum Rex: Beat of Lead during the Story - Reward 3"] = "@Toy Box - All Checks/Complete Verum Rex: Beat of Lead during the Story - Reward 3",
    ["Defeat Angelic Amber in Toy Box - Babies & Toddlers: Dolls - Reward 2"] = "@Toy Box - All Checks/Defeat Angelic Amber in Toy Box - Babies & Toddlers: Dolls - Reward 2",
    ["Defeat Angelic Amber in Toy Box - Babies & Toddlers: Dolls - Reward 3"] = "@Toy Box - All Checks/Defeat Angelic Amber in Toy Box - Babies & Toddlers: Dolls - Reward 3",
    ["Defeat Anti-Aqua in The Dark World - The Realm of Darkness - Reward 2"] = "@Dark World - All Checks/Defeat Anti-Aqua in The Dark World - The Realm of Darkness - Reward 2",
    ["Defeat Anti-Aqua in The Dark World - The Realm of Darkness - Reward 3"] = "@Dark World - All Checks/Defeat Anti-Aqua in The Dark World - The Realm of Darkness - Reward 3",
    ["Defeat Catastrochorus in San Fransokyo - The City (Day) - Reward 2"] = "@San Fransokyo - All Checks/Defeat Catastrochorus in San Fransokyo - The City (Day) - Reward 2",
    ["Defeat Catastrochorus in San Fransokyo - The City (Day) - Reward 3"] = "@San Fransokyo - All Checks/Defeat Catastrochorus in San Fransokyo - The City (Day) - Reward 3",
    ["Defeat Chaos Carriage in Kingdom of Corona - Reward 2"] = "@Kingdom of Corona - All Checks/Defeat Chaos Carriage in Kingdom of Corona - Reward 2",
    ["Defeat Chaos Carriage in Kingdom of Corona - Reward 3"] = "@Kingdom of Corona - All Checks/Defeat Chaos Carriage in Kingdom of Corona - Reward 3",
    ["Defeat Darkubes in San Fransokyo - The City (Night) - Reward 2"] = "@San Fransokyo - All Checks/Defeat Darkubes in San Fransokyo - The City (Night) - Reward 2",
    ["Defeat Darkubes in San Fransokyo - The City (Night) - Reward 3"] = "@San Fransokyo - All Checks/Defeat Darkubes in San Fransokyo - The City (Night) - Reward 3",
    ["Defeat Demon Tide in Twilight Town - The Neighborhood: Tram Common - Reward 2"] = "@Twilight Town - All Checks/Defeat Demon Tide in Twilight Town - The Neighborhood: Tram Common - Reward 2",
    ["Defeat Demon Tide in Twilight Town - The Neighborhood: Tram Common - Reward 3"] = "@Twilight Town - All Checks/Defeat Demon Tide in Twilight Town - The Neighborhood: Tram Common - Reward 3",
    ["Defeat King of Toys in Toy Box: Galaxy Toys - Reward 2"] = "@Toy Box - All Checks/Defeat King of Toys in Toy Box: Galaxy Toys - Reward 2",
    ["Defeat King of Toys in Toy Box: Galaxy Toys - Reward 3"] = "@Toy Box - All Checks/Defeat King of Toys in Toy Box: Galaxy Toys - Reward 3",
    ["Defeat Lightning Angler in The Caribbean - The High Seas: Undersea Cavern - Reward 2"] = "@The Caribbean - All Checks/Defeat Lightning Angler in The Caribbean - The High Seas: Undersea Cavern - Reward 2",
    ["Defeat Lightning Angler in The Caribbean - The High Seas: Undersea Cavern - Reward 3"] = "@The Caribbean - All Checks/Defeat Lightning Angler in The Caribbean - The High Seas: Undersea Cavern - Reward 3",
    ["Defeat Lump of Horror in Monstropolis - The Door Vault: Service Area - Reward 2"] = "@Monstropolis - All Checks/Defeat Lump of Horror in Monstropolis - The Door Vault: Service Area - Reward 2",
    ["Defeat Lump of Horror in Monstropolis - The Door Vault: Service Area - Reward 3"] = "@Monstropolis - All Checks/Defeat Lump of Horror in Monstropolis - The Door Vault: Service Area - Reward 3",
    ["Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction - Reward 2"] = "@Keyblade Graveyard - All Checks/Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction - Reward 2",
    ["Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction - Reward 3"] = "@Keyblade Graveyard - All Checks/Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction - Reward 3",
    ["Defeat Marshmallow in Arendelle - The North Mountain: Mountain Ridge - Reward 2"] = "@Arendelle - All Checks/Defeat Marshmallow in Arendelle - The North Mountain: Mountain Ridge - Reward 2",
    ["Defeat Marshmallow in Arendelle - The North Mountain: Mountain Ridge - Reward 3"] = "@Arendelle - All Checks/Defeat Marshmallow in Arendelle - The North Mountain: Mountain Ridge - Reward 3",
    ["Defeat Rock Titan in Olympus: Mount Olympus - Summit - Reward 2"] = "@Olympus - All Checks/Defeat Rock Titan in Olympus: Mount Olympus - Summit - Reward 2",
    ["Defeat Rock Titan in Olympus: Mount Olympus - Summit - Reward 3"] = "@Olympus - All Checks/Defeat Rock Titan in Olympus: Mount Olympus - Summit - Reward 3",
    ["Defeat Rock Troll & Winterhorns in Arendelle - The North Mountain: Gorge - Reward 2"] = "@Arendelle - All Checks/Defeat Rock Troll & Winterhorns in Arendelle - The North Mountain: Gorge - Reward 2",
    ["Defeat Rock Troll & Winterhorns in Arendelle - The North Mountain: Gorge - Reward 3"] = "@Arendelle - All Checks/Defeat Rock Troll & Winterhorns in Arendelle - The North Mountain: Gorge - Reward 3",
    ["Defeat Rock Troll in Olympus - Thebes: Agora - Reward 2"] = "@Olympus - All Checks/Defeat Rock Troll in Olympus - Thebes: Agora - Reward 2",
    ["Defeat Rock Troll in Olympus - Thebes: Agora - Reward 3"] = "@Olympus - All Checks/Defeat Rock Troll in Olympus - Thebes: Agora - Reward 3",
    ["Defeat Saïx in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation - Reward 2"] = "@Keyblade Graveyard - All Checks/Defeat Saïx in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation - Reward 2",
    ["Defeat Saïx in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation - Reward 3"] = "@Keyblade Graveyard - All Checks/Defeat Saïx in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation - Reward 3",
    ["Defeat Skoll in Arendelle - Reward 2"] = "@Arendelle - All Checks/Defeat Skoll in Arendelle - Reward 2",
    ["Defeat Skoll in Arendelle - Reward 3"] = "@Arendelle - All Checks/Defeat Skoll in Arendelle - Reward 3",
    ["Defeat Tornado Titan in Olympus: Realm of the Gods - Reward 2"] = "@Olympus - All Checks/Defeat Tornado Titan in Olympus: Realm of the Gods - Reward 2",
    ["Defeat Tornado Titan in Olympus: Realm of the Gods - Reward 3"] = "@Olympus - All Checks/Defeat Tornado Titan in Olympus: Realm of the Gods - Reward 3",
    ["Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation - Reward 2"] = "@Keyblade Graveyard - All Checks/Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation - Reward 2",
    ["Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation - Reward 3"] = "@Keyblade Graveyard - All Checks/Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation - Reward 3",
    ["Defeat Xigbar & Dark Riku in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction - Reward 2"] = "@Keyblade Graveyard - All Checks/Defeat Xigbar & Dark Riku in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction - Reward 2",
    ["Defeat Xigbar & Dark Riku in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction - Reward 3"] = "@Keyblade Graveyard - All Checks/Defeat Xigbar & Dark Riku in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction - Reward 3",
    ["Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard: The Skein of Severance - Tower of Endings - Reward 2"] = "@Keyblade Graveyard - All Checks/Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard: The Skein of Severance - Tower of Endings - Reward 2",
    ["Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard: The Skein of Severance - Tower of Endings - Reward 3"] = "@Keyblade Graveyard - All Checks/Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard: The Skein of Severance - Tower of Endings - Reward 3",
    ["Frozen Slider Frost Serpents - Reward 2"] = "@Arendelle - All Checks/Frozen Slider Frost Serpents - Reward 2",
    ["Frozen Slider Frost Serpents - Reward 3"] = "@Arendelle - All Checks/Frozen Slider Frost Serpents - Reward 3",
    ["The Caribbean - Chest 16 (Small Chest, Horseshoe Island) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 16 (Small Chest, Horseshoe Island) - Song Bonus",
    ["The Caribbean - Chest 41 (Small Chest, Horseshoe Island) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 41 (Small Chest, Horseshoe Island) - Song Bonus",
    ["The Caribbean - Chest 42 (Small Chest, Horseshoe Island) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 42 (Small Chest, Horseshoe Island) - Song Bonus",
    ["The Caribbean - Chest 43 (Small Chest, Horseshoe Island) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 43 (Small Chest, Horseshoe Island) - Song Bonus",
    ["The Caribbean - Chest 44 (Small Chest, Horseshoe Island) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 44 (Small Chest, Horseshoe Island) - Song Bonus",
    ["The Caribbean - Chest 1 (Small Chest, Huddled Isles) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 1 (Small Chest, Huddled Isles) - Song Bonus",
    ["The Caribbean - Chest 21 (Small Chest, Huddled Isles) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 21 (Small Chest, Huddled Isles) - Song Bonus",
    ["The Caribbean - Chest 22 (Small Chest, Huddled Isles) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 22 (Small Chest, Huddled Isles) - Song Bonus",
    ["The Caribbean - Chest 23 (Small Chest, Isla de los Mastiles: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 23 (Small Chest, Isla de los Mastiles: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 24 (Small Chest, Isla de los Mastiles: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 24 (Small Chest, Isla de los Mastiles: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 5 (Small Chest, Isla de los Mastiles: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 5 (Small Chest, Isla de los Mastiles: Underwater Alcove) - Song Bonus",
    ["Keyblade Graveyard - Chest 1 (Large Chest, The Badlands) - Song Bonus"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 1 (Large Chest, The Badlands) - Song Bonus",
    ["Keyblade Graveyard - Chest 2 (Small Chest, The Badlands) - Song Bonus"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 2 (Small Chest, The Badlands) - Song Bonus",
    ["Keyblade Graveyard - Chest 3 (Large Chest, The Skein of Severance: Trail of Valediction) - Song Bonus"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 3 (Large Chest, The Skein of Severance: Trail of Valediction) - Song Bonus",
    ["Keyblade Graveyard - Chest 4 (Small Chest, The Skein of Severance: Trail of Valediction) - Song Bonus"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 4 (Small Chest, The Skein of Severance: Trail of Valediction) - Song Bonus",
    ["Keyblade Graveyard - Chest 5 (Small Chest, The Skein of Severance: Trail of Valediction) - Song Bonus"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 5 (Small Chest, The Skein of Severance: Trail of Valediction) - Song Bonus",
    ["Keyblade Graveyard - Chest 6 (Small Chest, The Skein of Severance: Twist of Isolation) - Song Bonus"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 6 (Small Chest, The Skein of Severance: Twist of Isolation) - Song Bonus",
    ["After collecting 222 Soras in The Final World - Reward 2"] = "@Keyblade Graveyard - All Checks/After collecting 222 Soras in The Final World - Reward 2",
    ["After collecting 222 Soras in The Final World - Reward 3"] = "@Keyblade Graveyard - All Checks/After collecting 222 Soras in The Final World - Reward 3",
    ["After collecting 333 Soras in The Final World - Reward 2"] = "@Keyblade Graveyard - All Checks/After collecting 333 Soras in The Final World - Reward 2",
    ["After collecting 333 Soras in The Final World - Reward 3"] = "@Keyblade Graveyard - All Checks/After collecting 333 Soras in The Final World - Reward 3",
    ["Defeat Demon Tide in The Keyblade Graveyard: The Badlands - Reward 2"] = "@Keyblade Graveyard - All Checks/Defeat Demon Tide in The Keyblade Graveyard: The Badlands - Reward 2",
    ["Defeat Demon Tide in The Keyblade Graveyard: The Badlands - Reward 3"] = "@Keyblade Graveyard - All Checks/Defeat Demon Tide in The Keyblade Graveyard: The Badlands - Reward 3",
    ["Defeat Lich in The Final World (San Fransokyo - The City: Central District) - Reward 2"] = "@Keyblade Graveyard - All Checks/Defeat Lich in The Final World (San Fransokyo - The City: Central District) - Reward 2",
    ["Defeat Lich in The Final World (San Fransokyo - The City: Central District) - Reward 3"] = "@Keyblade Graveyard - All Checks/Defeat Lich in The Final World (San Fransokyo - The City: Central District) - Reward 3",
    ["Kingdom of Corona - Chest 1 (Small Chest, The Forest: Tower) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 1 (Small Chest, The Forest: Tower) - Song Bonus",
    ["Kingdom of Corona - Chest 10 (Large Chest, The Forest: Marsh) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 10 (Large Chest, The Forest: Marsh) - Song Bonus",
    ["Kingdom of Corona - Chest 11 (Small Chest, The Forest: Marsh) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 11 (Small Chest, The Forest: Marsh) - Song Bonus",
    ["Kingdom of Corona - Chest 12 (Small Chest, The Forest: Marsh) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 12 (Small Chest, The Forest: Marsh) - Song Bonus",
    ["Kingdom of Corona - Chest 13 (Small Chest, The Forest: Wetlands) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 13 (Small Chest, The Forest: Wetlands) - Song Bonus",
    ["Kingdom of Corona - Chest 14 (Large Chest, The Forest: Wetlands) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 14 (Large Chest, The Forest: Wetlands) - Song Bonus",
    ["Kingdom of Corona - Chest 15 (Small Chest, The Forest: Wetlands) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 15 (Small Chest, The Forest: Wetlands) - Song Bonus",
    ["Kingdom of Corona - Chest 16 (Small Chest, The Forest: Wetlands) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 16 (Small Chest, The Forest: Wetlands) - Song Bonus",
    ["Kingdom of Corona - Chest 17 (Small Chest, The Forest: Wetlands) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 17 (Small Chest, The Forest: Wetlands) - Song Bonus",
    ["Kingdom of Corona - Chest 18 (Small Chest, The Forest: Wetlands) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 18 (Small Chest, The Forest: Wetlands) - Song Bonus",
    ["Kingdom of Corona - Chest 19 (Small Chest, The Forest: Campsite) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 19 (Small Chest, The Forest: Campsite) - Song Bonus",
    ["Kingdom of Corona - Chest 2 (Small Chest, The Forest: Hills) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 2 (Small Chest, The Forest: Hills) - Song Bonus",
    ["Kingdom of Corona - Chest 20 (Small Chest, The Forest: Shore) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 20 (Small Chest, The Forest: Shore) - Song Bonus",
    ["Kingdom of Corona - Chest 21 (Small Chest, The Forest: Wildflower Clearing) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 21 (Small Chest, The Forest: Wildflower Clearing) - Song Bonus",
    ["Kingdom of Corona - Chest 22 (Large Chest, The Forest: Wildflower Clearing) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 22 (Large Chest, The Forest: Wildflower Clearing) - Song Bonus",
    ["Kingdom of Corona - Chest 23 (Small Chest, The Kingdom: Thoroughfare) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 23 (Small Chest, The Kingdom: Thoroughfare) - Song Bonus",
    ["Kingdom of Corona - Chest 24 (Large Chest, The Kingdom: Thoroughfare) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 24 (Large Chest, The Kingdom: Thoroughfare) - Song Bonus",
    ["Kingdom of Corona - Chest 25 (Small Chest, The Kingdom: Thoroughfare) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 25 (Small Chest, The Kingdom: Thoroughfare) - Song Bonus",
    ["Kingdom of Corona - Chest 26 (Small Chest, The Kingdom: Wharf) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 26 (Small Chest, The Kingdom: Wharf) - Song Bonus",
    ["Kingdom of Corona - Chest 27 (Small Chest, The Kingdom: Wharf) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 27 (Small Chest, The Kingdom: Wharf) - Song Bonus",
    ["Kingdom of Corona - Chest 28 (Small Chest, The Kingdom: Wharf) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 28 (Small Chest, The Kingdom: Wharf) - Song Bonus",
    ["Kingdom of Corona - Chest 3 (Small Chest, The Forest: Hills) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 3 (Small Chest, The Forest: Hills) - Song Bonus",
    ["Kingdom of Corona - Chest 4 (Small Chest, The Forest: Hills) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 4 (Small Chest, The Forest: Hills) - Song Bonus",
    ["Kingdom of Corona - Chest 5 (Small Chest, The Forest: Hills) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 5 (Small Chest, The Forest: Hills) - Song Bonus",
    ["Kingdom of Corona - Chest 6 (Small Chest, The Forest: Hills) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 6 (Small Chest, The Forest: Hills) - Song Bonus",
    ["Kingdom of Corona - Chest 7 (Large Chest, The Forest: Hills) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 7 (Large Chest, The Forest: Hills) - Song Bonus",
    ["Kingdom of Corona - Chest 8 (Small Chest, The Forest: Hills) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 8 (Small Chest, The Forest: Hills) - Song Bonus",
    ["Kingdom of Corona - Chest 9 (Large Chest, The Forest: Hills) - Song Bonus"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 9 (Large Chest, The Forest: Hills) - Song Bonus",
    ["Kingdom of Corona - The Forest: Hills Chief Puffs & Puffballs - Reward 2"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Hills Chief Puffs & Puffballs - Reward 2",
    ["Kingdom of Corona - The Forest: Hills Chief Puffs & Puffballs - Reward 3"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Hills Chief Puffs & Puffballs - Reward 3",
    ["Kingdom of Corona - The Forest: Hills Heartless - Reward 2"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Hills Heartless - Reward 2",
    ["Kingdom of Corona - The Forest: Hills Heartless - Reward 3"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Hills Heartless - Reward 3",
    ["Kingdom of Corona - The Forest: Hills Reapers - Reward 2"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Hills Reapers - Reward 2",
    ["Kingdom of Corona - The Forest: Hills Reapers - Reward 3"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Hills Reapers - Reward 3",
    ["Defeat Grim Guardianess in Kingdom of Corona - The Forest: Tower - Reward 2"] = "@Kingdom of Corona - All Checks/Defeat Grim Guardianess in Kingdom of Corona - The Forest: Tower - Reward 2",
    ["Defeat Grim Guardianess in Kingdom of Corona - The Forest: Tower - Reward 3"] = "@Kingdom of Corona - All Checks/Defeat Grim Guardianess in Kingdom of Corona - The Forest: Tower - Reward 3",
    ["Kingdom of Corona - The Forest: Tower Heartless - Reward 2"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Tower Heartless - Reward 2",
    ["Kingdom of Corona - The Forest: Tower Heartless - Reward 3"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Tower Heartless - Reward 3",
    ["Kingdom of Corona - The Kingdom: Wharf Nobodies - Reward 2"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Kingdom: Wharf Nobodies - Reward 2",
    ["Kingdom of Corona - The Kingdom: Wharf Nobodies - Reward 3"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Kingdom: Wharf Nobodies - Reward 3",
    ["Monstropolis  - The Power Plant: Tank Yard Heartless - Reward 2"] = "@Monstropolis - All Checks/Monstropolis  - The Power Plant: Tank Yard Heartless - Reward 2",
    ["Monstropolis  - The Power Plant: Tank Yard Heartless - Reward 3"] = "@Monstropolis - All Checks/Monstropolis  - The Power Plant: Tank Yard Heartless - Reward 3",
    ["Monstropolis - Chest 1 (Large Chest, Monsters) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 1 (Large Chest, Monsters) - Song Bonus",
    ["Monstropolis - Chest 10 (Large Chest, The Factory: Ground Floor) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 10 (Large Chest, The Factory: Ground Floor) - Song Bonus",
    ["Monstropolis - Chest 11 (Small Chest, The Factory: Ground Floor) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 11 (Small Chest, The Factory: Ground Floor) - Song Bonus",
    ["Monstropolis - Chest 12 (Small Chest, The Factory: Ground Floor) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 12 (Small Chest, The Factory: Ground Floor) - Song Bonus",
    ["Monstropolis - Chest 13 (Small Chest, The Factory: Second Floor) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 13 (Small Chest, The Factory: Second Floor) - Song Bonus",
    ["Monstropolis - Chest 14 (Small Chest, The Factory: Second Floor) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 14 (Small Chest, The Factory: Second Floor) - Song Bonus",
    ["Monstropolis - Chest 15 (Small Chest, The Power Plant: Accessway) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 15 (Small Chest, The Power Plant: Accessway) - Song Bonus",
    ["Monstropolis - Chest 16 (Small Chest, The Power Plant: Accessway) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 16 (Small Chest, The Power Plant: Accessway) - Song Bonus",
    ["Monstropolis - Chest 17 (Small Chest, The Power Plant: Accessway) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 17 (Small Chest, The Power Plant: Accessway) - Song Bonus",
    ["Monstropolis - Chest 18 (Small Chest, The Power Plant: Tank Yard) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 18 (Small Chest, The Power Plant: Tank Yard) - Song Bonus",
    ["Monstropolis - Chest 19 (Large Chest, The Power Plant: Tank Yard) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 19 (Large Chest, The Power Plant: Tank Yard) - Song Bonus",
    ["Monstropolis - Chest 2 (Small Chest, Monsters) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 2 (Small Chest, Monsters) - Song Bonus",
    ["Monstropolis - Chest 20 (Small Chest, The Power Plant: Vault Passage) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 20 (Small Chest, The Power Plant: Vault Passage) - Song Bonus",
    ["Monstropolis - Chest 21 (Small Chest, The Power Plant: Vault Passage) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 21 (Small Chest, The Power Plant: Vault Passage) - Song Bonus",
    ["Monstropolis - Chest 22 (Small Chest, The Power Plant: Accessway) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 22 (Small Chest, The Power Plant: Accessway) - Song Bonus",
    ["Monstropolis - Chest 3 (Small Chest, Monsters) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 3 (Small Chest, Monsters) - Song Bonus",
    ["Monstropolis - Chest 4 (Small Chest, Monsters) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 4 (Small Chest, Monsters) - Song Bonus",
    ["Monstropolis - Chest 5 (Small Chest, Monsters) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 5 (Small Chest, Monsters) - Song Bonus",
    ["Monstropolis - Chest 6 (Small Chest, Monsters) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 6 (Small Chest, Monsters) - Song Bonus",
    ["Monstropolis - Chest 7 (Small Chest, The Door Vault: Service Area) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 7 (Small Chest, The Door Vault: Service Area) - Song Bonus",
    ["Monstropolis - Chest 8 (Small Chest, The Door Vault: Service Area) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 8 (Small Chest, The Door Vault: Service Area) - Song Bonus",
    ["Monstropolis - Chest 9 (Large Chest, The Factory: Basement) - Song Bonus"] = "@Monstropolis - All Checks/Monstropolis - Chest 9 (Large Chest, The Factory: Basement) - Song Bonus",
    ["Monstropolis - Monsters Inc.: Laugh Floor Unversed - Reward 2"] = "@Monstropolis - All Checks/Monstropolis - Monsters Inc.: Laugh Floor Unversed - Reward 2",
    ["Monstropolis - Monsters Inc.: Laugh Floor Unversed - Reward 3"] = "@Monstropolis - All Checks/Monstropolis - Monsters Inc.: Laugh Floor Unversed - Reward 3",
    ["Monstropolis - Monsters Inc.: Lobby & Offices Unversed - Reward 2"] = "@Monstropolis - All Checks/Monstropolis - Monsters Inc.: Lobby & Offices Unversed - Reward 2",
    ["Monstropolis - Monsters Inc.: Lobby & Offices Unversed - Reward 3"] = "@Monstropolis - All Checks/Monstropolis - Monsters Inc.: Lobby & Offices Unversed - Reward 3",
    ["Monstropolis - The Door Vault: Upper Level Heartless - Reward 2"] = "@Monstropolis - All Checks/Monstropolis - The Door Vault: Upper Level Heartless - Reward 2",
    ["Monstropolis - The Door Vault: Upper Level Heartless - Reward 3"] = "@Monstropolis - All Checks/Monstropolis - The Door Vault: Upper Level Heartless - Reward 3",
    ["Monstropolis - The Factory: Second Floor Heartless & Unversed - Reward 2"] = "@Monstropolis - All Checks/Monstropolis - The Factory: Second Floor Heartless & Unversed - Reward 2",
    ["Monstropolis - The Factory: Second Floor Heartless & Unversed - Reward 3"] = "@Monstropolis - All Checks/Monstropolis - The Factory: Second Floor Heartless & Unversed - Reward 3",
    ["Monstropolis - The Factory: Second Floor Unversed - Reward 2"] = "@Monstropolis - All Checks/Monstropolis - The Factory: Second Floor Unversed - Reward 2",
    ["Monstropolis - The Factory: Second Floor Unversed - Reward 3"] = "@Monstropolis - All Checks/Monstropolis - The Factory: Second Floor Unversed - Reward 3",
    ["Monstropolis - The Power Plant: Accessway Heartless & Unversed - Reward 2"] = "@Monstropolis - All Checks/Monstropolis - The Power Plant: Accessway Heartless & Unversed - Reward 2",
    ["Monstropolis - The Power Plant: Accessway Heartless & Unversed - Reward 3"] = "@Monstropolis - All Checks/Monstropolis - The Power Plant: Accessway Heartless & Unversed - Reward 3",
    ["Monstropolis - The Power Plant: Tank Yard Unversed - Reward 2"] = "@Monstropolis - All Checks/Monstropolis - The Power Plant: Tank Yard Unversed - Reward 2",
    ["Monstropolis - The Power Plant: Tank Yard Unversed - Reward 3"] = "@Monstropolis - All Checks/Monstropolis - The Power Plant: Tank Yard Unversed - Reward 3",
    ["Olympus - Chest 1 (Small Chest, Mount Olympus: Ravine) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 1 (Small Chest, Mount Olympus: Ravine) - Song Bonus",
    ["Olympus - Chest 10 (Small Chest, Mount Olympus: Mountainside) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 10 (Small Chest, Mount Olympus: Mountainside) - Song Bonus",
    ["Olympus - Chest 11 (Small Chest, Mount Olympus: Summit) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 11 (Small Chest, Mount Olympus: Summit) - Song Bonus",
    ["Olympus - Chest 12 (Small Chest, Mount Olympus: Mountainside) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 12 (Small Chest, Mount Olympus: Mountainside) - Song Bonus",
    ["Olympus - Chest 13 (Small Chest, Thebes: Alleyway) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 13 (Small Chest, Thebes: Alleyway) - Song Bonus",
    ["Olympus - Chest 14 (Small Chest, Thebes: Alleyway) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 14 (Small Chest, Thebes: Alleyway) - Song Bonus",
    ["Olympus - Chest 15 (Small Chest, Thebes: Agora) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 15 (Small Chest, Thebes: Agora) - Song Bonus",
    ["Olympus - Chest 16 (Small Chest, Thebes: The Big Olive) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 16 (Small Chest, Thebes: The Big Olive) - Song Bonus",
    ["Olympus - Chest 17 (Small Chest, Thebes: The Big Olive) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 17 (Small Chest, Thebes: The Big Olive) - Song Bonus",
    ["Olympus - Chest 18 (Small Chest, Thebes: Gardens) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 18 (Small Chest, Thebes: Gardens) - Song Bonus",
    ["Olympus - Chest 19 (Small Chest, Thebes: Overlook) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 19 (Small Chest, Thebes: Overlook) - Song Bonus",
    ["Olympus - Chest 2 (Small Chest, Mount Olympus: Ravine) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 2 (Small Chest, Mount Olympus: Ravine) - Song Bonus",
    ["Olympus - Chest 20 (Small Chest, Thebes: Overlook) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 20 (Small Chest, Thebes: Overlook) - Song Bonus",
    ["Olympus - Chest 21 (Small Chest, Thebes: Gardens) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 21 (Small Chest, Thebes: Gardens) - Song Bonus",
    ["Olympus - Chest 22 (Small Chest, Thebes: Overlook) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 22 (Small Chest, Thebes: Overlook) - Song Bonus",
    ["Olympus - Chest 23 (Small Chest, Thebes: Overlook) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 23 (Small Chest, Thebes: Overlook) - Song Bonus",
    ["Olympus - Chest 24 (Large Chest, Thebes: Overlook) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 24 (Large Chest, Thebes: Overlook) - Song Bonus",
    ["Olympus - Chest 25 (Small Chest, Realm of the Gods: Courtyard) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 25 (Small Chest, Realm of the Gods: Courtyard) - Song Bonus",
    ["Olympus - Chest 26 (Small Chest, Realm of the Gods: Courtyard) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 26 (Small Chest, Realm of the Gods: Courtyard) - Song Bonus",
    ["Olympus - Chest 27 (Small Chest, Realm of the Gods: Courtyard) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 27 (Small Chest, Realm of the Gods: Courtyard) - Song Bonus",
    ["Olympus - Chest 28 (Small Chest, Realm of the Gods: Corridors) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 28 (Small Chest, Realm of the Gods: Corridors) - Song Bonus",
    ["Olympus - Chest 29 (Large Chest, Realm of the Gods: Corridors) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 29 (Large Chest, Realm of the Gods: Corridors) - Song Bonus",
    ["Olympus - Chest 3 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 3 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus",
    ["Olympus - Chest 30 (Small Chest, Realm of the Gods: Cloud Ridge) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 30 (Small Chest, Realm of the Gods: Cloud Ridge) - Song Bonus",
    ["Olympus - Chest 31 (Large Chest, Realm of the Gods: Apex) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 31 (Large Chest, Realm of the Gods: Apex) - Song Bonus",
    ["Olympus - Chest 32 (Small Chest, Realm of the Gods: Apex) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 32 (Small Chest, Realm of the Gods: Apex) - Song Bonus",
    ["Olympus - Chest 4 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 4 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus",
    ["Olympus - Chest 5 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 5 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus",
    ["Olympus - Chest 6 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 6 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus",
    ["Olympus - Chest 7 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 7 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus",
    ["Olympus - Chest 8 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 8 (Small Chest, Mount Olympus: Cliff Ascent) - Song Bonus",
    ["Olympus - Chest 9 (Large Chest, Mount Olympus: Cliff Ascent) - Song Bonus"] = "@Olympus - All Checks/Olympus - Chest 9 (Large Chest, Mount Olympus: Cliff Ascent) - Song Bonus",
    ["Olympus - Defeat Darkside (Final World) - Reward 2"] = "@Olympus - All Checks/Olympus - Defeat Darkside (Final World) - Reward 2",
    ["Olympus - Defeat Darkside (Final World) - Reward 3"] = "@Olympus - All Checks/Olympus - Defeat Darkside (Final World) - Reward 3",
    ["Olympus - Mount Olympus: Cliff Ascent Heartless - Reward 2"] = "@Olympus - All Checks/Olympus - Mount Olympus: Cliff Ascent Heartless - Reward 2",
    ["Olympus - Mount Olympus: Cliff Ascent Heartless - Reward 3"] = "@Olympus - All Checks/Olympus - Mount Olympus: Cliff Ascent Heartless - Reward 3",
    ["Olympus - Realm of the Gods: Courtyard Satyrs - Reward 2"] = "@Olympus - All Checks/Olympus - Realm of the Gods: Courtyard Satyrs - Reward 2",
    ["Olympus - Realm of the Gods: Courtyard Satyrs - Reward 3"] = "@Olympus - All Checks/Olympus - Realm of the Gods: Courtyard Satyrs - Reward 3",
    ["Olympus - Thebes: Agora Flame Cores - Reward 2"] = "@Olympus - All Checks/Olympus - Thebes: Agora Flame Cores - Reward 2",
    ["Olympus - Thebes: Agora Flame Cores - Reward 3"] = "@Olympus - All Checks/Olympus - Thebes: Agora Flame Cores - Reward 3",
    ["Olympus - Thebes: Alleyway Heartless - Reward 2"] = "@Olympus - All Checks/Olympus - Thebes: Alleyway Heartless - Reward 2",
    ["Olympus - Thebes: Alleyway Heartless - Reward 3"] = "@Olympus - All Checks/Olympus - Thebes: Alleyway Heartless - Reward 3",
    ["Olympus - Thebes: Gardens Flame Cores - Reward 2"] = "@Olympus - All Checks/Olympus - Thebes: Gardens Flame Cores - Reward 2",
    ["Olympus - Thebes: Gardens Flame Cores - Reward 3"] = "@Olympus - All Checks/Olympus - Thebes: Gardens Flame Cores - Reward 3",
    ["Olympus - Thebes: Overlook Flame Cores - Reward 2"] = "@Olympus - All Checks/Olympus - Thebes: Overlook Flame Cores - Reward 2",
    ["Olympus - Thebes: Overlook Flame Cores - Reward 3"] = "@Olympus - All Checks/Olympus - Thebes: Overlook Flame Cores - Reward 3",
    ["Re Mind - Chest 1 (Large Chest, The Stairway to the Sky) - Song Bonus"] = "@Re Mind - All Checks/Re Mind - Chest 1 (Large Chest, The Stairway to the Sky) - Song Bonus",
    ["Re Mind - Chest 2 (Large Chest, Breezy Quarter) - Song Bonus"] = "@Re Mind - All Checks/Re Mind - Chest 2 (Large Chest, Breezy Quarter) - Song Bonus",
    ["Re Mind - Chest 3 (Small Chest, Breezy Quarter) - Song Bonus"] = "@Re Mind - All Checks/Re Mind - Chest 3 (Small Chest, Breezy Quarter) - Song Bonus",
    ["Re Mind - Chest 4 (Small Chest, Breezy Quarter) - Song Bonus"] = "@Re Mind - All Checks/Re Mind - Chest 4 (Small Chest, Breezy Quarter) - Song Bonus",
    ["Re Mind - Chest 5 (Small Chest, Breezy Quarter) - Song Bonus"] = "@Re Mind - All Checks/Re Mind - Chest 5 (Small Chest, Breezy Quarter) - Song Bonus",
    ["Re Mind - Chest 6 (Small Chest, Breezy Quarter) - Song Bonus"] = "@Re Mind - All Checks/Re Mind - Chest 6 (Small Chest, Breezy Quarter) - Song Bonus",
    ["Re Mind - Chest 7 (Small Chest, Breezy Quarter) - Song Bonus"] = "@Re Mind - All Checks/Re Mind - Chest 7 (Small Chest, Breezy Quarter) - Song Bonus",
    ["Re Mind - Chest 8 (Small Chest, Breezy Quarter) - Song Bonus"] = "@Re Mind - All Checks/Re Mind - Chest 8 (Small Chest, Breezy Quarter) - Song Bonus",
    ["Re Mind - Chest 9 (Small Chest, Breezy Quarter) - Song Bonus"] = "@Re Mind - All Checks/Re Mind - Chest 9 (Small Chest, Breezy Quarter) - Song Bonus",
    ["After the Saïx boss battle in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation - Reward 2"] = "@Re Mind - All Checks/After the Saïx boss battle in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation - Reward 2",
    ["After the Saïx boss battle in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation - Reward 3"] = "@Re Mind - All Checks/After the Saïx boss battle in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation - Reward 3",
    ["Defeat Anti-Aqua in The Keyblade Graveyard (Re:Mind) - Reward 2"] = "@Re Mind - All Checks/Defeat Anti-Aqua in The Keyblade Graveyard (Re:Mind) - Reward 2",
    ["Defeat Anti-Aqua in The Keyblade Graveyard (Re:Mind) - Reward 3"] = "@Re Mind - All Checks/Defeat Anti-Aqua in The Keyblade Graveyard (Re:Mind) - Reward 3",
    ["Defeat Armored Xehanort in Re:Mind - Reward 2"] = "@Re Mind - All Checks/Defeat Armored Xehanort in Re:Mind - Reward 2",
    ["Defeat Armored Xehanort in Re:Mind - Reward 3"] = "@Re Mind - All Checks/Defeat Armored Xehanort in Re:Mind - Reward 3",
    ["Defeat Dark Inferno χ in The Keyblade Graveyard (Re:Mind) - Reward 2"] = "@Re Mind - All Checks/Defeat Dark Inferno χ in The Keyblade Graveyard (Re:Mind) - Reward 2",
    ["Defeat Dark Inferno χ in The Keyblade Graveyard (Re:Mind) - Reward 3"] = "@Re Mind - All Checks/Defeat Dark Inferno χ in The Keyblade Graveyard (Re:Mind) - Reward 3",
    ["Defeat Darkside in Scala ad Caelum (Re:Mind) - Breezy Quarter - Reward 2"] = "@Re Mind - All Checks/Defeat Darkside in Scala ad Caelum (Re:Mind) - Breezy Quarter - Reward 2",
    ["Defeat Darkside in Scala ad Caelum (Re:Mind) - Breezy Quarter - Reward 3"] = "@Re Mind - All Checks/Defeat Darkside in Scala ad Caelum (Re:Mind) - Breezy Quarter - Reward 3",
    ["Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction - Reward 2"] = "@Re Mind - All Checks/Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction - Reward 2",
    ["Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction - Reward 3"] = "@Re Mind - All Checks/Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction - Reward 3",
    ["Defeat Terra-Xehanort in The Keyblade Graveyard (Re:Mind) - Reward 2"] = "@Re Mind - All Checks/Defeat Terra-Xehanort in The Keyblade Graveyard (Re:Mind) - Reward 2",
    ["Defeat Terra-Xehanort in The Keyblade Graveyard (Re:Mind) - Reward 3"] = "@Re Mind - All Checks/Defeat Terra-Xehanort in The Keyblade Graveyard (Re:Mind) - Reward 3",
    ["Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation - Reward 2"] = "@Re Mind - All Checks/Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation - Reward 2",
    ["Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation - Reward 3"] = "@Re Mind - All Checks/Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation - Reward 3",
    ["Defeat Xigbar & Dark Riku in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction - Reward 2"] = "@Re Mind - All Checks/Defeat Xigbar & Dark Riku in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction - Reward 2",
    ["Defeat Xigbar & Dark Riku in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction - Reward 3"] = "@Re Mind - All Checks/Defeat Xigbar & Dark Riku in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction - Reward 3",
    ["Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Tower of Endings - Reward 2"] = "@Re Mind - All Checks/Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Tower of Endings - Reward 2",
    ["Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Tower of Endings - Reward 3"] = "@Re Mind - All Checks/Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Tower of Endings - Reward 3",
    ["San Fransokyo - Chest 1 (Small Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 1 (Small Chest, The City: Central District) - Song Bonus",
    ["San Fransokyo - Chest 30 (Small Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 30 (Small Chest, The City: Central District) - Song Bonus",
    ["San Fransokyo - Chest 11 (Small Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 11 (Small Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 12 (Small Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 12 (Small Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 18 (Small Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 18 (Small Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 10 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 10 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 13 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 13 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 14 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 14 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 15 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 15 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 16 (Small Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 16 (Small Chest, The City: Central District) - Song Bonus",
    ["San Fransokyo - Chest 17 (Small Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 17 (Small Chest, The City: Central District) - Song Bonus",
    ["San Fransokyo - Chest 19 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 19 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 2 (Small Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 2 (Small Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 20 (Small Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 20 (Small Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 21 (Small Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 21 (Small Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 22 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 22 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 23 (Small Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 23 (Small Chest, The City: Central District) - Song Bonus",
    ["San Fransokyo - Chest 24 (Small Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 24 (Small Chest, The City: Central District) - Song Bonus",
    ["San Fransokyo - Chest 25 (Small Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 25 (Small Chest, The City: Central District) - Song Bonus",
    ["San Fransokyo - Chest 26 (Small Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 26 (Small Chest, The City: Central District) - Song Bonus",
    ["San Fransokyo - Chest 27 (Small Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 27 (Small Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 28 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 28 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 29 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 29 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 3 (Large Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 3 (Large Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 31 (Small Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 31 (Small Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 32 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 32 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 33 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 33 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 34 (Large Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 34 (Large Chest, The City: Central District) - Song Bonus",
    ["San Fransokyo - Chest 35 (Large Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 35 (Large Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 36 (Large Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 36 (Large Chest, The City: Central District) - Song Bonus",
    ["San Fransokyo - Chest 4 (Small Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 4 (Small Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 5 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 5 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 6 (Small Chest, The City: North District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 6 (Small Chest, The City: North District) - Song Bonus",
    ["San Fransokyo - Chest 7 (Small Chest, The City: South District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 7 (Small Chest, The City: South District) - Song Bonus",
    ["San Fransokyo - Chest 8 (Small Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 8 (Small Chest, The City: Central District) - Song Bonus",
    ["San Fransokyo - Chest 9 (Small Chest, The City: Central District) - Song Bonus"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 9 (Small Chest, The City: Central District) - Song Bonus",
    ["Defeat Dark Baymax in San Fransokyo - The City (Day) - Reward 2"] = "@San Fransokyo - All Checks/Defeat Dark Baymax in San Fransokyo - The City (Day) - Reward 2",
    ["Defeat Dark Baymax in San Fransokyo - The City (Day) - Reward 3"] = "@San Fransokyo - All Checks/Defeat Dark Baymax in San Fransokyo - The City (Day) - Reward 3",
    ["Defeat Metal Troll in San Fransokyo: The Bridge - Reward 2"] = "@San Fransokyo - All Checks/Defeat Metal Troll in San Fransokyo: The Bridge - Reward 2",
    ["Defeat Metal Troll in San Fransokyo: The Bridge - Reward 3"] = "@San Fransokyo - All Checks/Defeat Metal Troll in San Fransokyo: The Bridge - Reward 3",
    ["Meet Big Hero 6 in San Fransokyo - Hiro's Garage - Reward 2"] = "@San Fransokyo - All Checks/Meet Big Hero 6 in San Fransokyo - Hiro's Garage - Reward 2",
    ["Meet Big Hero 6 in San Fransokyo - Hiro's Garage - Reward 3"] = "@San Fransokyo - All Checks/Meet Big Hero 6 in San Fransokyo - Hiro's Garage - Reward 3",
    ["Rescue Big Hero 6 from Darkubes in San Fransokyo - The City (Night) - Reward 2"] = "@San Fransokyo - All Checks/Rescue Big Hero 6 from Darkubes in San Fransokyo - The City (Night) - Reward 2",
    ["Rescue Big Hero 6 from Darkubes in San Fransokyo - The City (Night) - Reward 3"] = "@San Fransokyo - All Checks/Rescue Big Hero 6 from Darkubes in San Fransokyo - The City (Night) - Reward 3",
    ["The Caribbean - Chest 28 (Small Chest, Sandbar Isle: Underwater) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 28 (Small Chest, Sandbar Isle: Underwater) - Song Bonus",
    ["The Caribbean - Chest 29 (Small Chest, Sandbar Isle: Underwater) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 29 (Small Chest, Sandbar Isle: Underwater) - Song Bonus",
    ["The Caribbean - Chest 30 (Small Chest, Sandbar Isle: Underwater) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 30 (Small Chest, Sandbar Isle: Underwater) - Song Bonus",
    ["The Caribbean - Chest 31 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 31 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 32 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 32 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 33 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 33 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 34 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 34 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 35 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 35 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 36 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 36 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 37 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 37 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 38 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 38 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 39 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 39 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 40 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 40 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 7 (Small Chest, Ship's End) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 7 (Small Chest, Ship's End) - Song Bonus",
    ["The Caribbean - Chest 8 (Small Chest, Ship's End) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 8 (Small Chest, Ship's End) - Song Bonus",
    ["The Caribbean - Chest 10 (Large Chest, Isla Verdemontana) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 10 (Large Chest, Isla Verdemontana) - Song Bonus",
    ["The Caribbean - Chest 11 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 11 (Small Chest, Sandbar Isle: Underwater Alcove) - Song Bonus",
    ["The Caribbean - Chest 12 (Small Chest, Exile Island) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 12 (Small Chest, Exile Island) - Song Bonus",
    ["The Caribbean - Chest 13 (Large Chest, Confinement Island) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 13 (Large Chest, Confinement Island) - Song Bonus",
    ["The Caribbean - Chest 14 (Small Chest, The Gateway of Regret) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 14 (Small Chest, The Gateway of Regret) - Song Bonus",
    ["The Caribbean - Chest 15 (Large Chest, Huddled Isles: Undersea Cavern) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 15 (Large Chest, Huddled Isles: Undersea Cavern) - Song Bonus",
    ["The Caribbean - Chest 17 (Large Chest, Isla de los Mastiles) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 17 (Large Chest, Isla de los Mastiles) - Song Bonus",
    ["The Caribbean - Chest 18 (Large Chest, Ship's End) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 18 (Large Chest, Ship's End) - Song Bonus",
    ["The Caribbean - Chest 19 (Large Chest, Sandbar Isle) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 19 (Large Chest, Sandbar Isle) - Song Bonus",
    ["The Caribbean - Chest 2 (Small Chest, Huddled Isles: Undersea Cavern) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 2 (Small Chest, Huddled Isles: Undersea Cavern) - Song Bonus",
    ["The Caribbean - Chest 20 (Large Chest, Huddled Isles) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 20 (Large Chest, Huddled Isles) - Song Bonus",
    ["The Caribbean - Chest 25 (Small Chest, Isla Verdemontana) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 25 (Small Chest, Isla Verdemontana) - Song Bonus",
    ["The Caribbean - Chest 26 (Small Chest, Sandbar Isle: Underwater) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 26 (Small Chest, Sandbar Isle: Underwater) - Song Bonus",
    ["The Caribbean - Chest 27 (Small Chest, Sandbar Isle) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 27 (Small Chest, Sandbar Isle) - Song Bonus",
    ["The Caribbean - Chest 3 (Small Chest, Huddled Isles: Undersea Cavern) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 3 (Small Chest, Huddled Isles: Undersea Cavern) - Song Bonus",
    ["The Caribbean - Chest 4 (Large Chest, Huddled Isles: Undersea Cavern) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 4 (Large Chest, Huddled Isles: Undersea Cavern) - Song Bonus",
    ["The Caribbean - Chest 45 (Small Chest, The Leviathan) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 45 (Small Chest, The Leviathan) - Song Bonus",
    ["The Caribbean - Chest 46 (Small Chest, Port Royal: Fort) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 46 (Small Chest, Port Royal: Fort) - Song Bonus",
    ["The Caribbean - Chest 47 (Large Chest, Port Royal: Fort) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 47 (Large Chest, Port Royal: Fort) - Song Bonus",
    ["The Caribbean - Chest 48 (Small Chest, Port Royal: Seaport) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 48 (Small Chest, Port Royal: Seaport) - Song Bonus",
    ["The Caribbean - Chest 49 (Small Chest, Port Royal: Seaport) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 49 (Small Chest, Port Royal: Seaport) - Song Bonus",
    ["The Caribbean - Chest 50 (Small Chest, Port Royal: Seaport) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 50 (Small Chest, Port Royal: Seaport) - Song Bonus",
    ["The Caribbean - Chest 51 (Large Chest, Port Royal: Docks) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 51 (Large Chest, Port Royal: Docks) - Song Bonus",
    ["The Caribbean - Chest 52 (Small Chest, Port Royal: Settlement) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 52 (Small Chest, Port Royal: Settlement) - Song Bonus",
    ["The Caribbean - Chest 53 (Small Chest, Port Royal: Docks) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 53 (Small Chest, Port Royal: Docks) - Song Bonus",
    ["The Caribbean - Chest 54 (Small Chest, Port Royal: Underwater) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 54 (Small Chest, Port Royal: Underwater) - Song Bonus",
    ["The Caribbean - Chest 55 (Small Chest, Port Royal: Settlement) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 55 (Small Chest, Port Royal: Settlement) - Song Bonus",
    ["The Caribbean - Chest 56 (Small Chest, Port Royal: Seaport) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 56 (Small Chest, Port Royal: Seaport) - Song Bonus",
    ["The Caribbean - Chest 6 (Large Chest, Isla de los Mastiles) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 6 (Large Chest, Isla de los Mastiles) - Song Bonus",
    ["The Caribbean - Chest 9 (Small Chest, Isla Verdemontana) - Song Bonus"] = "@The Caribbean - All Checks/The Caribbean - Chest 9 (Small Chest, Isla Verdemontana) - Song Bonus",
    ["1st Ship Battle in The Caribbean - Over the Edge - Reward 2"] = "@The Caribbean - All Checks/1st Ship Battle in The Caribbean - Over the Edge - Reward 2",
    ["1st Ship Battle in The Caribbean - Over the Edge - Reward 3"] = "@The Caribbean - All Checks/1st Ship Battle in The Caribbean - Over the Edge - Reward 3",
    ["2nd Ship Battle in The Caribbean: The High Seas - Port Royal Waters - Reward 2"] = "@The Caribbean - All Checks/2nd Ship Battle in The Caribbean: The High Seas - Port Royal Waters - Reward 2",
    ["2nd Ship Battle in The Caribbean: The High Seas - Port Royal Waters - Reward 3"] = "@The Caribbean - All Checks/2nd Ship Battle in The Caribbean: The High Seas - Port Royal Waters - Reward 3",
    ["Defeat Anchor Raiders in The Caribbean - Davy Jones' Locker - Reward 2"] = "@The Caribbean - All Checks/Defeat Anchor Raiders in The Caribbean - Davy Jones' Locker - Reward 2",
    ["Defeat Anchor Raiders in The Caribbean - Davy Jones' Locker - Reward 3"] = "@The Caribbean - All Checks/Defeat Anchor Raiders in The Caribbean - Davy Jones' Locker - Reward 3",
    ["Defeat Raging Vulture in The Caribbean - The High Seas: Southern Waters - Reward 2"] = "@The Caribbean - All Checks/Defeat Raging Vulture in The Caribbean - The High Seas: Southern Waters - Reward 2",
    ["Defeat Raging Vulture in The Caribbean - The High Seas: Southern Waters - Reward 3"] = "@The Caribbean - All Checks/Defeat Raging Vulture in The Caribbean - The High Seas: Southern Waters - Reward 3",
    ["Race Luxord to Port Royal in The Caribbean - Reward 2"] = "@The Caribbean - All Checks/Race Luxord to Port Royal in The Caribbean - Reward 2",
    ["Race Luxord to Port Royal in The Caribbean - Reward 3"] = "@The Caribbean - All Checks/Race Luxord to Port Royal in The Caribbean - Reward 3",
    ["3rd Ship Battle in The Caribbean: The High Seas - Forsaken Isle - Reward 2"] = "@The Caribbean - All Checks/3rd Ship Battle in The Caribbean: The High Seas - Forsaken Isle - Reward 2",
    ["3rd Ship Battle in The Caribbean: The High Seas - Forsaken Isle - Reward 3"] = "@The Caribbean - All Checks/3rd Ship Battle in The Caribbean: The High Seas - Forsaken Isle - Reward 3",
    ["Defeat Davy Jones in The Caribbean - Shipwreck Cove - Reward 2"] = "@The Caribbean - All Checks/Defeat Davy Jones in The Caribbean - Shipwreck Cove - Reward 2",
    ["Defeat Davy Jones in The Caribbean - Shipwreck Cove - Reward 3"] = "@The Caribbean - All Checks/Defeat Davy Jones in The Caribbean - Shipwreck Cove - Reward 3",
    ["Defeat Kraken in The Caribbean - Shipwreck Cove - Reward 2"] = "@The Caribbean - All Checks/Defeat Kraken in The Caribbean - Shipwreck Cove - Reward 2",
    ["Defeat Kraken in The Caribbean - Shipwreck Cove - Reward 3"] = "@The Caribbean - All Checks/Defeat Kraken in The Caribbean - Shipwreck Cove - Reward 3",
    ["The City Heartless at Hiro's indicator in San Fransokyo - The City (Day) - Reward 2"] = "@San Fransokyo - All Checks/The City Heartless at Hiro's indicator in San Fransokyo - The City (Day) - Reward 2",
    ["The City Heartless at Hiro's indicator in San Fransokyo - The City (Day) - Reward 3"] = "@San Fransokyo - All Checks/The City Heartless at Hiro's indicator in San Fransokyo - The City (Day) - Reward 3",
    ["The Final World - Chest 1 (Large Chest, The Final World) - Song Bonus"] = "@Keyblade Graveyard - All Checks/The Final World - Chest 1 (Large Chest, The Final World) - Song Bonus",
    ["The Labyrinth of Ice: Lower Tier Ninjas II - Reward 2"] = "@Arendelle - All Checks/The Labyrinth of Ice: Lower Tier Ninjas II - Reward 2",
    ["The Labyrinth of Ice: Lower Tier Ninjas II - Reward 3"] = "@Arendelle - All Checks/The Labyrinth of Ice: Lower Tier Ninjas II - Reward 3",
    ["The Labyrinth of Ice: Middle Tier Ninjas I - Reward 2"] = "@Arendelle - All Checks/The Labyrinth of Ice: Middle Tier Ninjas I - Reward 2",
    ["The Labyrinth of Ice: Middle Tier Ninjas I - Reward 3"] = "@Arendelle - All Checks/The Labyrinth of Ice: Middle Tier Ninjas I - Reward 3",
    ["The Labyrinth of Ice: Middle Tier Ninjas III - Reward 2"] = "@Arendelle - All Checks/The Labyrinth of Ice: Middle Tier Ninjas III - Reward 2",
    ["The Labyrinth of Ice: Middle Tier Ninjas III - Reward 3"] = "@Arendelle - All Checks/The Labyrinth of Ice: Middle Tier Ninjas III - Reward 3",
    ["The Labyrinth of Ice: Middle Tier Ninjas IV - Reward 2"] = "@Arendelle - All Checks/The Labyrinth of Ice: Middle Tier Ninjas IV - Reward 2",
    ["The Labyrinth of Ice: Middle Tier Ninjas IV - Reward 3"] = "@Arendelle - All Checks/The Labyrinth of Ice: Middle Tier Ninjas IV - Reward 3",
    ["Toy Box - Andy's House Heartless - Reward 2"] = "@Toy Box - All Checks/Toy Box - Andy's House Heartless - Reward 2",
    ["Toy Box - Andy's House Heartless - Reward 3"] = "@Toy Box - All Checks/Toy Box - Andy's House Heartless - Reward 3",
    ["Toy Box - Chest 1 (Large Chest, Andy's House) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 1 (Large Chest, Andy's House) - Song Bonus",
    ["Toy Box - Chest 10 (Small Chest, Galaxy Toys: Action Figures) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 10 (Small Chest, Galaxy Toys: Action Figures) - Song Bonus",
    ["Toy Box - Chest 11 (Small Chest, Galaxy Toys: Lower Vents) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 11 (Small Chest, Galaxy Toys: Lower Vents) - Song Bonus",
    ["Toy Box - Chest 12 (Small Chest, Galaxy Toys: Lower Vents) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 12 (Small Chest, Galaxy Toys: Lower Vents) - Song Bonus",
    ["Toy Box - Chest 13 (Large Chest, Galaxy Toys: Lower Vents) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 13 (Large Chest, Galaxy Toys: Lower Vents) - Song Bonus",
    ["Toy Box - Chest 14 (Small Chest, Babies and Toddlers: Dolls) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 14 (Small Chest, Babies and Toddlers: Dolls) - Song Bonus",
    ["Toy Box - Chest 15 (Small Chest, Babies and Toddlers: Dolls) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 15 (Small Chest, Babies and Toddlers: Dolls) - Song Bonus",
    ["Toy Box - Chest 16 (Small Chest, Babies and Toddlers: Dolls) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 16 (Small Chest, Babies and Toddlers: Dolls) - Song Bonus",
    ["Toy Box - Chest 17 (Small Chest, Babies and Toddlers: Dolls) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 17 (Small Chest, Babies and Toddlers: Dolls) - Song Bonus",
    ["Toy Box - Chest 18 (Small Chest, Babies and Toddlers: Outdoors) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 18 (Small Chest, Babies and Toddlers: Outdoors) - Song Bonus",
    ["Toy Box - Chest 19 (Small Chest, Babies and Toddlers: Outdoors) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 19 (Small Chest, Babies and Toddlers: Outdoors) - Song Bonus",
    ["Toy Box - Chest 2 (Large Chest, Andy's House) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 2 (Large Chest, Andy's House) - Song Bonus",
    ["Toy Box - Chest 20 (Small Chest, Galaxy Toys: Video Games) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 20 (Small Chest, Galaxy Toys: Video Games) - Song Bonus",
    ["Toy Box - Chest 21 (Small Chest, Galaxy Toys: Kid Korral) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 21 (Small Chest, Galaxy Toys: Kid Korral) - Song Bonus",
    ["Toy Box - Chest 22 (Small Chest, Galaxy Toys: Kid Korral) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 22 (Small Chest, Galaxy Toys: Kid Korral) - Song Bonus",
    ["Toy Box - Chest 23 (Small Chest, Galaxy Toys: Kid Korral) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 23 (Small Chest, Galaxy Toys: Kid Korral) - Song Bonus",
    ["Toy Box - Chest 24 (Large Chest, Galaxy Toys: Kid Korral) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 24 (Large Chest, Galaxy Toys: Kid Korral) - Song Bonus",
    ["Toy Box - Chest 25 (Small Chest, Galaxy Toys: Kid Korral) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 25 (Small Chest, Galaxy Toys: Kid Korral) - Song Bonus",
    ["Toy Box - Chest 26 (Small Chest, Galaxy Toys: Rest Area) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 26 (Small Chest, Galaxy Toys: Rest Area) - Song Bonus",
    ["Toy Box - Chest 27 (Small Chest, Galaxy Toys: Main Floor 1F) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 27 (Small Chest, Galaxy Toys: Main Floor 1F) - Song Bonus",
    ["Toy Box - Chest 28 (Small Chest, Babies and Toddlers: Outdoors) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 28 (Small Chest, Babies and Toddlers: Outdoors) - Song Bonus",
    ["Toy Box - Chest 29 (Large Chest, Galaxy Toys: Main Floor: 3F) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 29 (Large Chest, Galaxy Toys: Main Floor: 3F) - Song Bonus",
    ["Toy Box - Chest 3 (Small Chest, Andy's House) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 3 (Small Chest, Andy's House) - Song Bonus",
    ["Toy Box - Chest 4 (Small Chest, Andy's House) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 4 (Small Chest, Andy's House) - Song Bonus",
    ["Toy Box - Chest 5 (Large Chest, Galaxy Toys: Main Floor 1F) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 5 (Large Chest, Galaxy Toys: Main Floor 1F) - Song Bonus",
    ["Toy Box - Chest 6 (Small Chest, Galaxy Toys: Main Floor: 2F) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 6 (Small Chest, Galaxy Toys: Main Floor: 2F) - Song Bonus",
    ["Toy Box - Chest 7 (Small Chest, Galaxy Toys: Main Floor: 3F) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 7 (Small Chest, Galaxy Toys: Main Floor: 3F) - Song Bonus",
    ["Toy Box - Chest 8 (Small Chest, Galaxy Toys: Action Figures) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 8 (Small Chest, Galaxy Toys: Action Figures) - Song Bonus",
    ["Toy Box - Chest 9 (Small Chest, Galaxy Toys: Action Figures) - Song Bonus"] = "@Toy Box - All Checks/Toy Box - Chest 9 (Small Chest, Galaxy Toys: Action Figures) - Song Bonus",
    ["Toy Box - Galaxy Toys: Action Figures Supreme Smashers - Reward 2"] = "@Toy Box - All Checks/Toy Box - Galaxy Toys: Action Figures Supreme Smashers - Reward 2",
    ["Toy Box - Galaxy Toys: Action Figures Supreme Smashers - Reward 3"] = "@Toy Box - All Checks/Toy Box - Galaxy Toys: Action Figures Supreme Smashers - Reward 3",
    ["Toy Box - Galaxy Toys: Main Floor: 1F Gigas - Reward 2"] = "@Toy Box - All Checks/Toy Box - Galaxy Toys: Main Floor: 1F Gigas - Reward 2",
    ["Toy Box - Galaxy Toys: Main Floor: 1F Gigas - Reward 3"] = "@Toy Box - All Checks/Toy Box - Galaxy Toys: Main Floor: 1F Gigas - Reward 3",
    ["Twilight Town - Chest 1 (Large Chest, The Neighborhood: Tram Common) - Song Bonus"] = "@Twilight Town - All Checks/Twilight Town - Chest 1 (Large Chest, The Neighborhood: Tram Common) - Song Bonus",
    ["Twilight Town - Chest 10 (Small Chest, The Old Mansion) - Song Bonus"] = "@Twilight Town - All Checks/Twilight Town - Chest 10 (Small Chest, The Old Mansion) - Song Bonus",
    ["Twilight Town - Chest 2 (Small Chest, The Neighborhood: Tram Common) - Song Bonus"] = "@Twilight Town - All Checks/Twilight Town - Chest 2 (Small Chest, The Neighborhood: Tram Common) - Song Bonus",
    ["Twilight Town - Chest 3 (Small Chest, The Neighborhood: Tram Common) - Song Bonus"] = "@Twilight Town - All Checks/Twilight Town - Chest 3 (Small Chest, The Neighborhood: Tram Common) - Song Bonus",
    ["Twilight Town - Chest 4 (Small Chest, The Neighborhood: Tram Common) - Song Bonus"] = "@Twilight Town - All Checks/Twilight Town - Chest 4 (Small Chest, The Neighborhood: Tram Common) - Song Bonus",
    ["Twilight Town - Chest 5 (Small Chest, The Neighborhood: Tram Common) - Song Bonus"] = "@Twilight Town - All Checks/Twilight Town - Chest 5 (Small Chest, The Neighborhood: Tram Common) - Song Bonus",
    ["Twilight Town - Chest 6 (Small Chest, Underground Conduit) - Song Bonus"] = "@Twilight Town - All Checks/Twilight Town - Chest 6 (Small Chest, Underground Conduit) - Song Bonus",
    ["Twilight Town - Chest 7 (Small Chest, The Woods) - Song Bonus"] = "@Twilight Town - All Checks/Twilight Town - Chest 7 (Small Chest, The Woods) - Song Bonus",
    ["Twilight Town - Chest 8 (Small Chest, The Woods) - Song Bonus"] = "@Twilight Town - All Checks/Twilight Town - Chest 8 (Small Chest, The Woods) - Song Bonus",
    ["Twilight Town - Chest 9 (Small Chest, The Woods) - Song Bonus"] = "@Twilight Town - All Checks/Twilight Town - Chest 9 (Small Chest, The Woods) - Song Bonus",
    ["Twilight Town - The Old Mansion Heartless & Nobodies - Reward 2"] = "@Twilight Town - All Checks/Twilight Town - The Old Mansion Heartless & Nobodies - Reward 2",
    ["Twilight Town - The Old Mansion Heartless & Nobodies - Reward 3"] = "@Twilight Town - All Checks/Twilight Town - The Old Mansion Heartless & Nobodies - Reward 3",
    ["Twilight Town - The Woods Powerwilds - Reward 2"] = "@Twilight Town - All Checks/Twilight Town - The Woods Powerwilds - Reward 2",
    ["Twilight Town - The Woods Powerwilds - Reward 3"] = "@Twilight Town - All Checks/Twilight Town - The Woods Powerwilds - Reward 3",
    -- END generated: child checks
    -- BEGIN generated: gummi space (scripts/tools/generate_space_locations.py)
    ["Space - Starlight Way - Battle 01 - Countdown 1"] = "@Gummi Space - Starlight Way - All Checks/Space - Starlight Way - Battle 01 - Countdown 1",
    ["Space - Starlight Way - Battle 02 - Speed Skirmish 2"] = "@Gummi Space - Starlight Way - All Checks/Space - Starlight Way - Battle 02 - Speed Skirmish 2",
    ["Space - Starlight Way - Battle 03 - Countdown 4"] = "@Gummi Space - Starlight Way - All Checks/Space - Starlight Way - Battle 03 - Countdown 4",
    ["Space - Starlight Way - Battle 04 - Speed Skirmish 1"] = "@Gummi Space - Starlight Way - All Checks/Space - Starlight Way - Battle 04 - Speed Skirmish 1",
    ["Space - Starlight Way - Battle 05 - Speed Skirmish 3"] = "@Gummi Space - Starlight Way - All Checks/Space - Starlight Way - Battle 05 - Speed Skirmish 3",
    ["Space - Starlight Way - Battle 07 - Countdown 2"] = "@Gummi Space - Starlight Way - All Checks/Space - Starlight Way - Battle 07 - Countdown 2",
    ["Space - Starlight Way - Battle 08 - Countdown 3"] = "@Gummi Space - Starlight Way - All Checks/Space - Starlight Way - Battle 08 - Countdown 3",
    ["Space - Astrowarrior - Reward 1"] = "@Gummi Space - Starlight Way - All Checks/Space - Astrowarrior - Reward 1",
    ["Space - Astrowarrior - Reward 2"] = "@Gummi Space - Starlight Way - All Checks/Space - Astrowarrior - Reward 2",
    ["Space - Astrowarrior - Reward 3"] = "@Gummi Space - Starlight Way - All Checks/Space - Astrowarrior - Reward 3",
    ["Space - Flower Guardian - Reward 1"] = "@Gummi Space - Starlight Way - All Checks/Space - Flower Guardian - Reward 1",
    ["Space - Flower Guardian - Reward 2"] = "@Gummi Space - Starlight Way - All Checks/Space - Flower Guardian - Reward 2",
    ["Space - Flower Guardian - Reward 3"] = "@Gummi Space - Starlight Way - All Checks/Space - Flower Guardian - Reward 3",
    ["Space - Comet Crawler - Reward 1"] = "@Gummi Space - Starlight Way - All Checks/Space - Comet Crawler - Reward 1",
    ["Space - Comet Crawler - Reward 2"] = "@Gummi Space - Starlight Way - All Checks/Space - Comet Crawler - Reward 2",
    ["Space - Comet Crawler - Reward 3"] = "@Gummi Space - Starlight Way - All Checks/Space - Comet Crawler - Reward 3",
    ["Space - Starlight Way - Treasure Sphere 1"] = "@Gummi Space - Starlight Way - All Checks/Space - Starlight Way - Treasure Sphere 1",
    ["Space - Starlight Way - Treasure Sphere 2"] = "@Gummi Space - Starlight Way - All Checks/Space - Starlight Way - Treasure Sphere 2",
    ["Space - Starlight Way - Treasure Sphere 3"] = "@Gummi Space - Starlight Way - All Checks/Space - Starlight Way - Treasure Sphere 3",
    ["Space - Moogle Gazer"] = "@Gummi Space - Starlight Way - All Checks/Space - Moogle Gazer",
    ["Space - Cactuar Gazer"] = "@Gummi Space - Starlight Way - All Checks/Space - Cactuar Gazer",
    ["Space - Bomb Gazer"] = "@Gummi Space - Starlight Way - All Checks/Space - Bomb Gazer",
    ["Space - Pro Builder"] = "@Gummi Space - Starlight Way - All Checks/Space - Pro Builder",
    ["Space - Misty Stream - Battle 01 - Countdown 5"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 01 - Countdown 5",
    ["Space - Misty Stream - Battle 02 - Countdown 6"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 02 - Countdown 6",
    ["Space - Misty Stream - Battle 03 - Countdown 8"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 03 - Countdown 8",
    ["Space - Misty Stream - Battle 04 - Speed Skirmish 10"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 04 - Speed Skirmish 10",
    ["Space - Misty Stream - Battle 05 - Speed Skirmish 4"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 05 - Speed Skirmish 4",
    ["Space - Misty Stream - Battle 06 - Speed Skirmish 5"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 06 - Speed Skirmish 5",
    ["Space - Misty Stream - Battle 07 - Speed Skirmish 7"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 07 - Speed Skirmish 7",
    ["Space - Misty Stream - Battle 08 - Speed Skirmish 8"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 08 - Speed Skirmish 8",
    ["Space - Misty Stream - Battle 09 - Countdown 10"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 09 - Countdown 10",
    ["Space - Misty Stream - Battle 10 - Countdown 7"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 10 - Countdown 7",
    ["Space - Misty Stream - Battle 11 - Speed Skirmish 6"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 11 - Speed Skirmish 6",
    ["Space - Misty Stream - Battle 12 - Countdown 9"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 12 - Countdown 9",
    ["Space - Misty Stream - Battle 13 - Speed Skirmish 9"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Battle 13 - Speed Skirmish 9",
    ["Space - Dreadshark - Reward 1"] = "@Gummi Space - Misty Stream - All Checks/Space - Dreadshark - Reward 1",
    ["Space - Dreadshark - Reward 2"] = "@Gummi Space - Misty Stream - All Checks/Space - Dreadshark - Reward 2",
    ["Space - Dreadshark - Reward 3"] = "@Gummi Space - Misty Stream - All Checks/Space - Dreadshark - Reward 3",
    ["Space - Glacial Fortress - Reward 1"] = "@Gummi Space - Misty Stream - All Checks/Space - Glacial Fortress - Reward 1",
    ["Space - Glacial Fortress - Reward 2"] = "@Gummi Space - Misty Stream - All Checks/Space - Glacial Fortress - Reward 2",
    ["Space - Glacial Fortress - Reward 3"] = "@Gummi Space - Misty Stream - All Checks/Space - Glacial Fortress - Reward 3",
    ["Space - Space Worm - Reward 1"] = "@Gummi Space - Misty Stream - All Checks/Space - Space Worm - Reward 1",
    ["Space - Space Worm - Reward 2"] = "@Gummi Space - Misty Stream - All Checks/Space - Space Worm - Reward 2",
    ["Space - Space Worm - Reward 3"] = "@Gummi Space - Misty Stream - All Checks/Space - Space Worm - Reward 3",
    ["Space - Schwarzgeist - Reward 1"] = "@Gummi Space - Misty Stream - All Checks/Space - Schwarzgeist - Reward 1",
    ["Space - Schwarzgeist - Reward 2"] = "@Gummi Space - Misty Stream - All Checks/Space - Schwarzgeist - Reward 2",
    ["Space - Schwarzgeist - Reward 3"] = "@Gummi Space - Misty Stream - All Checks/Space - Schwarzgeist - Reward 3",
    ["Space - Misty Stream - Treasure Sphere 1"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Treasure Sphere 1",
    ["Space - Misty Stream - Treasure Sphere 2"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Treasure Sphere 2",
    ["Space - Misty Stream - Treasure Sphere 3"] = "@Gummi Space - Misty Stream - All Checks/Space - Misty Stream - Treasure Sphere 3",
    ["Space - Imp Gazer"] = "@Gummi Space - Misty Stream - All Checks/Space - Imp Gazer",
    ["Space - Tonberry Gazer"] = "@Gummi Space - Misty Stream - All Checks/Space - Tonberry Gazer",
    ["Space - Endymion Gazer"] = "@Gummi Space - Misty Stream - All Checks/Space - Endymion Gazer",
    ["Space - Elite Builder"] = "@Gummi Space - Misty Stream - All Checks/Space - Elite Builder",
    ["Space - Colossus Pyramid - Reward 1"] = "@Gummi Space - The Eclipse - All Checks/Space - Colossus Pyramid - Reward 1",
    ["Space - Colossus Pyramid - Reward 2"] = "@Gummi Space - The Eclipse - All Checks/Space - Colossus Pyramid - Reward 2",
    ["Space - Colossus Pyramid - Reward 3"] = "@Gummi Space - The Eclipse - All Checks/Space - Colossus Pyramid - Reward 3",
    ["Space - The Eclipse - Battle 02 - Speed Skirmish 11"] = "@Gummi Space - The Eclipse - All Checks/Space - The Eclipse - Battle 02 - Speed Skirmish 11",
    ["Space - The Eclipse - Battle 03 - Countdown 11"] = "@Gummi Space - The Eclipse - All Checks/Space - The Eclipse - Battle 03 - Countdown 11",
    ["Space - Supreme Warrior - Reward 1"] = "@Gummi Space - The Eclipse - All Checks/Space - Supreme Warrior - Reward 1",
    ["Space - Supreme Warrior - Reward 2"] = "@Gummi Space - The Eclipse - All Checks/Space - Supreme Warrior - Reward 2",
    ["Space - Supreme Warrior - Reward 3"] = "@Gummi Space - The Eclipse - All Checks/Space - Supreme Warrior - Reward 3",
    ["Space - Scarlet Shark - Reward 1"] = "@Gummi Space - The Eclipse - All Checks/Space - Scarlet Shark - Reward 1",
    ["Space - Scarlet Shark - Reward 2"] = "@Gummi Space - The Eclipse - All Checks/Space - Scarlet Shark - Reward 2",
    ["Space - Scarlet Shark - Reward 3"] = "@Gummi Space - The Eclipse - All Checks/Space - Scarlet Shark - Reward 3",
    ["Space - Omega Machina - Reward 1"] = "@Gummi Space - The Eclipse - All Checks/Space - Omega Machina - Reward 1",
    ["Space - Omega Machina - Reward 2"] = "@Gummi Space - The Eclipse - All Checks/Space - Omega Machina - Reward 2",
    ["Space - Omega Machina - Reward 3"] = "@Gummi Space - The Eclipse - All Checks/Space - Omega Machina - Reward 3",
    ["Space - The Eclipse - Treasure Sphere 1"] = "@Gummi Space - The Eclipse - All Checks/Space - The Eclipse - Treasure Sphere 1",
    ["Space - The Eclipse - Treasure Sphere 2"] = "@Gummi Space - The Eclipse - All Checks/Space - The Eclipse - Treasure Sphere 2",
    ["Space - The Eclipse - Treasure Sphere 3"] = "@Gummi Space - The Eclipse - All Checks/Space - The Eclipse - Treasure Sphere 3",
    ["Space - Ultros Gazer"] = "@Gummi Space - The Eclipse - All Checks/Space - Ultros Gazer",
    ["Space - Bismarck Gazer"] = "@Gummi Space - The Eclipse - All Checks/Space - Bismarck Gazer",
    ["Space - Omega Gazer"] = "@Gummi Space - The Eclipse - All Checks/Space - Omega Gazer",
    ["Space - Master Builder"] = "@Gummi Space - The Eclipse - All Checks/Space - Master Builder",
    ["Space - Blast Off"] = "@Gummi Space - Missions - All Checks/Space - Blast Off",
    ["Space - Heartless Hunter"] = "@Gummi Space - Missions - All Checks/Space - Heartless Hunter",
    ["Space - Heartless Harrier"] = "@Gummi Space - Missions - All Checks/Space - Heartless Harrier",
    ["Space - Heartless Menacer"] = "@Gummi Space - Missions - All Checks/Space - Heartless Menacer",
    ["Space - Heartless Destroyer"] = "@Gummi Space - Missions - All Checks/Space - Heartless Destroyer",
    ["Space - Heartless Obliterator"] = "@Gummi Space - Missions - All Checks/Space - Heartless Obliterator",
    ["Space - Special Weapon Dabbler"] = "@Gummi Space - Missions - All Checks/Space - Special Weapon Dabbler",
    ["Space - Special Weapon Collector"] = "@Gummi Space - Missions - All Checks/Space - Special Weapon Collector",
    ["Space - Special Weapon Hoarder"] = "@Gummi Space - Missions - All Checks/Space - Special Weapon Hoarder",
    ["Space - Special Weapon Scholar"] = "@Gummi Space - Missions - All Checks/Space - Special Weapon Scholar",
    ["Space - Special Weapon Authority"] = "@Gummi Space - Missions - All Checks/Space - Special Weapon Authority",
    ["Space - Junior Treasure Hunter"] = "@Gummi Space - Missions - All Checks/Space - Junior Treasure Hunter",
    ["Space - Authorized Treasure Hunter"] = "@Gummi Space - Missions - All Checks/Space - Authorized Treasure Hunter",
    ["Space - Chief Treasure Hunter"] = "@Gummi Space - Missions - All Checks/Space - Chief Treasure Hunter",
    ["Space - Veteran Treasure Hunter"] = "@Gummi Space - Missions - All Checks/Space - Veteran Treasure Hunter",
    ["Space - Champion Treasure Hunter"] = "@Gummi Space - Missions - All Checks/Space - Champion Treasure Hunter",
    ["Space - Gummi Ship Completionist"] = "@Gummi Space - Missions - All Checks/Space - Gummi Ship Completionist",
    -- END generated: gummi space
    ["Ingredients+ - Arendelle - Pickup 007"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 007", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 007"},
    ["Ingredients+ - Arendelle - Pickup 002"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 002", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 002"},
    ["Ingredients+ - Arendelle - Pickup 009"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 009", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 009"},
    ["Ingredients+ - Arendelle - Pickup 011"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 011", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 011"},
    ["Ingredients+ - Arendelle - Pickup 001"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 001", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 001"},
    ["Ingredients+ - Arendelle - Pickup 008"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 008", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 008"},
    ["Ingredients+ - Arendelle - Pickup 010"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 010", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 010"},
    ["Ingredients+ - Arendelle - Pickup 016"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 016", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 016"},
    ["Ingredients+ - Arendelle - Pickup 012"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 012", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 012"},
    ["Ingredients+ - Arendelle - Pickup 013"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 013", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 013"},
    ["Ingredients+ - Arendelle - Pickup 014"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 014", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 014"},
    ["Ingredients+ - Arendelle - Pickup 015"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 015", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 015"},
    ["Ingredients+ - Arendelle - Pickup 017"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 017", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 017"},
    ["Ingredients+ - Arendelle - Pickup 018"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 018", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 018"},
    ["Ingredients+ - Arendelle - Pickup 004"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 004", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 004"},
    ["Ingredients+ - Arendelle - Pickup 003"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 003", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 003"},
    ["Ingredients+ - Arendelle - Pickup 005"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 005", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 005"},
    ["Ingredients+ - Arendelle - Pickup 006"] = {"@Ingredients+ - Arendelle - All Checks/Ingredients+ - Arendelle - Pickup 006", "@Ingredients - All Checks/Ingredients+ - Arendelle - Pickup 006"},
    ["Ingredients+ - Kingdom of Corona - Pickup 003"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 003", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 003"},
    ["Ingredients+ - Kingdom of Corona - Pickup 004"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 004", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 004"},
    ["Ingredients+ - Kingdom of Corona - Pickup 021"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 021", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 021"},
    ["Ingredients+ - Kingdom of Corona - Pickup 023"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 023", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 023"},
    ["Ingredients+ - Kingdom of Corona - Pickup 054"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 054", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 054"},
    ["Ingredients+ - Kingdom of Corona - Pickup 055"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 055", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 055"},
    ["Ingredients+ - Kingdom of Corona - Pickup 056"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 056", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 056"},
    ["Ingredients+ - Kingdom of Corona - Pickup 057"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 057", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 057"},
    ["Ingredients+ - Kingdom of Corona - Pickup 058"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 058", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 058"},
    ["Ingredients+ - Kingdom of Corona - Pickup 059"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 059", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 059"},
    ["Ingredients+ - Kingdom of Corona - Pickup 060"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 060", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 060"},
    ["Ingredients+ - Kingdom of Corona - Pickup 061"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 061", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 061"},
    ["Ingredients+ - Kingdom of Corona - Pickup 034"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 034", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 034"},
    ["Ingredients+ - Kingdom of Corona - Pickup 035"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 035", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 035"},
    ["Ingredients+ - Kingdom of Corona - Pickup 024"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 024", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 024"},
    ["Ingredients+ - Kingdom of Corona - Pickup 025"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 025", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 025"},
    ["Ingredients+ - Kingdom of Corona - Pickup 026"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 026", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 026"},
    ["Ingredients+ - Kingdom of Corona - Pickup 027"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 027", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 027"},
    ["Ingredients+ - Kingdom of Corona - Pickup 028"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 028", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 028"},
    ["Ingredients+ - Kingdom of Corona - Pickup 029"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 029", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 029"},
    ["Ingredients+ - Kingdom of Corona - Pickup 030"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 030", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 030"},
    ["Ingredients+ - Kingdom of Corona - Pickup 031"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 031", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 031"},
    ["Ingredients+ - Kingdom of Corona - Pickup 032"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 032", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 032"},
    ["Ingredients+ - Kingdom of Corona - Pickup 033"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 033", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 033"},
    ["Ingredients+ - Kingdom of Corona - Pickup 041"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 041", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 041"},
    ["Ingredients+ - Kingdom of Corona - Pickup 042"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 042", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 042"},
    ["Ingredients+ - Kingdom of Corona - Pickup 043"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 043", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 043"},
    ["Ingredients+ - Kingdom of Corona - Pickup 062"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 062", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 062"},
    ["Ingredients+ - Kingdom of Corona - Pickup 063"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 063", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 063"},
    ["Ingredients+ - Kingdom of Corona - Pickup 015"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 015", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 015"},
    ["Ingredients+ - Kingdom of Corona - Pickup 016"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 016", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 016"},
    ["Ingredients+ - Kingdom of Corona - Pickup 017"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 017", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 017"},
    ["Ingredients+ - Kingdom of Corona - Pickup 045"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 045", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 045"},
    ["Ingredients+ - Kingdom of Corona - Pickup 051"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 051", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 051"},
    ["Ingredients+ - Kingdom of Corona - Pickup 052"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 052", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 052"},
    ["Ingredients+ - Kingdom of Corona - Pickup 053"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 053", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 053"},
    ["Ingredients+ - Kingdom of Corona - Pickup 049"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 049", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 049"},
    ["Ingredients+ - Kingdom of Corona - Pickup 050"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 050", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 050"},
    ["Ingredients+ - Kingdom of Corona - Pickup 044"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 044", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 044"},
    ["Ingredients+ - Kingdom of Corona - Pickup 046"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 046", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 046"},
    ["Ingredients+ - Kingdom of Corona - Pickup 047"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 047", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 047"},
    ["Ingredients+ - Kingdom of Corona - Pickup 048"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 048", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 048"},
    ["Ingredients+ - Kingdom of Corona - Pickup 013"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 013", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 013"},
    ["Ingredients+ - Kingdom of Corona - Pickup 014"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 014", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 014"},
    ["Ingredients+ - Kingdom of Corona - Pickup 010"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 010", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 010"},
    ["Ingredients+ - Kingdom of Corona - Pickup 011"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 011", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 011"},
    ["Ingredients+ - Kingdom of Corona - Pickup 005"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 005", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 005"},
    ["Ingredients+ - Kingdom of Corona - Pickup 006"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 006", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 006"},
    ["Ingredients+ - Kingdom of Corona - Pickup 007"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 007", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 007"},
    ["Ingredients+ - Kingdom of Corona - Pickup 008"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 008", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 008"},
    ["Ingredients+ - Kingdom of Corona - Pickup 009"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 009", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 009"},
    ["Ingredients+ - Kingdom of Corona - Pickup 037"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 037", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 037"},
    ["Ingredients+ - Kingdom of Corona - Pickup 038"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 038", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 038"},
    ["Ingredients+ - Kingdom of Corona - Pickup 039"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 039", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 039"},
    ["Ingredients+ - Kingdom of Corona - Pickup 012"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 012", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 012"},
    ["Ingredients+ - Kingdom of Corona - Pickup 001"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 001", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 001"},
    ["Ingredients+ - Kingdom of Corona - Pickup 002"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 002", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 002"},
    ["Ingredients+ - Kingdom of Corona - Pickup 036"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 036", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 036"},
    ["Ingredients+ - Kingdom of Corona - Pickup 019"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 019", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 019"},
    ["Ingredients+ - Kingdom of Corona - Pickup 020"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 020", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 020"},
    ["Ingredients+ - Kingdom of Corona - Pickup 018"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 018", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 018"},
    ["Ingredients+ - Kingdom of Corona - Pickup 022"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 022", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 022"},
    ["Ingredients+ - Kingdom of Corona - Pickup 040"] = {"@Ingredients+ - Kingdom of Corona - All Checks/Ingredients+ - Kingdom of Corona - Pickup 040", "@Ingredients - All Checks/Ingredients+ - Kingdom of Corona - Pickup 040"},
    ["Ingredients+ - Monstropolis - Pickup 009"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 009", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 009"},
    ["Ingredients+ - Monstropolis - Pickup 010"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 010", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 010"},
    ["Ingredients+ - Monstropolis - Pickup 005"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 005", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 005"},
    ["Ingredients+ - Monstropolis - Pickup 008"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 008", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 008"},
    ["Ingredients+ - Monstropolis - Pickup 011"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 011", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 011"},
    ["Ingredients+ - Monstropolis - Pickup 012"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 012", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 012"},
    ["Ingredients+ - Monstropolis - Pickup 013"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 013", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 013"},
    ["Ingredients+ - Monstropolis - Pickup 014"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 014", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 014"},
    ["Ingredients+ - Monstropolis - Pickup 015"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 015", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 015"},
    ["Ingredients+ - Monstropolis - Pickup 001"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 001", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 001"},
    ["Ingredients+ - Monstropolis - Pickup 002"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 002", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 002"},
    ["Ingredients+ - Monstropolis - Pickup 003"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 003", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 003"},
    ["Ingredients+ - Monstropolis - Pickup 004"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 004", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 004"},
    ["Ingredients+ - Monstropolis - Pickup 006"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 006", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 006"},
    ["Ingredients+ - Monstropolis - Pickup 007"] = {"@Ingredients+ - Monstropolis - All Checks/Ingredients+ - Monstropolis - Pickup 007", "@Ingredients - All Checks/Ingredients+ - Monstropolis - Pickup 007"},
    ["Ingredients+ - Olympus - Pickup 001"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 001", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 001"},
    ["Ingredients+ - Olympus - Pickup 026"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 026", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 026"},
    ["Ingredients+ - Olympus - Pickup 003"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 003", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 003"},
    ["Ingredients+ - Olympus - Pickup 005"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 005", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 005"},
    ["Ingredients+ - Olympus - Pickup 008"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 008", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 008"},
    ["Ingredients+ - Olympus - Pickup 002"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 002", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 002"},
    ["Ingredients+ - Olympus - Pickup 004"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 004", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 004"},
    ["Ingredients+ - Olympus - Pickup 006"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 006", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 006"},
    ["Ingredients+ - Olympus - Pickup 007"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 007", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 007"},
    ["Ingredients+ - Olympus - Pickup 009"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 009", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 009"},
    ["Ingredients+ - Olympus - Pickup 020"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 020", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 020"},
    ["Ingredients+ - Olympus - Pickup 021"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 021", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 021"},
    ["Ingredients+ - Olympus - Pickup 022"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 022", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 022"},
    ["Ingredients+ - Olympus - Pickup 023"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 023", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 023"},
    ["Ingredients+ - Olympus - Pickup 024"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 024", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 024"},
    ["Ingredients+ - Olympus - Pickup 032"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 032", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 032"},
    ["Ingredients+ - Olympus - Pickup 033"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 033", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 033"},
    ["Ingredients+ - Olympus - Pickup 017"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 017", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 017"},
    ["Ingredients+ - Olympus - Pickup 018"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 018", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 018"},
    ["Ingredients+ - Olympus - Pickup 019"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 019", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 019"},
    ["Ingredients+ - Olympus - Pickup 025"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 025", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 025"},
    ["Ingredients+ - Olympus - Pickup 027"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 027", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 027"},
    ["Ingredients+ - Olympus - Pickup 030"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 030", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 030"},
    ["Ingredients+ - Olympus - Pickup 031"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 031", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 031"},
    ["Ingredients+ - Olympus - Pickup 011"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 011", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 011"},
    ["Ingredients+ - Olympus - Pickup 012"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 012", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 012"},
    ["Ingredients+ - Olympus - Pickup 013"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 013", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 013"},
    ["Ingredients+ - Olympus - Pickup 014"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 014", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 014"},
    ["Ingredients+ - Olympus - Pickup 015"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 015", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 015"},
    ["Ingredients+ - Olympus - Pickup 016"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 016", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 016"},
    ["Ingredients+ - Olympus - Pickup 028"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 028", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 028"},
    ["Ingredients+ - Olympus - Pickup 029"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 029", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 029"},
    ["Ingredients+ - Olympus - Pickup 010"] = {"@Ingredients+ - Olympus - All Checks/Ingredients+ - Olympus - Pickup 010", "@Ingredients - All Checks/Ingredients+ - Olympus - Pickup 010"},
    ["Ingredients+ - San Fransokyo - Pickup 003"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 003", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 003"},
    ["Ingredients+ - San Fransokyo - Pickup 011"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 011", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 011"},
    ["Ingredients+ - San Fransokyo - Pickup 004"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 004", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 004"},
    ["Ingredients+ - San Fransokyo - Pickup 005"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 005", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 005"},
    ["Ingredients+ - San Fransokyo - Pickup 006"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 006", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 006"},
    ["Ingredients+ - San Fransokyo - Pickup 007"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 007", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 007"},
    ["Ingredients+ - San Fransokyo - Pickup 008"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 008", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 008"},
    ["Ingredients+ - San Fransokyo - Pickup 016"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 016", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 016"},
    ["Ingredients+ - San Fransokyo - Pickup 002"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 002", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 002"},
    ["Ingredients+ - San Fransokyo - Pickup 009"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 009", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 009"},
    ["Ingredients+ - San Fransokyo - Pickup 001"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 001", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 001"},
    ["Ingredients+ - San Fransokyo - Pickup 012"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 012", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 012"},
    ["Ingredients+ - San Fransokyo - Pickup 014"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 014", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 014"},
    ["Ingredients+ - San Fransokyo - Pickup 013"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 013", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 013"},
    ["Ingredients+ - San Fransokyo - Pickup 015"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 015", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 015"},
    ["Ingredients+ - San Fransokyo - Pickup 010"] = {"@Ingredients+ - San Fransokyo - All Checks/Ingredients+ - San Fransokyo - Pickup 010", "@Ingredients - All Checks/Ingredients+ - San Fransokyo - Pickup 010"},
    ["Ingredients+ - The Caribbean - Pickup 015"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 015", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 015"},
    ["Ingredients+ - The Caribbean - Pickup 016"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 016", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 016"},
    ["Ingredients+ - The Caribbean - Pickup 017"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 017", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 017"},
    ["Ingredients+ - The Caribbean - Pickup 018"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 018", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 018"},
    ["Ingredients+ - The Caribbean - Pickup 019"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 019", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 019"},
    ["Ingredients+ - The Caribbean - Pickup 020"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 020", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 020"},
    ["Ingredients+ - The Caribbean - Pickup 078"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 078", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 078"},
    ["Ingredients+ - The Caribbean - Pickup 080"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 080", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 080"},
    ["Ingredients+ - The Caribbean - Pickup 082"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 082", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 082"},
    ["Ingredients+ - The Caribbean - Pickup 083"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 083", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 083"},
    ["Ingredients+ - The Caribbean - Pickup 084"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 084", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 084"},
    ["Ingredients+ - The Caribbean - Pickup 085"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 085", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 085"},
    ["Ingredients+ - The Caribbean - Pickup 087"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 087", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 087"},
    ["Ingredients+ - The Caribbean - Pickup 088"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 088", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 088"},
    ["Ingredients+ - The Caribbean - Pickup 089"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 089", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 089"},
    ["Ingredients+ - The Caribbean - Pickup 079"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 079", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 079"},
    ["Ingredients+ - The Caribbean - Pickup 081"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 081", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 081"},
    ["Ingredients+ - The Caribbean - Pickup 086"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 086", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 086"},
    ["Ingredients+ - The Caribbean - Pickup 090"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 090", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 090"},
    ["Ingredients+ - The Caribbean - Pickup 073"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 073", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 073"},
    ["Ingredients+ - The Caribbean - Pickup 074"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 074", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 074"},
    ["Ingredients+ - The Caribbean - Pickup 075"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 075", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 075"},
    ["Ingredients+ - The Caribbean - Pickup 076"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 076", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 076"},
    ["Ingredients+ - The Caribbean - Pickup 077"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 077", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 077"},
    ["Ingredients+ - The Caribbean - Pickup 034"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 034", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 034"},
    ["Ingredients+ - The Caribbean - Pickup 035"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 035", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 035"},
    ["Ingredients+ - The Caribbean - Pickup 036"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 036", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 036"},
    ["Ingredients+ - The Caribbean - Pickup 040"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 040", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 040"},
    ["Ingredients+ - The Caribbean - Pickup 041"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 041", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 041"},
    ["Ingredients+ - The Caribbean - Pickup 013"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 013", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 013"},
    ["Ingredients+ - The Caribbean - Pickup 098"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 098", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 098"},
    ["Ingredients+ - The Caribbean - Pickup 100"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 100", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 100"},
    ["Ingredients+ - The Caribbean - Pickup 101"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 101", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 101"},
    ["Ingredients+ - The Caribbean - Pickup 103"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 103", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 103"},
    ["Ingredients+ - The Caribbean - Pickup 104"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 104", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 104"},
    ["Ingredients+ - The Caribbean - Pickup 055"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 055", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 055"},
    ["Ingredients+ - The Caribbean - Pickup 056"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 056", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 056"},
    ["Ingredients+ - The Caribbean - Pickup 057"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 057", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 057"},
    ["Ingredients+ - The Caribbean - Pickup 058"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 058", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 058"},
    ["Ingredients+ - The Caribbean - Pickup 059"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 059", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 059"},
    ["Ingredients+ - The Caribbean - Pickup 060"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 060", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 060"},
    ["Ingredients+ - The Caribbean - Pickup 042"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 042", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 042"},
    ["Ingredients+ - The Caribbean - Pickup 043"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 043", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 043"},
    ["Ingredients+ - The Caribbean - Pickup 037"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 037", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 037"},
    ["Ingredients+ - The Caribbean - Pickup 038"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 038", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 038"},
    ["Ingredients+ - The Caribbean - Pickup 044"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 044", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 044"},
    ["Ingredients+ - The Caribbean - Pickup 045"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 045", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 045"},
    ["Ingredients+ - The Caribbean - Pickup 046"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 046", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 046"},
    ["Ingredients+ - The Caribbean - Pickup 039"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 039", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 039"},
    ["Ingredients+ - The Caribbean - Pickup 047"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 047", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 047"},
    ["Ingredients+ - The Caribbean - Pickup 071"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 071", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 071"},
    ["Ingredients+ - The Caribbean - Pickup 072"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 072", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 072"},
    ["Ingredients+ - The Caribbean - Pickup 061"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 061", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 061"},
    ["Ingredients+ - The Caribbean - Pickup 062"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 062", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 062"},
    ["Ingredients+ - The Caribbean - Pickup 097"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 097", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 097"},
    ["Ingredients+ - The Caribbean - Pickup 021"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 021", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 021"},
    ["Ingredients+ - The Caribbean - Pickup 022"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 022", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 022"},
    ["Ingredients+ - The Caribbean - Pickup 024"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 024", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 024"},
    ["Ingredients+ - The Caribbean - Pickup 025"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 025", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 025"},
    ["Ingredients+ - The Caribbean - Pickup 028"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 028", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 028"},
    ["Ingredients+ - The Caribbean - Pickup 091"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 091", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 091"},
    ["Ingredients+ - The Caribbean - Pickup 092"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 092", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 092"},
    ["Ingredients+ - The Caribbean - Pickup 093"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 093", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 093"},
    ["Ingredients+ - The Caribbean - Pickup 094"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 094", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 094"},
    ["Ingredients+ - The Caribbean - Pickup 095"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 095", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 095"},
    ["Ingredients+ - The Caribbean - Pickup 096"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 096", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 096"},
    ["Ingredients+ - The Caribbean - Pickup 099"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 099", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 099"},
    ["Ingredients+ - The Caribbean - Pickup 102"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 102", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 102"},
    ["Ingredients+ - The Caribbean - Pickup 105"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 105", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 105"},
    ["Ingredients+ - The Caribbean - Pickup 106"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 106", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 106"},
    ["Ingredients+ - The Caribbean - Pickup 023"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 023", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 023"},
    ["Ingredients+ - The Caribbean - Pickup 001"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 001", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 001"},
    ["Ingredients+ - The Caribbean - Pickup 002"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 002", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 002"},
    ["Ingredients+ - The Caribbean - Pickup 027"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 027", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 027"},
    ["Ingredients+ - The Caribbean - Pickup 032"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 032", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 032"},
    ["Ingredients+ - The Caribbean - Pickup 033"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 033", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 033"},
    ["Ingredients+ - The Caribbean - Pickup 026"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 026", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 026"},
    ["Ingredients+ - The Caribbean - Pickup 029"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 029", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 029"},
    ["Ingredients+ - The Caribbean - Pickup 031"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 031", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 031"},
    ["Ingredients+ - The Caribbean - Pickup 030"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 030", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 030"},
    ["Ingredients+ - The Caribbean - Pickup 003"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 003", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 003"},
    ["Ingredients+ - The Caribbean - Pickup 048"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 048", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 048"},
    ["Ingredients+ - The Caribbean - Pickup 049"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 049", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 049"},
    ["Ingredients+ - The Caribbean - Pickup 050"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 050", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 050"},
    ["Ingredients+ - The Caribbean - Pickup 051"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 051", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 051"},
    ["Ingredients+ - The Caribbean - Pickup 052"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 052", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 052"},
    ["Ingredients+ - The Caribbean - Pickup 053"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 053", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 053"},
    ["Ingredients+ - The Caribbean - Pickup 054"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 054", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 054"},
    ["Ingredients+ - The Caribbean - Pickup 065"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 065", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 065"},
    ["Ingredients+ - The Caribbean - Pickup 066"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 066", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 066"},
    ["Ingredients+ - The Caribbean - Pickup 068"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 068", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 068"},
    ["Ingredients+ - The Caribbean - Pickup 069"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 069", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 069"},
    ["Ingredients+ - The Caribbean - Pickup 070"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 070", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 070"},
    ["Ingredients+ - The Caribbean - Pickup 063"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 063", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 063"},
    ["Ingredients+ - The Caribbean - Pickup 064"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 064", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 064"},
    ["Ingredients+ - The Caribbean - Pickup 067"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 067", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 067"},
    ["Ingredients+ - The Caribbean - Pickup 004"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 004", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 004"},
    ["Ingredients+ - The Caribbean - Pickup 005"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 005", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 005"},
    ["Ingredients+ - The Caribbean - Pickup 006"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 006", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 006"},
    ["Ingredients+ - The Caribbean - Pickup 007"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 007", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 007"},
    ["Ingredients+ - The Caribbean - Pickup 008"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 008", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 008"},
    ["Ingredients+ - The Caribbean - Pickup 009"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 009", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 009"},
    ["Ingredients+ - The Caribbean - Pickup 010"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 010", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 010"},
    ["Ingredients+ - The Caribbean - Pickup 011"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 011", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 011"},
    ["Ingredients+ - The Caribbean - Pickup 014"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 014", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 014"},
    ["Ingredients+ - The Caribbean - Pickup 012"] = {"@Ingredients+ - The Caribbean - All Checks/Ingredients+ - The Caribbean - Pickup 012", "@Ingredients - All Checks/Ingredients+ - The Caribbean - Pickup 012"},
    ["Ingredients+ - Toy Box - Pickup 004"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 004", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 004"},
    ["Ingredients+ - Toy Box - Pickup 005"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 005", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 005"},
    ["Ingredients+ - Toy Box - Pickup 007"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 007", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 007"},
    ["Ingredients+ - Toy Box - Pickup 008"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 008", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 008"},
    ["Ingredients+ - Toy Box - Pickup 011"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 011", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 011"},
    ["Ingredients+ - Toy Box - Pickup 012"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 012", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 012"},
    ["Ingredients+ - Toy Box - Pickup 013"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 013", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 013"},
    ["Ingredients+ - Toy Box - Pickup 014"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 014", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 014"},
    ["Ingredients+ - Toy Box - Pickup 015"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 015", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 015"},
    ["Ingredients+ - Toy Box - Pickup 016"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 016", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 016"},
    ["Ingredients+ - Toy Box - Pickup 017"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 017", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 017"},
    ["Ingredients+ - Toy Box - Pickup 018"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 018", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 018"},
    ["Ingredients+ - Toy Box - Pickup 028"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 028", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 028"},
    ["Ingredients+ - Toy Box - Pickup 001"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 001", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 001"},
    ["Ingredients+ - Toy Box - Pickup 002"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 002", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 002"},
    ["Ingredients+ - Toy Box - Pickup 003"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 003", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 003"},
    ["Ingredients+ - Toy Box - Pickup 006"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 006", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 006"},
    ["Ingredients+ - Toy Box - Pickup 009"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 009", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 009"},
    ["Ingredients+ - Toy Box - Pickup 010"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 010", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 010"},
    ["Ingredients+ - Toy Box - Pickup 024"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 024", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 024"},
    ["Ingredients+ - Toy Box - Pickup 022"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 022", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 022"},
    ["Ingredients+ - Toy Box - Pickup 027"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 027", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 027"},
    ["Ingredients+ - Toy Box - Pickup 023"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 023", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 023"},
    ["Ingredients+ - Toy Box - Pickup 025"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 025", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 025"},
    ["Ingredients+ - Toy Box - Pickup 026"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 026", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 026"},
    ["Ingredients+ - Toy Box - Pickup 019"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 019", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 019"},
    ["Ingredients+ - Toy Box - Pickup 029"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 029", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 029"},
    ["Ingredients+ - Toy Box - Pickup 020"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 020", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 020"},
    ["Ingredients+ - Toy Box - Pickup 021"] = {"@Ingredients+ - Toy Box - All Checks/Ingredients+ - Toy Box - Pickup 021", "@Ingredients - All Checks/Ingredients+ - Toy Box - Pickup 021"},
    ["Ingredients+ - Twilight Town - Pickup 002"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 002", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 002"},
    ["Ingredients+ - Twilight Town - Pickup 003"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 003", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 003"},
    ["Ingredients+ - Twilight Town - Pickup 011"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 011", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 011"},
    ["Ingredients+ - Twilight Town - Pickup 004"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 004", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 004"},
    ["Ingredients+ - Twilight Town - Pickup 006"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 006", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 006"},
    ["Ingredients+ - Twilight Town - Pickup 007"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 007", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 007"},
    ["Ingredients+ - Twilight Town - Pickup 001"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 001", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 001"},
    ["Ingredients+ - Twilight Town - Pickup 008"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 008", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 008"},
    ["Ingredients+ - Twilight Town - Pickup 009"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 009", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 009"},
    ["Ingredients+ - Twilight Town - Pickup 010"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 010", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 010"},
    ["Ingredients+ - Twilight Town - Pickup 013"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 013", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 013"},
    ["Ingredients+ - Twilight Town - Pickup 005"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 005", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 005"},
    ["Ingredients+ - Twilight Town - Pickup 012"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 012", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 012"},
    ["Ingredients+ - Twilight Town - Pickup 015"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 015", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 015"},
    ["Ingredients+ - Twilight Town - Pickup 014"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 014", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 014"},
    ["Ingredients+ - Twilight Town - Pickup 016"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 016", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 016"},
    ["Ingredients+ - Twilight Town - Pickup 017"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 017", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 017"},
    ["Ingredients+ - Twilight Town - Pickup 018"] = {"@Ingredients+ - Twilight Town - All Checks/Ingredients+ - Twilight Town - Pickup 018", "@Ingredients - All Checks/Ingredients+ - Twilight Town - Pickup 018"},
    ["Classic Kingdom - Giantland - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Giantland - High Score",
    ["Classic Kingdom - Mickey, The Mail Pilot - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Mickey, The Mail Pilot - High Score",
    ["Classic Kingdom - The Musical Farmer - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - The Musical Farmer - High Score",
    ["Classic Kingdom - Building a Building - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Building a Building - High Score",
    ["Classic Kingdom - The Mad Doctor - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - The Mad Doctor - High Score",
    ["Classic Kingdom - Mickey's Kitten Catch - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Mickey's Kitten Catch - High Score",
    ["Classic Kingdom - The Klondike Kid - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - The Klondike Kid - High Score",
    ["Classic Kingdom - Fishin' Frenzy - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Fishin' Frenzy - High Score",
    ["Classic Kingdom - The Karnival Kid - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - The Karnival Kid - High Score",
    ["Classic Kingdom - Mickey Cuts Up - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Mickey Cuts Up - High Score",
    ["Classic Kingdom - Mickey's Prison Escape - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Mickey's Prison Escape - High Score",
    ["Classic Kingdom - How to Play Baseball - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - How to Play Baseball - High Score",
    ["Classic Kingdom - How to Play Golf - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - How to Play Golf - High Score",
    ["Classic Kingdom - Mickey's Circus - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Mickey's Circus - High Score",
    ["Classic Kingdom - Camping Out - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Camping Out - High Score",
    ["Classic Kingdom - Taxi Troubles - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Taxi Troubles - High Score",
    ["Classic Kingdom - Beach Party - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Beach Party - High Score",
    ["Classic Kingdom - The Wayward Canary - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - The Wayward Canary - High Score",
    ["Classic Kingdom - Mickey's Mechanical Man - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Mickey's Mechanical Man - High Score",
    ["Classic Kingdom - The Barnyard Battle - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - The Barnyard Battle - High Score",
    ["Classic Kingdom - Cast Out to Sea - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Cast Out to Sea - High Score",
    ["Classic Kingdom - Backyard Sports - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Backyard Sports - High Score",
    ["Classic Kingdom - Mickey Steps Out - High Score"] = "@Classic Kingdom - All Checks/Classic Kingdom - Mickey Steps Out - High Score",
    ["Classic Kingdom - Complete All Games"] = "@Classic Kingdom - All Checks/Classic Kingdom - Complete All Games",
    ["Olympus Coliseum - KH1 - Phil Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH1 - Phil Cup Clear",
    ["Olympus Coliseum - KH1 - Pegasus Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH1 - Pegasus Cup Clear",
    ["Olympus Coliseum - KH1 - Hercules Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH1 - Hercules Cup Clear",
    ["Olympus Coliseum - KH1 - Hades Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH1 - Hades Cup Clear",
    ["Olympus Coliseum - KH1 - Gold Match Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH1 - Gold Match Clear",
    ["Olympus Coliseum - KH1 - Platinum Match Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH1 - Platinum Match Clear",
    ["Olympus Coliseum - KH2 - Pain and Panic Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH2 - Pain and Panic Cup Clear",
    ["Olympus Coliseum - KH2 - Cerberus Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH2 - Cerberus Cup Clear",
    ["Olympus Coliseum - KH2 - Titan Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH2 - Titan Cup Clear",
    ["Olympus Coliseum - KH2 - Goddess of Fate Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH2 - Goddess of Fate Cup Clear",
    ["Olympus Coliseum - KH2 - Paradox Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH2 - Paradox Cup Clear",
    ["Olympus Coliseum - KH3 - Hermes Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH3 - Hermes Cup Clear",
    ["Olympus Coliseum - KH3 - Apollo Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH3 - Apollo Cup Clear",
    ["Olympus Coliseum - KH3 - Athena Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH3 - Athena Cup Clear",
    ["Olympus Coliseum - KH3 - Zeus Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - KH3 - Zeus Cup Clear",
    ["Olympus Coliseum - Secret - Sephiroth Match Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - Secret - Sephiroth Match Clear",
    ["Olympus Coliseum - Apro - Chef Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - Apro - Chef Cup Clear",
    ["Olympus Coliseum - Apro - Flan Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - Apro - Flan Cup Clear",
    ["Olympus Coliseum - Apro - The Story So Far Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - Apro - The Story So Far Cup Clear",
    ["Olympus Coliseum - Apro - Infernal Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - Apro - Infernal Cup Clear",
    ["Olympus Coliseum - Apro - Limit Cut Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - Apro - Limit Cut Cup Clear",
    ["Olympus Coliseum - Apro - Vessels of Darkness Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - Apro - Vessels of Darkness Cup Clear",
    ["Olympus Coliseum - BBS - Terra Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - BBS - Terra Cup Clear",
    ["Olympus Coliseum - BBS - Ventus Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - BBS - Ventus Cup Clear",
    ["Olympus Coliseum - BBS - Aqua Cup Clear"] = "@Olympus Coliseum - All Checks/Olympus Coliseum - BBS - Aqua Cup Clear",
    ["Melody of Memory - The 13th Struggle (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The 13th Struggle (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Shrouding Dark Cloud (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Shrouding Dark Cloud (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Traverse Town (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Traverse Town (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Hand in Hand (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Hand in Hand (KINGDOM HEARTS) Clear",
    ["Melody of Memory - A Very Small Wish (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - A Very Small Wish (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Monstrous Monstro (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Monstrous Monstro (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Welcome to Wonderland (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Welcome to Wonderland (KINGDOM HEARTS) Clear",
    ["Melody of Memory - To Our Surprise (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - To Our Surprise (KINGDOM HEARTS) Clear",
    ["Melody of Memory - This is Halloween (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - This is Halloween (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Spooks of Halloween Town (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Spooks of Halloween Town (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Captain Hook's Pirate Ship (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Captain Hook's Pirate Ship (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Pirate's Gigue (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Pirate's Gigue (KINGDOM HEARTS) Clear",
    ["Melody of Memory - A Day in Agrabah (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - A Day in Agrabah (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Arabian Dream (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Arabian Dream (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Hollow Bastion (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Hollow Bastion (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Scherzo Di Notte (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Scherzo Di Notte (KINGDOM HEARTS) Clear",
    ["Melody of Memory - The Home of Dragons (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Home of Dragons (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Fields of Honor (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Fields of Honor (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Under the Sea (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Under the Sea (KINGDOM HEARTS) Clear",
    ["Melody of Memory - An Adventure in Atlantica (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - An Adventure in Atlantica (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Olympus Coliseum (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Olympus Coliseum (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Go for It! (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Go for It! (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Lazy Afternoons (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Lazy Afternoons (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Sinister Sundown (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Sinister Sundown (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - The Afternoon Streets (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Afternoon Streets (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Working Together (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Working Together (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - End of the World (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - End of the World (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Fragments of Sorrow (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Fragments of Sorrow (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Waltz of the Damned (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Waltz of the Damned (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Dance of the Daring (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Dance of the Daring (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Space Paranoids (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Space Paranoids (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Byte Bashing (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Byte Bashing (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Radiant Garden (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Radiant Garden (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Black Garden (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Black Garden (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - The Underworld (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Underworld (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - What Lies Beneath (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - What Lies Beneath (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Bibbidi-Bobbidi-Boo (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Bibbidi-Bobbidi-Boo (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Castle Escapade (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Castle Escapade (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Mickey Mouse March (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Mickey Mouse March (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Up Down Adventure (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Up Down Adventure (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - What A Surprise?! (KINGDOM HEARTS II -FINAL MIX-) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - What A Surprise?! (KINGDOM HEARTS II -FINAL MIX-) Clear",
    ["Melody of Memory - Happy Holidays! (KINGDOM HEARTS II -FINAL MIX-) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Happy Holidays! (KINGDOM HEARTS II -FINAL MIX-) Clear",
    ["Melody of Memory - Castle Oblivion (KINGDOM HEARTS Re:Chain of Memories) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Castle Oblivion (KINGDOM HEARTS Re:Chain of Memories) Clear",
    ["Melody of Memory - Forgotten Challenge (KINGDOM HEARTS Re:Chain of Memories) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Forgotten Challenge (KINGDOM HEARTS Re:Chain of Memories) Clear",
    ["Melody of Memory - Magical Mystery (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Magical Mystery (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Destiny Islands (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Destiny Islands (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Bustin' Up on the Beach (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Bustin' Up on the Beach (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Traverse in Trance (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Traverse in Trance (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - Hand to Hand (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Hand to Hand (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - Daydream upon Neverland (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Daydream upon Neverland (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Neverland's Scherzo (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Neverland's Scherzo (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Secret of Neverland (KINGDOM HEARTS 358-2 Days) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Secret of Neverland (KINGDOM HEARTS 358-2 Days) Clear",
    ["Melody of Memory - Crossing to Neverland (KINGDOM HEARTS 358-2 Days) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Crossing to Neverland (KINGDOM HEARTS 358-2 Days) Clear",
    ["Melody of Memory - Monochrome Dreams (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Monochrome Dreams (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Old Friends, Old Rivals (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Old Friends, Old Rivals (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Adventures in the Savannah (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Adventures in the Savannah (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Savannah Pride (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Savannah Pride (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Sacred Moon (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Sacred Moon (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Deep Drive (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Deep Drive (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Sacred Distance (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Sacred Distance (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - Deep Drop (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Deep Drop (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - The Promised Beginning (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Promised Beginning (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Future Masters (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Future Masters (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Reviving Hollow Bastion (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Reviving Hollow Bastion (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Scherzo Di Notte (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Scherzo Di Notte (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - The Silent Forest (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Silent Forest (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - The Rustling Forest (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Rustling Forest (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - The Secret Whispers (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Secret Whispers (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Risky Romp (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Risky Romp (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Hau'oli, Hau'oli (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Hau'oli, Hau'oli (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Mákaukau? (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Mákaukau? (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - La Cloche (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - La Cloche (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - Le Sanctuaire (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Le Sanctuaire (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - Access the Grid (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Access the Grid (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - Digital Domination (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Digital Domination (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - The Fun Fair (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Fun Fair (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - Prankster's Party (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Prankster's Party (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - One for All (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - One for All (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - All for One (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - All for One (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - Wonder of Electron (KINGDOM HEARTS Re:coded) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Wonder of Electron (KINGDOM HEARTS Re:coded) Clear",
    ["Melody of Memory - No More Bugs!! (KINGDOM HEARTS Re:coded) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - No More Bugs!! (KINGDOM HEARTS Re:coded) Clear",
    ["Melody of Memory - Squirming Evil (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Squirming Evil (KINGDOM HEARTS) Clear",
    ["Melody of Memory - The Force in You (KINGDOM HEARTS Re:Chain of Memories) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Force in You (KINGDOM HEARTS Re:Chain of Memories) Clear",
    ["Melody of Memory - Lord of the Castle (KINGDOM HEARTS Re:Chain of Memories) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Lord of the Castle (KINGDOM HEARTS Re:Chain of Memories) Clear",
    ["Melody of Memory - Tension Rising (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Tension Rising (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - The 13th Dilemma (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The 13th Dilemma (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Desire for All That Is Lost (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Desire for All That Is Lost (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Vim and Vigor (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Vim and Vigor (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Rowdy Rumble (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Rowdy Rumble (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Sinister Shadows (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Sinister Shadows (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Fight and Away (KINGDOM HEARTS 358-2 Days) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Fight and Away (KINGDOM HEARTS 358-2 Days) Clear",
    ["Melody of Memory - Vector to the Heavens (KINGDOM HEARTS 358-2 Days) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Vector to the Heavens (KINGDOM HEARTS 358-2 Days) Clear",
    ["Melody of Memory - Another Side - Battle Ver. - (KINGDOM HEARTS 358-2 Days) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Another Side - Battle Ver. - (KINGDOM HEARTS 358-2 Days) Clear",
    ["Melody of Memory - The Tumbling (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Tumbling (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Black Powder (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Black Powder (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Rage Awakened -The Origin- (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Rage Awakened -The Origin- (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Enter the Darkness (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Enter the Darkness (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Dismiss (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Dismiss (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Night of Fate (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Night of Fate (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Majestic Wings (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Majestic Wings (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - L'Oscurità dell'Ignoto (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - L'Oscurità dell'Ignoto (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - L'Impeto Oscuro (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - L'Impeto Oscuro (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - The Eye of Darkness (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Eye of Darkness (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - Wave of Darkness I (KINGDOM HEARTS 0.2 Birth by Sleep -A fragmentary passage-) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Wave of Darkness I (KINGDOM HEARTS 0.2 Birth by Sleep -A fragmentary passage-) Clear",
    ["Melody of Memory - Another Side (KINGDOM HEARTS -FINAL MIX-) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Another Side (KINGDOM HEARTS -FINAL MIX-) Clear",
    ["Melody of Memory - Fate of the Unknown (KINGDOM HEARTS II -FINAL MIX-) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Fate of the Unknown (KINGDOM HEARTS II -FINAL MIX-) Clear",
    ["Melody of Memory - One-Winged Angel (from FINAL FANTASY VII) (KINGDOM HEARTS -FINAL MIX-) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - One-Winged Angel (from FINAL FANTASY VII) (KINGDOM HEARTS -FINAL MIX-) Clear",
    ["Melody of Memory - Rage Awakened (KINGDOM HEARTS II -FINAL MIX-) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Rage Awakened (KINGDOM HEARTS II -FINAL MIX-) Clear",
    ["Melody of Memory - The Other Promise (KINGDOM HEARTS II -FINAL MIX-) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Other Promise (KINGDOM HEARTS II -FINAL MIX-) Clear",
    ["Melody of Memory - CALLING -KINGDOM MIX- (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - CALLING -KINGDOM MIX- (KINGDOM HEARTS 3D [Dream Drop Distance]) Clear",
    ["Melody of Memory - A Whole New World (Other Titles) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - A Whole New World (Other Titles) Clear",
    ["Melody of Memory - Circle Of Life (Other Titles) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Circle Of Life (Other Titles) Clear",
    ["Melody of Memory - Hand in Hand (Piano Collections KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Hand in Hand (Piano Collections KINGDOM HEARTS) Clear",
    ["Melody of Memory - Working Together - Allegro vivace (Piano Collections KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Working Together - Allegro vivace (Piano Collections KINGDOM HEARTS) Clear",
    ["Melody of Memory - Sora - Allegro con brio (Piano Collections KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Sora - Allegro con brio (Piano Collections KINGDOM HEARTS) Clear",
    ["Melody of Memory - Medley of Conflict (Piano Collections KINGDOM HEARTS FIELD & BATTLE) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Medley of Conflict (Piano Collections KINGDOM HEARTS FIELD & BATTLE) Clear",
    ["Melody of Memory - Destati (KINGDOM HEARTS Orchestra -World Tour- Album) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Destati (KINGDOM HEARTS Orchestra -World Tour- Album) Clear",
    ["Melody of Memory - Destiny's Force (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Destiny's Force (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Guardando nel buio (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Guardando nel buio (KINGDOM HEARTS) Clear",
    ["Melody of Memory - The Encounter -Birth by Sleep Version- (KINGDOM HEARTS Birth by Sleep) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - The Encounter -Birth by Sleep Version- (KINGDOM HEARTS Birth by Sleep) Clear",
    ["Melody of Memory - Darkness of the Unknown (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Darkness of the Unknown (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Simple And Clean (KINGDOM HEARTS) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Simple And Clean (KINGDOM HEARTS) Clear",
    ["Melody of Memory - Sanctuary ~opening version~ (KINGDOM HEARTS II) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Sanctuary ~opening version~ (KINGDOM HEARTS II) Clear",
    ["Melody of Memory - Don't Think Twice (KINGDOM HEARTS III) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Don't Think Twice (KINGDOM HEARTS III) Clear",
    ["Melody of Memory - Graveyard Labyrinth (KINGDOM HEARTS III) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Graveyard Labyrinth (KINGDOM HEARTS III) Clear",
    ["Melody of Memory - Rise of the Union (KINGDOM HEARTS III) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Rise of the Union (KINGDOM HEARTS III) Clear",
    ["Melody of Memory - Dark Domination (KINGDOM HEARTS III) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Dark Domination (KINGDOM HEARTS III) Clear",
    ["Melody of Memory - Beauty and the Beast (Other Titles) Clear"] = "@Melody of Memory - All Checks/Melody of Memory - Beauty and the Beast (Other Titles) Clear",
    ["Ingredients - Crab"] = "@Ingredients - All Checks/Ingredients - Crab",
    ["Ingredients - Scallop"] = "@Ingredients - All Checks/Ingredients - Scallop",
    ["Ingredients - Lobster"] = "@Ingredients - All Checks/Ingredients - Lobster",
    ["Ingredients - Sole"] = "@Ingredients - All Checks/Ingredients - Sole",
    ["Ingredients - Eel"] = "@Ingredients - All Checks/Ingredients - Eel",
    ["Ingredients - Sea Bass"] = "@Ingredients - All Checks/Ingredients - Sea Bass",
    ["Ingredients - Mussel"] = "@Ingredients - All Checks/Ingredients - Mussel",
    ["Ingredients - Cod"] = "@Ingredients - All Checks/Ingredients - Cod",
    ["Ingredients - Pumpkin"] = "@Ingredients - All Checks/Ingredients - Pumpkin",
    ["Ingredients - Zucchini"] = "@Ingredients - All Checks/Ingredients - Zucchini",
    ["Ingredients - Onion"] = "@Ingredients - All Checks/Ingredients - Onion",
    ["Ingredients - Tomato"] = "@Ingredients - All Checks/Ingredients - Tomato",
    ["Ingredients - Eggplant"] = "@Ingredients - All Checks/Ingredients - Eggplant",
    ["Ingredients - Carrot"] = "@Ingredients - All Checks/Ingredients - Carrot",
    ["Ingredients - Garlic"] = "@Ingredients - All Checks/Ingredients - Garlic",
    ["Ingredients - Celery"] = "@Ingredients - All Checks/Ingredients - Celery",
    ["Ingredients - Morel"] = "@Ingredients - All Checks/Ingredients - Morel",
    ["Ingredients - Porcini"] = "@Ingredients - All Checks/Ingredients - Porcini",
    ["Ingredients - Chanterelle"] = "@Ingredients - All Checks/Ingredients - Chanterelle",
    ["Ingredients - Portobello"] = "@Ingredients - All Checks/Ingredients - Portobello",
    ["Ingredients - Black Truffle"] = "@Ingredients - All Checks/Ingredients - Black Truffle",
    ["Ingredients - King Oyster Mushroom"] = "@Ingredients - All Checks/Ingredients - King Oyster Mushroom",
    ["Ingredients - Black Trumpet"] = "@Ingredients - All Checks/Ingredients - Black Trumpet",
    ["Ingredients - Miller Mushroom"] = "@Ingredients - All Checks/Ingredients - Miller Mushroom",
    ["Ingredients - Cloves"] = "@Ingredients - All Checks/Ingredients - Cloves",
    ["Ingredients - Rosemary"] = "@Ingredients - All Checks/Ingredients - Rosemary",
    ["Ingredients - Thyme"] = "@Ingredients - All Checks/Ingredients - Thyme",
    ["Ingredients - Bay Leaf"] = "@Ingredients - All Checks/Ingredients - Bay Leaf",
    ["Ingredients - Basil"] = "@Ingredients - All Checks/Ingredients - Basil",
    ["Ingredients - Dill"] = "@Ingredients - All Checks/Ingredients - Dill",
    ["Ingredients - Parsley"] = "@Ingredients - All Checks/Ingredients - Parsley",
    ["Ingredients - Saffron"] = "@Ingredients - All Checks/Ingredients - Saffron",
    ["Ingredients - Apricot"] = "@Ingredients - All Checks/Ingredients - Apricot",
    ["Ingredients - Gooseberry"] = "@Ingredients - All Checks/Ingredients - Gooseberry",
    ["Ingredients - Lemon"] = "@Ingredients - All Checks/Ingredients - Lemon",
    ["Ingredients - Orange"] = "@Ingredients - All Checks/Ingredients - Orange",
    ["Ingredients - Raspberry"] = "@Ingredients - All Checks/Ingredients - Raspberry",
    ["Ingredients - Pear"] = "@Ingredients - All Checks/Ingredients - Pear",
    ["Ingredients - Blackberry"] = "@Ingredients - All Checks/Ingredients - Blackberry",
    ["Ingredients - Apple"] = "@Ingredients - All Checks/Ingredients - Apple",
    ["Ingredients - Cheese"] = "@Ingredients - All Checks/Ingredients - Cheese",
    ["Ingredients - Chocolate"] = "@Ingredients - All Checks/Ingredients - Chocolate",
    ["Ingredients - Caviar"] = "@Ingredients - All Checks/Ingredients - Caviar",
    ["Ingredients - Butter"] = "@Ingredients - All Checks/Ingredients - Butter",
    ["Ingredients - Olive Oil"] = "@Ingredients - All Checks/Ingredients - Olive Oil",
    ["Ingredients - Cornichon"] = "@Ingredients - All Checks/Ingredients - Cornichon",
    ["Ingredients - Rice"] = "@Ingredients - All Checks/Ingredients - Rice",
    ["Ingredients - Veal"] = "@Ingredients - All Checks/Ingredients - Veal",
    ["Ingredients - Beef"] = "@Ingredients - All Checks/Ingredients - Beef",
    ["Ingredients - Quail"] = "@Ingredients - All Checks/Ingredients - Quail",
    ["Ingredients - Filet Mignon"] = "@Ingredients - All Checks/Ingredients - Filet Mignon",
    ["Olympus - Chest 29 (Large Chest, Realm of the Gods: Corridors)"] = "@Olympus - All Checks/Olympus - Chest 29 (Large Chest, Realm of the Gods: Corridors)",
    ["Olympus - Chest 9 (Large Chest, Mount Olympus: Cliff Ascent)"] = "@Olympus - All Checks/Olympus - Chest 9 (Large Chest, Mount Olympus: Cliff Ascent)",
    ["Olympus - Chest 31 (Large Chest, Realm of the Gods: Apex)"] = "@Olympus - All Checks/Olympus - Chest 31 (Large Chest, Realm of the Gods: Apex)",
    ["Olympus - Chest 24 (Large Chest, Thebes: Overlook)"] = "@Olympus - All Checks/Olympus - Chest 24 (Large Chest, Thebes: Overlook)",
    ["Olympus - Chest 25 (Small Chest, Realm of the Gods: Courtyard)"] = "@Olympus - All Checks/Olympus - Chest 25 (Small Chest, Realm of the Gods: Courtyard)",
    ["Olympus - Chest 26 (Small Chest, Realm of the Gods: Courtyard)"] = "@Olympus - All Checks/Olympus - Chest 26 (Small Chest, Realm of the Gods: Courtyard)",
    ["Olympus - Chest 27 (Small Chest, Realm of the Gods: Courtyard)"] = "@Olympus - All Checks/Olympus - Chest 27 (Small Chest, Realm of the Gods: Courtyard)",
    ["Olympus - Chest 28 (Small Chest, Realm of the Gods: Corridors)"] = "@Olympus - All Checks/Olympus - Chest 28 (Small Chest, Realm of the Gods: Corridors)",
    ["Olympus - Chest 30 (Small Chest, Realm of the Gods: Cloud Ridge)"] = "@Olympus - All Checks/Olympus - Chest 30 (Small Chest, Realm of the Gods: Cloud Ridge)",
    ["Olympus - Chest 32 (Small Chest, Realm of the Gods: Apex)"] = "@Olympus - All Checks/Olympus - Chest 32 (Small Chest, Realm of the Gods: Apex)",
    ["Olympus - Chest 1 (Small Chest, Mount Olympus: Ravine)"] = "@Olympus - All Checks/Olympus - Chest 1 (Small Chest, Mount Olympus: Ravine)",
    ["Olympus - Chest 2 (Small Chest, Mount Olympus: Ravine)"] = "@Olympus - All Checks/Olympus - Chest 2 (Small Chest, Mount Olympus: Ravine)",
    ["Olympus - Chest 3 (Small Chest, Mount Olympus: Cliff Ascent)"] = "@Olympus - All Checks/Olympus - Chest 3 (Small Chest, Mount Olympus: Cliff Ascent)",
    ["Olympus - Chest 4 (Small Chest, Mount Olympus: Cliff Ascent)"] = "@Olympus - All Checks/Olympus - Chest 4 (Small Chest, Mount Olympus: Cliff Ascent)",
    ["Olympus - Chest 5 (Small Chest, Mount Olympus: Cliff Ascent)"] = "@Olympus - All Checks/Olympus - Chest 5 (Small Chest, Mount Olympus: Cliff Ascent)",
    ["Olympus - Chest 6 (Small Chest, Mount Olympus: Cliff Ascent)"] = "@Olympus - All Checks/Olympus - Chest 6 (Small Chest, Mount Olympus: Cliff Ascent)",
    ["Olympus - Chest 7 (Small Chest, Mount Olympus: Cliff Ascent)"] = "@Olympus - All Checks/Olympus - Chest 7 (Small Chest, Mount Olympus: Cliff Ascent)",
    ["Olympus - Chest 8 (Small Chest, Mount Olympus: Cliff Ascent)"] = "@Olympus - All Checks/Olympus - Chest 8 (Small Chest, Mount Olympus: Cliff Ascent)",
    ["Olympus - Chest 10 (Small Chest, Mount Olympus: Mountainside)"] = "@Olympus - All Checks/Olympus - Chest 10 (Small Chest, Mount Olympus: Mountainside)",
    ["Olympus - Chest 11 (Small Chest, Mount Olympus: Summit)"] = "@Olympus - All Checks/Olympus - Chest 11 (Small Chest, Mount Olympus: Summit)",
    ["Olympus - Chest 12 (Small Chest, Mount Olympus: Mountainside)"] = "@Olympus - All Checks/Olympus - Chest 12 (Small Chest, Mount Olympus: Mountainside)",
    ["Olympus - Chest 13 (Small Chest, Thebes: Alleyway)"] = "@Olympus - All Checks/Olympus - Chest 13 (Small Chest, Thebes: Alleyway)",
    ["Olympus - Chest 14 (Small Chest, Thebes: Alleyway)"] = "@Olympus - All Checks/Olympus - Chest 14 (Small Chest, Thebes: Alleyway)",
    ["Olympus - Chest 15 (Small Chest, Thebes: Agora)"] = "@Olympus - All Checks/Olympus - Chest 15 (Small Chest, Thebes: Agora)",
    ["Olympus - Chest 16 (Small Chest, Thebes: The Big Olive)"] = "@Olympus - All Checks/Olympus - Chest 16 (Small Chest, Thebes: The Big Olive)",
    ["Olympus - Chest 17 (Small Chest, Thebes: The Big Olive)"] = "@Olympus - All Checks/Olympus - Chest 17 (Small Chest, Thebes: The Big Olive)",
    ["Olympus - Chest 18 (Small Chest, Thebes: Gardens)"] = "@Olympus - All Checks/Olympus - Chest 18 (Small Chest, Thebes: Gardens)",
    ["Olympus - Chest 19 (Small Chest, Thebes: Overlook)"] = "@Olympus - All Checks/Olympus - Chest 19 (Small Chest, Thebes: Overlook)",
    ["Olympus - Chest 20 (Small Chest, Thebes: Overlook)"] = "@Olympus - All Checks/Olympus - Chest 20 (Small Chest, Thebes: Overlook)",
    ["Olympus - Chest 21 (Small Chest, Thebes: Gardens)"] = "@Olympus - All Checks/Olympus - Chest 21 (Small Chest, Thebes: Gardens)",
    ["Olympus - Chest 22 (Small Chest, Thebes: Overlook)"] = "@Olympus - All Checks/Olympus - Chest 22 (Small Chest, Thebes: Overlook)",
    ["Olympus - Chest 23 (Small Chest, Thebes: Overlook)"] = "@Olympus - All Checks/Olympus - Chest 23 (Small Chest, Thebes: Overlook)",
    ["Forge Knight's Shield+ for Goofy"] = "@Olympus - All Checks/Forge Knight's Shield+ for Goofy",
    ["Find Golden Herc Figure in Thebes: Alleyway, In Building"] = "@Olympus - All Checks/Find Golden Herc Figure in Thebes: Alleyway, In Building",
    ["Find Golden Herc Figure in Thebes: Garden, Digged-Up Pit"] = "@Olympus - All Checks/Find Golden Herc Figure in Thebes: Garden, Digged-Up Pit",
    ["Find Golden Herc Figure in Thebes: Garden, In Building"] = "@Olympus - All Checks/Find Golden Herc Figure in Thebes: Garden, In Building",
    ["Find Golden Herc Figure in Thebes: Overlook, On Statue's Shield"] = "@Olympus - All Checks/Find Golden Herc Figure in Thebes: Overlook, On Statue's Shield",
    ["Find Golden Herc Figure in Thebes: Agora, Near Save Point"] = "@Olympus - All Checks/Find Golden Herc Figure in Thebes: Agora, Near Save Point",
    ["Return All Golden Herc Figures"] = "@Olympus - All Checks/Return All Golden Herc Figures",
    ["Olympus - EVENT_KEYBLADE_001 - RandomizedItem"] = "@Olympus - All Checks/Olympus - EVENT_KEYBLADE_001 - RandomizedItem",
    ["Olympus - Mount Olympus: Cliff Ascent Heartless"] = "@Olympus - All Checks/Olympus - Mount Olympus: Cliff Ascent Heartless",
    ["Olympus - Thebes: Agora Flame Cores"] = "@Olympus - All Checks/Olympus - Thebes: Agora Flame Cores",
    ["Olympus - Thebes: Overlook Flame Cores"] = "@Olympus - All Checks/Olympus - Thebes: Overlook Flame Cores",
    ["Olympus - Thebes: Gardens Flame Cores"] = "@Olympus - All Checks/Olympus - Thebes: Gardens Flame Cores",
    ["Olympus - Thebes: Alleyway Heartless"] = "@Olympus - All Checks/Olympus - Thebes: Alleyway Heartless",
    ["Defeat Rock Troll in Olympus - Thebes: Agora"] = "@Olympus - All Checks/Defeat Rock Troll in Olympus - Thebes: Agora",
    ["Defeat Rock Titan in Olympus: Mount Olympus - Summit"] = "@Olympus - All Checks/Defeat Rock Titan in Olympus: Mount Olympus - Summit",
    ["Olympus - Realm of the Gods: Courtyard Satyrs"] = "@Olympus - All Checks/Olympus - Realm of the Gods: Courtyard Satyrs",
    ["Defeat Tornado Titan in Olympus: Realm of the Gods"] = "@Olympus - All Checks/Defeat Tornado Titan in Olympus: Realm of the Gods",
    ["Olympus - Defeat Darkside (Final World)"] = "@Olympus - All Checks/Olympus - Defeat Darkside (Final World)",
    ["Twilight Town - Chest 1 (Large Chest, The Neighborhood: Tram Common)"] = "@Twilight Town - All Checks/Twilight Town - Chest 1 (Large Chest, The Neighborhood: Tram Common)",
    ["Twilight Town - Chest 2 (Small Chest, The Neighborhood: Tram Common)"] = "@Twilight Town - All Checks/Twilight Town - Chest 2 (Small Chest, The Neighborhood: Tram Common)",
    ["Twilight Town - Chest 3 (Small Chest, The Neighborhood: Tram Common)"] = "@Twilight Town - All Checks/Twilight Town - Chest 3 (Small Chest, The Neighborhood: Tram Common)",
    ["Twilight Town - Chest 4 (Small Chest, The Neighborhood: Tram Common)"] = "@Twilight Town - All Checks/Twilight Town - Chest 4 (Small Chest, The Neighborhood: Tram Common)",
    ["Twilight Town - Chest 5 (Small Chest, The Neighborhood: Tram Common)"] = "@Twilight Town - All Checks/Twilight Town - Chest 5 (Small Chest, The Neighborhood: Tram Common)",
    ["Twilight Town - Chest 6 (Small Chest, Underground Conduit)"] = "@Twilight Town - All Checks/Twilight Town - Chest 6 (Small Chest, Underground Conduit)",
    ["Twilight Town - Chest 7 (Small Chest, The Woods)"] = "@Twilight Town - All Checks/Twilight Town - Chest 7 (Small Chest, The Woods)",
    ["Twilight Town - Chest 8 (Small Chest, The Woods)"] = "@Twilight Town - All Checks/Twilight Town - Chest 8 (Small Chest, The Woods)",
    ["Twilight Town - Chest 9 (Small Chest, The Woods)"] = "@Twilight Town - All Checks/Twilight Town - Chest 9 (Small Chest, The Woods)",
    ["Twilight Town - Chest 10 (Small Chest, The Old Mansion)"] = "@Twilight Town - All Checks/Twilight Town - Chest 10 (Small Chest, The Old Mansion)",
    ["Twilight Town - EVENT_KEYBLADE_002 - RandomizedItem"] = "@Twilight Town - All Checks/Twilight Town - EVENT_KEYBLADE_002 - RandomizedItem",
    ["Twilight Town - EVENT_CKGAME_001 - RandomizedItem"] = "@Twilight Town - All Checks/Twilight Town - EVENT_CKGAME_001 - RandomizedItem",
    ["Defeat Demon Tide in Twilight Town - The Neighborhood: Tram Common"] = "@Twilight Town - All Checks/Defeat Demon Tide in Twilight Town - The Neighborhood: Tram Common",
    ["Twilight Town - The Woods Powerwilds"] = "@Twilight Town - All Checks/Twilight Town - The Woods Powerwilds",
    ["Twilight Town - The Old Mansion Heartless & Nobodies"] = "@Twilight Town - All Checks/Twilight Town - The Old Mansion Heartless & Nobodies",
    ["Toy Box - Chest 1 (Large Chest, Andy's House)"] = "@Toy Box - All Checks/Toy Box - Chest 1 (Large Chest, Andy's House)",
    ["Toy Box - Chest 2 (Large Chest, Andy's House)"] = "@Toy Box - All Checks/Toy Box - Chest 2 (Large Chest, Andy's House)",
    ["Toy Box - Chest 5 (Large Chest, Galaxy Toys: Main Floor 1F)"] = "@Toy Box - All Checks/Toy Box - Chest 5 (Large Chest, Galaxy Toys: Main Floor 1F)",
    ["Toy Box - Chest 13 (Large Chest, Galaxy Toys: Lower Vents)"] = "@Toy Box - All Checks/Toy Box - Chest 13 (Large Chest, Galaxy Toys: Lower Vents)",
    ["Toy Box - Chest 24 (Large Chest, Galaxy Toys: Kid Korral)"] = "@Toy Box - All Checks/Toy Box - Chest 24 (Large Chest, Galaxy Toys: Kid Korral)",
    ["Toy Box - Chest 29 (Large Chest, Galaxy Toys: Main Floor: 3F)"] = "@Toy Box - All Checks/Toy Box - Chest 29 (Large Chest, Galaxy Toys: Main Floor: 3F)",
    ["Toy Box - Chest 3 (Small Chest, Andy's House)"] = "@Toy Box - All Checks/Toy Box - Chest 3 (Small Chest, Andy's House)",
    ["Toy Box - Chest 4 (Small Chest, Andy's House)"] = "@Toy Box - All Checks/Toy Box - Chest 4 (Small Chest, Andy's House)",
    ["Toy Box - Chest 6 (Small Chest, Galaxy Toys: Main Floor: 2F)"] = "@Toy Box - All Checks/Toy Box - Chest 6 (Small Chest, Galaxy Toys: Main Floor: 2F)",
    ["Toy Box - Chest 7 (Small Chest, Galaxy Toys: Main Floor: 3F)"] = "@Toy Box - All Checks/Toy Box - Chest 7 (Small Chest, Galaxy Toys: Main Floor: 3F)",
    ["Toy Box - Chest 8 (Small Chest, Galaxy Toys: Action Figures)"] = "@Toy Box - All Checks/Toy Box - Chest 8 (Small Chest, Galaxy Toys: Action Figures)",
    ["Toy Box - Chest 9 (Small Chest, Galaxy Toys: Action Figures)"] = "@Toy Box - All Checks/Toy Box - Chest 9 (Small Chest, Galaxy Toys: Action Figures)",
    ["Toy Box - Chest 10 (Small Chest, Galaxy Toys: Action Figures)"] = "@Toy Box - All Checks/Toy Box - Chest 10 (Small Chest, Galaxy Toys: Action Figures)",
    ["Toy Box - Chest 11 (Small Chest, Galaxy Toys: Lower Vents)"] = "@Toy Box - All Checks/Toy Box - Chest 11 (Small Chest, Galaxy Toys: Lower Vents)",
    ["Toy Box - Chest 12 (Small Chest, Galaxy Toys: Lower Vents)"] = "@Toy Box - All Checks/Toy Box - Chest 12 (Small Chest, Galaxy Toys: Lower Vents)",
    ["Toy Box - Chest 14 (Small Chest, Babies and Toddlers: Dolls)"] = "@Toy Box - All Checks/Toy Box - Chest 14 (Small Chest, Babies and Toddlers: Dolls)",
    ["Toy Box - Chest 15 (Small Chest, Babies and Toddlers: Dolls)"] = "@Toy Box - All Checks/Toy Box - Chest 15 (Small Chest, Babies and Toddlers: Dolls)",
    ["Toy Box - Chest 16 (Small Chest, Babies and Toddlers: Dolls)"] = "@Toy Box - All Checks/Toy Box - Chest 16 (Small Chest, Babies and Toddlers: Dolls)",
    ["Toy Box - Chest 17 (Small Chest, Babies and Toddlers: Dolls)"] = "@Toy Box - All Checks/Toy Box - Chest 17 (Small Chest, Babies and Toddlers: Dolls)",
    ["Toy Box - Chest 18 (Small Chest, Babies and Toddlers: Outdoors)"] = "@Toy Box - All Checks/Toy Box - Chest 18 (Small Chest, Babies and Toddlers: Outdoors)",
    ["Toy Box - Chest 19 (Small Chest, Babies and Toddlers: Outdoors)"] = "@Toy Box - All Checks/Toy Box - Chest 19 (Small Chest, Babies and Toddlers: Outdoors)",
    ["Toy Box - Chest 20 (Small Chest, Galaxy Toys: Video Games)"] = "@Toy Box - All Checks/Toy Box - Chest 20 (Small Chest, Galaxy Toys: Video Games)",
    ["Toy Box - Chest 21 (Small Chest, Galaxy Toys: Kid Korral)"] = "@Toy Box - All Checks/Toy Box - Chest 21 (Small Chest, Galaxy Toys: Kid Korral)",
    ["Toy Box - Chest 22 (Small Chest, Galaxy Toys: Kid Korral)"] = "@Toy Box - All Checks/Toy Box - Chest 22 (Small Chest, Galaxy Toys: Kid Korral)",
    ["Toy Box - Chest 23 (Small Chest, Galaxy Toys: Kid Korral)"] = "@Toy Box - All Checks/Toy Box - Chest 23 (Small Chest, Galaxy Toys: Kid Korral)",
    ["Toy Box - Chest 25 (Small Chest, Galaxy Toys: Kid Korral)"] = "@Toy Box - All Checks/Toy Box - Chest 25 (Small Chest, Galaxy Toys: Kid Korral)",
    ["Toy Box - Chest 26 (Small Chest, Galaxy Toys: Rest Area)"] = "@Toy Box - All Checks/Toy Box - Chest 26 (Small Chest, Galaxy Toys: Rest Area)",
    ["Toy Box - Chest 27 (Small Chest, Galaxy Toys: Main Floor 1F)"] = "@Toy Box - All Checks/Toy Box - Chest 27 (Small Chest, Galaxy Toys: Main Floor 1F)",
    ["Toy Box - Chest 28 (Small Chest, Babies and Toddlers: Outdoors)"] = "@Toy Box - All Checks/Toy Box - Chest 28 (Small Chest, Babies and Toddlers: Outdoors)",
    ["Toy Box - EVENT_KEYBLADE_003 - RandomizedItem"] = "@Toy Box - All Checks/Toy Box - EVENT_KEYBLADE_003 - RandomizedItem",
    ["Toy Box - EVENT_HEARTBINDER_002 - RandomizedItem"] = "@Toy Box - All Checks/Toy Box - EVENT_HEARTBINDER_002 - RandomizedItem",
    ["Toy Box - Andy's House Heartless"] = "@Toy Box - All Checks/Toy Box - Andy's House Heartless",
    ["Toy Box - Galaxy Toys: Main Floor: 1F Gigas"] = "@Toy Box - All Checks/Toy Box - Galaxy Toys: Main Floor: 1F Gigas",
    ["Toy Box - Galaxy Toys: Action Figures Supreme Smashers"] = "@Toy Box - All Checks/Toy Box - Galaxy Toys: Action Figures Supreme Smashers",
    ["Defeat Angelic Amber in Toy Box - Babies & Toddlers: Dolls"] = "@Toy Box - All Checks/Defeat Angelic Amber in Toy Box - Babies & Toddlers: Dolls",
    ["After the UFO Mini-Boss in Toy Box - Babies & Toddlers: Outdoors"] = "@Toy Box - All Checks/After the UFO Mini-Boss in Toy Box - Babies & Toddlers: Outdoors",
    ["Complete Verum Rex: Beat of Lead during the Story"] = "@Toy Box - All Checks/Complete Verum Rex: Beat of Lead during the Story",
    ["Defeat King of Toys in Toy Box: Galaxy Toys"] = "@Toy Box - All Checks/Defeat King of Toys in Toy Box: Galaxy Toys",
    ["Kingdom of Corona - Chest 7 (Large Chest, The Forest: Hills)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 7 (Large Chest, The Forest: Hills)",
    ["Kingdom of Corona - Chest 10 (Large Chest, The Forest: Marsh)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 10 (Large Chest, The Forest: Marsh)",
    ["Kingdom of Corona - Chest 9 (Large Chest, The Forest: Hills)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 9 (Large Chest, The Forest: Hills)",
    ["Kingdom of Corona - Chest 22 (Large Chest, The Forest: Wildflower Clearing)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 22 (Large Chest, The Forest: Wildflower Clearing)",
    ["Kingdom of Corona - Chest 24 (Large Chest, The Kingdom: Thoroughfare)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 24 (Large Chest, The Kingdom: Thoroughfare)",
    ["Kingdom of Corona - Chest 14 (Large Chest, The Forest: Wetlands)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 14 (Large Chest, The Forest: Wetlands)",
    ["Kingdom of Corona - Chest 1 (Small Chest, The Forest: Tower)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 1 (Small Chest, The Forest: Tower)",
    ["Kingdom of Corona - Chest 2 (Small Chest, The Forest: Hills)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 2 (Small Chest, The Forest: Hills)",
    ["Kingdom of Corona - Chest 3 (Small Chest, The Forest: Hills)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 3 (Small Chest, The Forest: Hills)",
    ["Kingdom of Corona - Chest 4 (Small Chest, The Forest: Hills)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 4 (Small Chest, The Forest: Hills)",
    ["Kingdom of Corona - Chest 5 (Small Chest, The Forest: Hills)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 5 (Small Chest, The Forest: Hills)",
    ["Kingdom of Corona - Chest 6 (Small Chest, The Forest: Hills)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 6 (Small Chest, The Forest: Hills)",
    ["Kingdom of Corona - Chest 8 (Small Chest, The Forest: Hills)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 8 (Small Chest, The Forest: Hills)",
    ["Kingdom of Corona - Chest 11 (Small Chest, The Forest: Marsh)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 11 (Small Chest, The Forest: Marsh)",
    ["Kingdom of Corona - Chest 12 (Small Chest, The Forest: Marsh)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 12 (Small Chest, The Forest: Marsh)",
    ["Kingdom of Corona - Chest 13 (Small Chest, The Forest: Wetlands)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 13 (Small Chest, The Forest: Wetlands)",
    ["Kingdom of Corona - Chest 15 (Small Chest, The Forest: Wetlands)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 15 (Small Chest, The Forest: Wetlands)",
    ["Kingdom of Corona - Chest 16 (Small Chest, The Forest: Wetlands)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 16 (Small Chest, The Forest: Wetlands)",
    ["Kingdom of Corona - Chest 17 (Small Chest, The Forest: Wetlands)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 17 (Small Chest, The Forest: Wetlands)",
    ["Kingdom of Corona - Chest 18 (Small Chest, The Forest: Wetlands)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 18 (Small Chest, The Forest: Wetlands)",
    ["Kingdom of Corona - Chest 19 (Small Chest, The Forest: Campsite)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 19 (Small Chest, The Forest: Campsite)",
    ["Kingdom of Corona - Chest 20 (Small Chest, The Forest: Shore)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 20 (Small Chest, The Forest: Shore)",
    ["Kingdom of Corona - Chest 21 (Small Chest, The Forest: Wildflower Clearing)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 21 (Small Chest, The Forest: Wildflower Clearing)",
    ["Kingdom of Corona - Chest 23 (Small Chest, The Kingdom: Thoroughfare)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 23 (Small Chest, The Kingdom: Thoroughfare)",
    ["Kingdom of Corona - Chest 25 (Small Chest, The Kingdom: Thoroughfare)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 25 (Small Chest, The Kingdom: Thoroughfare)",
    ["Kingdom of Corona - Chest 26 (Small Chest, The Kingdom: Wharf)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 26 (Small Chest, The Kingdom: Wharf)",
    ["Kingdom of Corona - Chest 27 (Small Chest, The Kingdom: Wharf)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 27 (Small Chest, The Kingdom: Wharf)",
    ["Kingdom of Corona - Chest 28 (Small Chest, The Kingdom: Wharf)"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - Chest 28 (Small Chest, The Kingdom: Wharf)",
    ["Kingdom of Corona - EVENT_KEYBLADE_004 - RandomizedItem"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - EVENT_KEYBLADE_004 - RandomizedItem",
    ["Kingdom of Corona - The Forest: Hills Heartless"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Hills Heartless",
    ["Kingdom of Corona - The Forest: Hills Chief Puffs & Puffballs"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Hills Chief Puffs & Puffballs",
    ["Kingdom of Corona - The Forest: Hills Reapers"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Hills Reapers",
    ["Defeat Chaos Carriage in Kingdom of Corona"] = "@Kingdom of Corona - All Checks/Defeat Chaos Carriage in Kingdom of Corona",
    ["Kingdom of Corona - The Kingdom: Wharf Nobodies"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Kingdom: Wharf Nobodies",
    ["Kingdom of Corona - The Forest: Tower Heartless"] = "@Kingdom of Corona - All Checks/Kingdom of Corona - The Forest: Tower Heartless",
    ["Defeat Grim Guardianess in Kingdom of Corona - The Forest: Tower"] = "@Kingdom of Corona - All Checks/Defeat Grim Guardianess in Kingdom of Corona - The Forest: Tower",
    ["Monstropolis - Chest 1 (Large Chest, Monsters)"] = "@Monstropolis - All Checks/Monstropolis - Chest 1 (Large Chest, Monsters)",
    ["Monstropolis - Chest 9 (Large Chest, The Factory: Basement)"] = "@Monstropolis - All Checks/Monstropolis - Chest 9 (Large Chest, The Factory: Basement)",
    ["Monstropolis - Chest 19 (Large Chest, The Power Plant: Tank Yard)"] = "@Monstropolis - All Checks/Monstropolis - Chest 19 (Large Chest, The Power Plant: Tank Yard)",
    ["Monstropolis - Chest 10 (Large Chest, The Factory: Ground Floor)"] = "@Monstropolis - All Checks/Monstropolis - Chest 10 (Large Chest, The Factory: Ground Floor)",
    ["Monstropolis - Chest 2 (Small Chest, Monsters)"] = "@Monstropolis - All Checks/Monstropolis - Chest 2 (Small Chest, Monsters)",
    ["Monstropolis - Chest 3 (Small Chest, Monsters)"] = "@Monstropolis - All Checks/Monstropolis - Chest 3 (Small Chest, Monsters)",
    ["Monstropolis - Chest 4 (Small Chest, Monsters)"] = "@Monstropolis - All Checks/Monstropolis - Chest 4 (Small Chest, Monsters)",
    ["Monstropolis - Chest 11 (Small Chest, The Factory: Ground Floor)"] = "@Monstropolis - All Checks/Monstropolis - Chest 11 (Small Chest, The Factory: Ground Floor)",
    ["Monstropolis - Chest 12 (Small Chest, The Factory: Ground Floor)"] = "@Monstropolis - All Checks/Monstropolis - Chest 12 (Small Chest, The Factory: Ground Floor)",
    ["Monstropolis - Chest 13 (Small Chest, The Factory: Second Floor)"] = "@Monstropolis - All Checks/Monstropolis - Chest 13 (Small Chest, The Factory: Second Floor)",
    ["Monstropolis - Chest 14 (Small Chest, The Factory: Second Floor)"] = "@Monstropolis - All Checks/Monstropolis - Chest 14 (Small Chest, The Factory: Second Floor)",
    ["Monstropolis - Chest 15 (Small Chest, The Power Plant: Accessway)"] = "@Monstropolis - All Checks/Monstropolis - Chest 15 (Small Chest, The Power Plant: Accessway)",
    ["Monstropolis - Chest 16 (Small Chest, The Power Plant: Accessway)"] = "@Monstropolis - All Checks/Monstropolis - Chest 16 (Small Chest, The Power Plant: Accessway)",
    ["Monstropolis - Chest 17 (Small Chest, The Power Plant: Accessway)"] = "@Monstropolis - All Checks/Monstropolis - Chest 17 (Small Chest, The Power Plant: Accessway)",
    ["Monstropolis - Chest 18 (Small Chest, The Power Plant: Tank Yard)"] = "@Monstropolis - All Checks/Monstropolis - Chest 18 (Small Chest, The Power Plant: Tank Yard)",
    ["Monstropolis - Chest 20 (Small Chest, The Power Plant: Vault Passage)"] = "@Monstropolis - All Checks/Monstropolis - Chest 20 (Small Chest, The Power Plant: Vault Passage)",
    ["Monstropolis - Chest 21 (Small Chest, The Power Plant: Vault Passage)"] = "@Monstropolis - All Checks/Monstropolis - Chest 21 (Small Chest, The Power Plant: Vault Passage)",
    ["Monstropolis - Chest 22 (Small Chest, The Power Plant: Accessway)"] = "@Monstropolis - All Checks/Monstropolis - Chest 22 (Small Chest, The Power Plant: Accessway)",
    ["Monstropolis - Chest 5 (Small Chest, Monsters)"] = "@Monstropolis - All Checks/Monstropolis - Chest 5 (Small Chest, Monsters)",
    ["Monstropolis - Chest 6 (Small Chest, Monsters)"] = "@Monstropolis - All Checks/Monstropolis - Chest 6 (Small Chest, Monsters)",
    ["Monstropolis - Chest 7 (Small Chest, The Door Vault: Service Area)"] = "@Monstropolis - All Checks/Monstropolis - Chest 7 (Small Chest, The Door Vault: Service Area)",
    ["Monstropolis - Chest 8 (Small Chest, The Door Vault: Service Area)"] = "@Monstropolis - All Checks/Monstropolis - Chest 8 (Small Chest, The Door Vault: Service Area)",
    ["Monstropolis - EVENT_008 - RandomizedItem"] = "@Monstropolis - All Checks/Monstropolis - EVENT_008 - RandomizedItem",
    ["Monstropolis - EVENT_KEYBLADE_005 - RandomizedItem"] = "@Monstropolis - All Checks/Monstropolis - EVENT_KEYBLADE_005 - RandomizedItem",
    ["Monstropolis - EVENT_HEARTBINDER_003 - RandomizedItem"] = "@Monstropolis - All Checks/Monstropolis - EVENT_HEARTBINDER_003 - RandomizedItem",
    ["Monstropolis - Monsters Inc.: Lobby & Offices Unversed"] = "@Monstropolis - All Checks/Monstropolis - Monsters Inc.: Lobby & Offices Unversed",
    ["Monstropolis - Monsters Inc.: Laugh Floor Unversed"] = "@Monstropolis - All Checks/Monstropolis - Monsters Inc.: Laugh Floor Unversed",
    ["Monstropolis - The Door Vault: Upper Level Heartless"] = "@Monstropolis - All Checks/Monstropolis - The Door Vault: Upper Level Heartless",
    ["Monstropolis - The Factory: Second Floor Heartless & Unversed"] = "@Monstropolis - All Checks/Monstropolis - The Factory: Second Floor Heartless & Unversed",
    ["Monstropolis - The Factory: Second Floor Unversed"] = "@Monstropolis - All Checks/Monstropolis - The Factory: Second Floor Unversed",
    ["Monstropolis - The Power Plant: Accessway Heartless & Unversed"] = "@Monstropolis - All Checks/Monstropolis - The Power Plant: Accessway Heartless & Unversed",
    ["Monstropolis  - The Power Plant: Tank Yard Heartless"] = "@Monstropolis - All Checks/Monstropolis  - The Power Plant: Tank Yard Heartless",
    ["Monstropolis - The Power Plant: Tank Yard Unversed"] = "@Monstropolis - All Checks/Monstropolis - The Power Plant: Tank Yard Unversed",
    ["Defeat Lump of Horror in Monstropolis - The Door Vault: Service Area"] = "@Monstropolis - All Checks/Defeat Lump of Horror in Monstropolis - The Door Vault: Service Area",
    ["Arendelle - Chest 1 (Large Chest, The North Mountain: Treescape)"] = "@Arendelle - All Checks/Arendelle - Chest 1 (Large Chest, The North Mountain: Treescape)",
    ["Arendelle - Chest 10 (Large Chest, The Labyrinth of Ice: Middle Tier)"] = "@Arendelle - All Checks/Arendelle - Chest 10 (Large Chest, The Labyrinth of Ice: Middle Tier)",
    ["Arendelle - Chest 8 (Large Chest, The North Mountain: Treescape)"] = "@Arendelle - All Checks/Arendelle - Chest 8 (Large Chest, The North Mountain: Treescape)",
    ["Arendelle - Chest 7 (Large Chest, The North Mountain: Snowfield)"] = "@Arendelle - All Checks/Arendelle - Chest 7 (Large Chest, The North Mountain: Snowfield)",
    ["Arendelle - Chest 14 (Large Chest, The Labyrinth of Ice: Lower Tier)"] = "@Arendelle - All Checks/Arendelle - Chest 14 (Large Chest, The Labyrinth of Ice: Lower Tier)",
    ["Arendelle - Chest 9 (Large Chest, The North Mountain: Snowfield)"] = "@Arendelle - All Checks/Arendelle - Chest 9 (Large Chest, The North Mountain: Snowfield)",
    ["Arendelle - Chest 2 (Small Chest, The North Mountain: Treescape)"] = "@Arendelle - All Checks/Arendelle - Chest 2 (Small Chest, The North Mountain: Treescape)",
    ["Arendelle - Chest 3 (Small Chest, The North Mountain: Treescape)"] = "@Arendelle - All Checks/Arendelle - Chest 3 (Small Chest, The North Mountain: Treescape)",
    ["Arendelle - Chest 4 (Small Chest, The North Mountain: Gorge)"] = "@Arendelle - All Checks/Arendelle - Chest 4 (Small Chest, The North Mountain: Gorge)",
    ["Arendelle - Chest 5 (Small Chest, The North Mountain: Gorge)"] = "@Arendelle - All Checks/Arendelle - Chest 5 (Small Chest, The North Mountain: Gorge)",
    ["Arendelle - Chest 6 (Small Chest, The North Mountain: Snowfield)"] = "@Arendelle - All Checks/Arendelle - Chest 6 (Small Chest, The North Mountain: Snowfield)",
    ["Arendelle - Chest 11 (Small Chest, The Labyrinth of Ice: Upper Tier)"] = "@Arendelle - All Checks/Arendelle - Chest 11 (Small Chest, The Labyrinth of Ice: Upper Tier)",
    ["Arendelle - Chest 12 (Small Chest, The Labyrinth of Ice: Middle Tier)"] = "@Arendelle - All Checks/Arendelle - Chest 12 (Small Chest, The Labyrinth of Ice: Middle Tier)",
    ["Arendelle - Chest 13 (Small Chest, The Labyrinth of Ice: Upper Tier)"] = "@Arendelle - All Checks/Arendelle - Chest 13 (Small Chest, The Labyrinth of Ice: Upper Tier)",
    ["Arendelle - Chest 15 (Small Chest, The Labyrinth of Ice: Middle Tier)"] = "@Arendelle - All Checks/Arendelle - Chest 15 (Small Chest, The Labyrinth of Ice: Middle Tier)",
    ["Arendelle - Chest 16 (Small Chest, The North Mountain: Valley of Ice)"] = "@Arendelle - All Checks/Arendelle - Chest 16 (Small Chest, The North Mountain: Valley of Ice)",
    ["Arendelle - Chest 17 (Small Chest, The North Mountain: Valley of Ice)"] = "@Arendelle - All Checks/Arendelle - Chest 17 (Small Chest, The North Mountain: Valley of Ice)",
    ["Arendelle - Chest 18 (Small Chest, The North Mountain: Valley of Ice)"] = "@Arendelle - All Checks/Arendelle - Chest 18 (Small Chest, The North Mountain: Valley of Ice)",
    ["Arendelle - Chest 19 (Small Chest, The North Mountain: Valley of Ice)"] = "@Arendelle - All Checks/Arendelle - Chest 19 (Small Chest, The North Mountain: Valley of Ice)",
    ["Arendelle - Chest 20 (Small Chest, The North Mountain: Valley of Ice)"] = "@Arendelle - All Checks/Arendelle - Chest 20 (Small Chest, The North Mountain: Valley of Ice)",
    ["Arendelle - Chest 21 (Small Chest, The North Mountain: Frozen Wall)"] = "@Arendelle - All Checks/Arendelle - Chest 21 (Small Chest, The North Mountain: Frozen Wall)",
    ["Arendelle - Chest 22 (Small Chest, The North Mountain: Frozen Wall)"] = "@Arendelle - All Checks/Arendelle - Chest 22 (Small Chest, The North Mountain: Frozen Wall)",
    ["Arendelle - Chest 23 (Small Chest, The North Mountain: Frozen Wall)"] = "@Arendelle - All Checks/Arendelle - Chest 23 (Small Chest, The North Mountain: Frozen Wall)",
    ["Arendelle - Chest 24 (Small Chest, The North Mountain: Foothills)"] = "@Arendelle - All Checks/Arendelle - Chest 24 (Small Chest, The North Mountain: Foothills)",
    ["Arendelle - Chest 25 (Small Chest, The North Mountain: Foothills)"] = "@Arendelle - All Checks/Arendelle - Chest 25 (Small Chest, The North Mountain: Foothills)",
    ["Arendelle - EVENT_KEYBLADE_007 - RandomizedItem"] = "@Arendelle - All Checks/Arendelle - EVENT_KEYBLADE_007 - RandomizedItem",
    ["Defeat Rock Troll & Winterhorns in Arendelle - The North Mountain: Gorge"] = "@Arendelle - All Checks/Defeat Rock Troll & Winterhorns in Arendelle - The North Mountain: Gorge",
    ["The Labyrinth of Ice: Middle Tier Ninjas I"] = "@Arendelle - All Checks/The Labyrinth of Ice: Middle Tier Ninjas I",
    ["The Labyrinth of Ice: Lower Tier Ninjas II"] = "@Arendelle - All Checks/The Labyrinth of Ice: Lower Tier Ninjas II",
    ["The Labyrinth of Ice: Middle Tier Ninjas III"] = "@Arendelle - All Checks/The Labyrinth of Ice: Middle Tier Ninjas III",
    ["The Labyrinth of Ice: Middle Tier Ninjas IV"] = "@Arendelle - All Checks/The Labyrinth of Ice: Middle Tier Ninjas IV",
    ["Defeat Marshmallow in Arendelle - The North Mountain: Mountain Ridge"] = "@Arendelle - All Checks/Defeat Marshmallow in Arendelle - The North Mountain: Mountain Ridge",
    ["Frozen Slider Frost Serpents"] = "@Arendelle - All Checks/Frozen Slider Frost Serpents",
    ["Arendelle - The North Mountain: The Valley of Ice Heartless"] = "@Arendelle - All Checks/Arendelle - The North Mountain: The Valley of Ice Heartless",
    ["Defeat Skoll in Arendelle"] = "@Arendelle - All Checks/Defeat Skoll in Arendelle",
    ["The Caribbean - Chest 51 (Large Chest, Port Royal: Docks)"] = "@The Caribbean - All Checks/The Caribbean - Chest 51 (Large Chest, Port Royal: Docks)",
    ["The Caribbean - Chest 17 (Large Chest, Isla de los Mastiles)"] = "@The Caribbean - All Checks/The Caribbean - Chest 17 (Large Chest, Isla de los Mastiles)",
    ["The Caribbean - Chest 18 (Large Chest, Ship's End)"] = "@The Caribbean - All Checks/The Caribbean - Chest 18 (Large Chest, Ship's End)",
    ["The Caribbean - Chest 19 (Large Chest, Sandbar Isle)"] = "@The Caribbean - All Checks/The Caribbean - Chest 19 (Large Chest, Sandbar Isle)",
    ["The Caribbean - Chest 20 (Large Chest, Huddled Isles)"] = "@The Caribbean - All Checks/The Caribbean - Chest 20 (Large Chest, Huddled Isles)",
    ["The Caribbean - Chest 47 (Large Chest, Port Royal: Fort)"] = "@The Caribbean - All Checks/The Caribbean - Chest 47 (Large Chest, Port Royal: Fort)",
    ["The Caribbean - Chest 4 (Large Chest, Huddled Isles: Undersea Cavern)"] = "@The Caribbean - All Checks/The Caribbean - Chest 4 (Large Chest, Huddled Isles: Undersea Cavern)",
    ["The Caribbean - Chest 10 (Large Chest, Isla Verdemontana)"] = "@The Caribbean - All Checks/The Caribbean - Chest 10 (Large Chest, Isla Verdemontana)",
    ["The Caribbean - Chest 13 (Large Chest, Confinement Island)"] = "@The Caribbean - All Checks/The Caribbean - Chest 13 (Large Chest, Confinement Island)",
    ["The Caribbean - Chest 15 (Large Chest, Huddled Isles: Undersea Cavern)"] = "@The Caribbean - All Checks/The Caribbean - Chest 15 (Large Chest, Huddled Isles: Undersea Cavern)",
    ["The Caribbean - Chest 6 (Large Chest, Isla de los Mastiles)"] = "@The Caribbean - All Checks/The Caribbean - Chest 6 (Large Chest, Isla de los Mastiles)",
    ["The Caribbean - Chest 46 (Small Chest, Port Royal: Fort)"] = "@The Caribbean - All Checks/The Caribbean - Chest 46 (Small Chest, Port Royal: Fort)",
    ["The Caribbean - Chest 48 (Small Chest, Port Royal: Seaport)"] = "@The Caribbean - All Checks/The Caribbean - Chest 48 (Small Chest, Port Royal: Seaport)",
    ["The Caribbean - Chest 49 (Small Chest, Port Royal: Seaport)"] = "@The Caribbean - All Checks/The Caribbean - Chest 49 (Small Chest, Port Royal: Seaport)",
    ["The Caribbean - Chest 50 (Small Chest, Port Royal: Seaport)"] = "@The Caribbean - All Checks/The Caribbean - Chest 50 (Small Chest, Port Royal: Seaport)",
    ["The Caribbean - Chest 52 (Small Chest, Port Royal: Settlement)"] = "@The Caribbean - All Checks/The Caribbean - Chest 52 (Small Chest, Port Royal: Settlement)",
    ["The Caribbean - Chest 53 (Small Chest, Port Royal: Docks)"] = "@The Caribbean - All Checks/The Caribbean - Chest 53 (Small Chest, Port Royal: Docks)",
    ["The Caribbean - Chest 54 (Small Chest, Port Royal: Underwater)"] = "@The Caribbean - All Checks/The Caribbean - Chest 54 (Small Chest, Port Royal: Underwater)",
    ["The Caribbean - Chest 55 (Small Chest, Port Royal: Settlement)"] = "@The Caribbean - All Checks/The Caribbean - Chest 55 (Small Chest, Port Royal: Settlement)",
    ["The Caribbean - Chest 56 (Small Chest, Port Royal: Seaport)"] = "@The Caribbean - All Checks/The Caribbean - Chest 56 (Small Chest, Port Royal: Seaport)",
    ["The Caribbean - Chest 1 (Small Chest, Huddled Isles)"] = "@The Caribbean - All Checks/The Caribbean - Chest 1 (Small Chest, Huddled Isles)",
    ["The Caribbean - Chest 2 (Small Chest, Huddled Isles: Undersea Cavern)"] = "@The Caribbean - All Checks/The Caribbean - Chest 2 (Small Chest, Huddled Isles: Undersea Cavern)",
    ["The Caribbean - Chest 3 (Small Chest, Huddled Isles: Undersea Cavern)"] = "@The Caribbean - All Checks/The Caribbean - Chest 3 (Small Chest, Huddled Isles: Undersea Cavern)",
    ["The Caribbean - Chest 5 (Small Chest, Isla de los Mastiles: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 5 (Small Chest, Isla de los Mastiles: Underwater Alcove)",
    ["The Caribbean - Chest 7 (Small Chest, Ship's End)"] = "@The Caribbean - All Checks/The Caribbean - Chest 7 (Small Chest, Ship's End)",
    ["The Caribbean - Chest 8 (Small Chest, Ship's End)"] = "@The Caribbean - All Checks/The Caribbean - Chest 8 (Small Chest, Ship's End)",
    ["The Caribbean - Chest 9 (Small Chest, Isla Verdemontana)"] = "@The Caribbean - All Checks/The Caribbean - Chest 9 (Small Chest, Isla Verdemontana)",
    ["The Caribbean - Chest 11 (Small Chest, Sandbar Isle: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 11 (Small Chest, Sandbar Isle: Underwater Alcove)",
    ["The Caribbean - Chest 12 (Small Chest, Exile Island)"] = "@The Caribbean - All Checks/The Caribbean - Chest 12 (Small Chest, Exile Island)",
    ["The Caribbean - Chest 14 (Small Chest, The Gateway of Regret)"] = "@The Caribbean - All Checks/The Caribbean - Chest 14 (Small Chest, The Gateway of Regret)",
    ["The Caribbean - Chest 16 (Small Chest, Horseshoe Island)"] = "@The Caribbean - All Checks/The Caribbean - Chest 16 (Small Chest, Horseshoe Island)",
    ["The Caribbean - Chest 21 (Small Chest, Huddled Isles)"] = "@The Caribbean - All Checks/The Caribbean - Chest 21 (Small Chest, Huddled Isles)",
    ["The Caribbean - Chest 22 (Small Chest, Huddled Isles)"] = "@The Caribbean - All Checks/The Caribbean - Chest 22 (Small Chest, Huddled Isles)",
    ["The Caribbean - Chest 23 (Small Chest, Isla de los Mastiles: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 23 (Small Chest, Isla de los Mastiles: Underwater Alcove)",
    ["The Caribbean - Chest 24 (Small Chest, Isla de los Mastiles: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 24 (Small Chest, Isla de los Mastiles: Underwater Alcove)",
    ["The Caribbean - Chest 45 (Small Chest, The Leviathan)"] = "@The Caribbean - All Checks/The Caribbean - Chest 45 (Small Chest, The Leviathan)",
    ["The Caribbean - Chest 25 (Small Chest, Isla Verdemontana)"] = "@The Caribbean - All Checks/The Caribbean - Chest 25 (Small Chest, Isla Verdemontana)",
    ["The Caribbean - Chest 26 (Small Chest, Sandbar Isle: Underwater)"] = "@The Caribbean - All Checks/The Caribbean - Chest 26 (Small Chest, Sandbar Isle: Underwater)",
    ["The Caribbean - Chest 27 (Small Chest, Sandbar Isle)"] = "@The Caribbean - All Checks/The Caribbean - Chest 27 (Small Chest, Sandbar Isle)",
    ["The Caribbean - Chest 28 (Small Chest, Sandbar Isle: Underwater)"] = "@The Caribbean - All Checks/The Caribbean - Chest 28 (Small Chest, Sandbar Isle: Underwater)",
    ["The Caribbean - Chest 29 (Small Chest, Sandbar Isle: Underwater)"] = "@The Caribbean - All Checks/The Caribbean - Chest 29 (Small Chest, Sandbar Isle: Underwater)",
    ["The Caribbean - Chest 30 (Small Chest, Sandbar Isle: Underwater)"] = "@The Caribbean - All Checks/The Caribbean - Chest 30 (Small Chest, Sandbar Isle: Underwater)",
    ["The Caribbean - Chest 31 (Small Chest, Sandbar Isle: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 31 (Small Chest, Sandbar Isle: Underwater Alcove)",
    ["The Caribbean - Chest 32 (Small Chest, Sandbar Isle: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 32 (Small Chest, Sandbar Isle: Underwater Alcove)",
    ["The Caribbean - Chest 33 (Small Chest, Sandbar Isle: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 33 (Small Chest, Sandbar Isle: Underwater Alcove)",
    ["The Caribbean - Chest 34 (Small Chest, Sandbar Isle: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 34 (Small Chest, Sandbar Isle: Underwater Alcove)",
    ["The Caribbean - Chest 35 (Small Chest, Sandbar Isle: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 35 (Small Chest, Sandbar Isle: Underwater Alcove)",
    ["The Caribbean - Chest 36 (Small Chest, Sandbar Isle: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 36 (Small Chest, Sandbar Isle: Underwater Alcove)",
    ["The Caribbean - Chest 37 (Small Chest, Sandbar Isle: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 37 (Small Chest, Sandbar Isle: Underwater Alcove)",
    ["The Caribbean - Chest 38 (Small Chest, Sandbar Isle: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 38 (Small Chest, Sandbar Isle: Underwater Alcove)",
    ["The Caribbean - Chest 39 (Small Chest, Sandbar Isle: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 39 (Small Chest, Sandbar Isle: Underwater Alcove)",
    ["The Caribbean - Chest 40 (Small Chest, Sandbar Isle: Underwater Alcove)"] = "@The Caribbean - All Checks/The Caribbean - Chest 40 (Small Chest, Sandbar Isle: Underwater Alcove)",
    ["The Caribbean - Chest 41 (Small Chest, Horseshoe Island)"] = "@The Caribbean - All Checks/The Caribbean - Chest 41 (Small Chest, Horseshoe Island)",
    ["The Caribbean - Chest 42 (Small Chest, Horseshoe Island)"] = "@The Caribbean - All Checks/The Caribbean - Chest 42 (Small Chest, Horseshoe Island)",
    ["The Caribbean - Chest 43 (Small Chest, Horseshoe Island)"] = "@The Caribbean - All Checks/The Caribbean - Chest 43 (Small Chest, Horseshoe Island)",
    ["The Caribbean - Chest 44 (Small Chest, Horseshoe Island)"] = "@The Caribbean - All Checks/The Caribbean - Chest 44 (Small Chest, Horseshoe Island)",
    ["The Caribbean - EVENT_KEYBLADE_008 - RandomizedItem"] = "@The Caribbean - All Checks/The Caribbean - EVENT_KEYBLADE_008 - RandomizedItem",
    ["Defeat Anchor Raiders in The Caribbean - Davy Jones' Locker"] = "@The Caribbean - All Checks/Defeat Anchor Raiders in The Caribbean - Davy Jones' Locker",
    ["1st Ship Battle in The Caribbean - Over the Edge"] = "@The Caribbean - All Checks/1st Ship Battle in The Caribbean - Over the Edge",
    ["Defeat Raging Vulture in The Caribbean - The High Seas: Southern Waters"] = "@The Caribbean - All Checks/Defeat Raging Vulture in The Caribbean - The High Seas: Southern Waters",
    ["Defeat Lightning Angler in The Caribbean - The High Seas: Undersea Cavern"] = "@The Caribbean - All Checks/Defeat Lightning Angler in The Caribbean - The High Seas: Undersea Cavern",
    ["Race Luxord to Port Royal in The Caribbean"] = "@The Caribbean - All Checks/Race Luxord to Port Royal in The Caribbean",
    ["2nd Ship Battle in The Caribbean: The High Seas - Port Royal Waters"] = "@The Caribbean - All Checks/2nd Ship Battle in The Caribbean: The High Seas - Port Royal Waters",
    ["3rd Ship Battle in The Caribbean: The High Seas - Forsaken Isle"] = "@The Caribbean - All Checks/3rd Ship Battle in The Caribbean: The High Seas - Forsaken Isle",
    ["Defeat Kraken in The Caribbean - Shipwreck Cove"] = "@The Caribbean - All Checks/Defeat Kraken in The Caribbean - Shipwreck Cove",
    ["Defeat Davy Jones in The Caribbean - Shipwreck Cove"] = "@The Caribbean - All Checks/Defeat Davy Jones in The Caribbean - Shipwreck Cove",
    ["San Fransokyo - Chest 3 (Large Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 3 (Large Chest, The City: South District)",
    ["San Fransokyo - Chest 34 (Large Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 34 (Large Chest, The City: Central District)",
    ["San Fransokyo - Chest 35 (Large Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 35 (Large Chest, The City: South District)",
    ["San Fransokyo - Chest 36 (Large Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 36 (Large Chest, The City: Central District)",
    ["San Fransokyo - Chest 1 (Small Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 1 (Small Chest, The City: Central District)",
    ["San Fransokyo - Chest 2 (Small Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 2 (Small Chest, The City: South District)",
    ["San Fransokyo - Chest 4 (Small Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 4 (Small Chest, The City: South District)",
    ["San Fransokyo - Chest 5 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 5 (Small Chest, The City: North District)",
    ["San Fransokyo - Chest 6 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 6 (Small Chest, The City: North District)",
    ["San Fransokyo - Chest 7 (Small Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 7 (Small Chest, The City: South District)",
    ["San Fransokyo - Chest 8 (Small Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 8 (Small Chest, The City: Central District)",
    ["San Fransokyo - Chest 9 (Small Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 9 (Small Chest, The City: Central District)",
    ["San Fransokyo - Chest 10 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 10 (Small Chest, The City: North District)",
    ["San Fransokyo - Chest 11 (Small Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 11 (Small Chest, The City: South District)",
    ["San Fransokyo - Chest 12 (Small Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 12 (Small Chest, The City: South District)",
    ["San Fransokyo - Chest 13 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 13 (Small Chest, The City: North District)",
    ["San Fransokyo - Chest 14 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 14 (Small Chest, The City: North District)",
    ["San Fransokyo - Chest 15 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 15 (Small Chest, The City: North District)",
    ["San Fransokyo - Chest 16 (Small Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 16 (Small Chest, The City: Central District)",
    ["San Fransokyo - Chest 17 (Small Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 17 (Small Chest, The City: Central District)",
    ["San Fransokyo - Chest 18 (Small Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 18 (Small Chest, The City: South District)",
    ["San Fransokyo - Chest 19 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 19 (Small Chest, The City: North District)",
    ["San Fransokyo - Chest 20 (Small Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 20 (Small Chest, The City: South District)",
    ["San Fransokyo - Chest 21 (Small Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 21 (Small Chest, The City: South District)",
    ["San Fransokyo - Chest 22 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 22 (Small Chest, The City: North District)",
    ["San Fransokyo - Chest 23 (Small Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 23 (Small Chest, The City: Central District)",
    ["San Fransokyo - Chest 24 (Small Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 24 (Small Chest, The City: Central District)",
    ["San Fransokyo - Chest 25 (Small Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 25 (Small Chest, The City: Central District)",
    ["San Fransokyo - Chest 26 (Small Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 26 (Small Chest, The City: Central District)",
    ["San Fransokyo - Chest 27 (Small Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 27 (Small Chest, The City: South District)",
    ["San Fransokyo - Chest 28 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 28 (Small Chest, The City: North District)",
    ["San Fransokyo - Chest 29 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 29 (Small Chest, The City: North District)",
    ["San Fransokyo - Chest 30 (Small Chest, The City: Central District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 30 (Small Chest, The City: Central District)",
    ["San Fransokyo - Chest 31 (Small Chest, The City: South District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 31 (Small Chest, The City: South District)",
    ["San Fransokyo - Chest 32 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 32 (Small Chest, The City: North District)",
    ["San Fransokyo - Chest 33 (Small Chest, The City: North District)"] = "@San Fransokyo - All Checks/San Fransokyo - Chest 33 (Small Chest, The City: North District)",
    ["San Fransokyo - EVENT_009 - RandomizedItem"] = "@San Fransokyo - All Checks/San Fransokyo - EVENT_009 - RandomizedItem",
    ["San Fransokyo - EVENT_KEYBLADE_009 - RandomizedItem"] = "@San Fransokyo - All Checks/San Fransokyo - EVENT_KEYBLADE_009 - RandomizedItem",
    ["San Fransokyo - EVENT_HEARTBINDER_004 - RandomizedItem"] = "@San Fransokyo - All Checks/San Fransokyo - EVENT_HEARTBINDER_004 - RandomizedItem",
    ["San Fransokyo - EVENT_KEYITEM_002 - RandomizedItem"] = "@San Fransokyo - All Checks/San Fransokyo - EVENT_KEYITEM_002 - RandomizedItem",
    ["Defeat Metal Troll in San Fransokyo: The Bridge"] = "@San Fransokyo - All Checks/Defeat Metal Troll in San Fransokyo: The Bridge",
    ["Meet Big Hero 6 in San Fransokyo - Hiro's Garage"] = "@San Fransokyo - All Checks/Meet Big Hero 6 in San Fransokyo - Hiro's Garage",
    ["The City Heartless at Hiro's indicator in San Fransokyo - The City (Day)"] = "@San Fransokyo - All Checks/The City Heartless at Hiro's indicator in San Fransokyo - The City (Day)",
    ["Defeat Catastrochorus in San Fransokyo - The City (Day)"] = "@San Fransokyo - All Checks/Defeat Catastrochorus in San Fransokyo - The City (Day)",
    ["Rescue Big Hero 6 from Darkubes in San Fransokyo - The City (Night)"] = "@San Fransokyo - All Checks/Rescue Big Hero 6 from Darkubes in San Fransokyo - The City (Night)",
    ["Defeat Darkubes in San Fransokyo - The City (Night)"] = "@San Fransokyo - All Checks/Defeat Darkubes in San Fransokyo - The City (Night)",
    ["Defeat Dark Baymax in San Fransokyo - The City (Day)"] = "@San Fransokyo - All Checks/Defeat Dark Baymax in San Fransokyo - The City (Day)",
    ["Keyblade Graveyard - Chest 1 (Large Chest, The Badlands)"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 1 (Large Chest, The Badlands)",
    ["Keyblade Graveyard - Chest 3 (Large Chest, The Skein of Severance: Trail of Valediction)"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 3 (Large Chest, The Skein of Severance: Trail of Valediction)",
    ["Keyblade Graveyard - Chest 4 (Small Chest, The Skein of Severance: Trail of Valediction)"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 4 (Small Chest, The Skein of Severance: Trail of Valediction)",
    ["Keyblade Graveyard - Chest 5 (Small Chest, The Skein of Severance: Trail of Valediction)"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 5 (Small Chest, The Skein of Severance: Trail of Valediction)",
    ["Keyblade Graveyard - Chest 6 (Small Chest, The Skein of Severance: Twist of Isolation)"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 6 (Small Chest, The Skein of Severance: Twist of Isolation)",
    ["Keyblade Graveyard - Chest 2 (Small Chest, The Badlands)"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - Chest 2 (Small Chest, The Badlands)",
    ["The Final World - Chest 1 (Large Chest, The Final World)"] = "@Keyblade Graveyard - All Checks/The Final World - Chest 1 (Large Chest, The Final World)",
    ["Keyblade Graveyard - EVENT_KEYBLADE_011 - RandomizedItem"] = "@Keyblade Graveyard - All Checks/Keyblade Graveyard - EVENT_KEYBLADE_011 - RandomizedItem",
    ["Defeat Lich in The Final World (San Fransokyo - The City: Central District)"] = "@Keyblade Graveyard - All Checks/Defeat Lich in The Final World (San Fransokyo - The City: Central District)",
    ["10,000 Enemy Fight in The Keyblade Graveyard: The Badlands a"] = "@Keyblade Graveyard - All Checks/10,000 Enemy Fight in The Keyblade Graveyard: The Badlands a",
    ["Defeat Demon Tide in The Keyblade Graveyard: The Badlands"] = "@Keyblade Graveyard - All Checks/Defeat Demon Tide in The Keyblade Graveyard: The Badlands",
    ["Defeat Xigbar & Dark Riku in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction"] = "@Keyblade Graveyard - All Checks/Defeat Xigbar & Dark Riku in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction",
    ["Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction"] = "@Keyblade Graveyard - All Checks/Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard - The Skein of Severance: Trail of Valediction",
    ["Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation"] = "@Keyblade Graveyard - All Checks/Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation",
    ["Defeat Saïx in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation"] = "@Keyblade Graveyard - All Checks/Defeat Saïx in The Keyblade Graveyard - The Skein of Severance: Twist of Isolation",
    ["Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard: The Skein of Severance - Tower of Endings"] = "@Keyblade Graveyard - All Checks/Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard: The Skein of Severance - Tower of Endings",
    ["10,000 Enemy Fight in The Keyblade Graveyard: The Badlands b"] = "@Keyblade Graveyard - All Checks/10,000 Enemy Fight in The Keyblade Graveyard: The Badlands b",
    ["After collecting 222 Soras in The Final World"] = "@Keyblade Graveyard - All Checks/After collecting 222 Soras in The Final World",
    ["After collecting 333 Soras in The Final World"] = "@Keyblade Graveyard - All Checks/After collecting 333 Soras in The Final World",
    ["Defeat Anti-Aqua in The Dark World - The Realm of Darkness"] = "@Dark World - All Checks/Defeat Anti-Aqua in The Dark World - The Realm of Darkness",
    ["Defeat Dark Inferno χ in The Keyblade Graveyard (Re:Mind)"] = "@Re Mind - All Checks/Defeat Dark Inferno χ in The Keyblade Graveyard (Re:Mind)",
    ["Defeat Anti-Aqua in The Keyblade Graveyard (Re:Mind)"] = "@Re Mind - All Checks/Defeat Anti-Aqua in The Keyblade Graveyard (Re:Mind)",
    ["Defeat Terra-Xehanort in The Keyblade Graveyard (Re:Mind)"] = "@Re Mind - All Checks/Defeat Terra-Xehanort in The Keyblade Graveyard (Re:Mind)",
    ["Defeat Xigbar & Dark Riku in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction"] = "@Re Mind - All Checks/Defeat Xigbar & Dark Riku in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction",
    ["Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction"] = "@Re Mind - All Checks/Defeat Luxord, Marluxia, & Larxene in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Trail of Valediction",
    ["Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation"] = "@Re Mind - All Checks/Defeat Vanitas & Terra-Xehanort in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation",
    ["After the Saïx boss battle in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation"] = "@Re Mind - All Checks/After the Saïx boss battle in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Twist of Isolation",
    ["Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Tower of Endings"] = "@Re Mind - All Checks/Defeat Young Xehanort, Ansem, & Xemnas in The Keyblade Graveyard (Re:Mind) - The Skein of Severance: Tower of Endings",
    ["Defeat Darkside in Scala ad Caelum (Re:Mind) - Breezy Quarter"] = "@Re Mind - All Checks/Defeat Darkside in Scala ad Caelum (Re:Mind) - Breezy Quarter",
    ["Defeat Armored Xehanort in Re:Mind"] = "@Re Mind - All Checks/Defeat Armored Xehanort in Re:Mind",
    ["Re Mind - Chest 1 (Large Chest, The Stairway to the Sky)"] = "@Re Mind - All Checks/Re Mind - Chest 1 (Large Chest, The Stairway to the Sky)",
    ["Re Mind - Chest 2 (Large Chest, Breezy Quarter)"] = "@Re Mind - All Checks/Re Mind - Chest 2 (Large Chest, Breezy Quarter)",
    ["Re Mind - Chest 3 (Small Chest, Breezy Quarter)"] = "@Re Mind - All Checks/Re Mind - Chest 3 (Small Chest, Breezy Quarter)",
    ["Re Mind - Chest 4 (Small Chest, Breezy Quarter)"] = "@Re Mind - All Checks/Re Mind - Chest 4 (Small Chest, Breezy Quarter)",
    ["Re Mind - Chest 5 (Small Chest, Breezy Quarter)"] = "@Re Mind - All Checks/Re Mind - Chest 5 (Small Chest, Breezy Quarter)",
    ["Re Mind - Chest 6 (Small Chest, Breezy Quarter)"] = "@Re Mind - All Checks/Re Mind - Chest 6 (Small Chest, Breezy Quarter)",
    ["Re Mind - Chest 7 (Small Chest, Breezy Quarter)"] = "@Re Mind - All Checks/Re Mind - Chest 7 (Small Chest, Breezy Quarter)",
    ["Re Mind - Chest 8 (Small Chest, Breezy Quarter)"] = "@Re Mind - All Checks/Re Mind - Chest 8 (Small Chest, Breezy Quarter)",
    ["Re Mind - Chest 9 (Small Chest, Breezy Quarter)"] = "@Re Mind - All Checks/Re Mind - Chest 9 (Small Chest, Breezy Quarter)",
    -- Data Battles (under Radiant Garden overworld node)
    ["Data Battles - EVENT_DATAB_001 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_001 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_002 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_002 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_003 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_003 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_004 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_004 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_005 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_005 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_006 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_006 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_007 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_007 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_008 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_008 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_009 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_009 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_010 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_010 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_011 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_011 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_012 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_012 - RandomizedItem",
    ["Data Battles - EVENT_DATAB_013 - RandomizedItem"] = "@Radiant Garden - All Checks/Data Battles - EVENT_DATAB_013 - RandomizedItem",
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
    ["Lucky Emblems - Milestone 2"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 2",
    ["Lucky Emblems - Milestone 3"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 3",
    ["Lucky Emblems - Milestone 4"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 4",
    ["Lucky Emblems - Milestone 5"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 5",
    ["Lucky Emblems - Milestone 6"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 6",
    ["Lucky Emblems - Milestone 7"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 7",
    ["Lucky Emblems - Milestone 8"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 8",
    ["Lucky Emblems - Milestone 9"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 9",
    ["Lucky Emblems - Milestone 10"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 10",
    ["Lucky Emblems - Milestone 11"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 11",
    ["Lucky Emblems - Milestone 12"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 12",
    ["Lucky Emblems - Milestone 13"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 13",
    ["Lucky Emblems - Milestone 14"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 14",
    ["Lucky Emblems - Milestone 15"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 15",
    ["Lucky Emblems - Milestone 16"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 16",
    ["Lucky Emblems - Milestone 17"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 17",
    ["Lucky Emblems - Milestone 18"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 18",
    ["Lucky Emblems - Milestone 19"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 19",
    ["Lucky Emblems - Milestone 20"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 20",
    ["Lucky Emblems - Milestone 21"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 21",
    ["Lucky Emblems - Milestone 22"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 22",
    ["Lucky Emblems - Milestone 23"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 23",
    ["Lucky Emblems - Milestone 24"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 24",
    ["Lucky Emblems - Milestone 25"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 25",
    ["Lucky Emblems - Milestone 26"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 26",
    ["Lucky Emblems - Milestone 27"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 27",
    ["Lucky Emblems - Milestone 28"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 28",
    ["Lucky Emblems - Milestone 29"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 29",
    ["Lucky Emblems - Milestone 30"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 30",
    ["Lucky Emblems - Milestone 31"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 31",
    ["Lucky Emblems - Milestone 32"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 32",
    ["Lucky Emblems - Milestone 33"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 33",
    ["Lucky Emblems - Milestone 34"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 34",
    ["Lucky Emblems - Milestone 35"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 35",
    ["Lucky Emblems - Milestone 36"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 36",
    ["Lucky Emblems - Milestone 37"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 37",
    ["Lucky Emblems - Milestone 38"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 38",
    ["Lucky Emblems - Milestone 39"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 39",
    ["Lucky Emblems - Milestone 40"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 40",
    ["Lucky Emblems - Milestone 41"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 41",
    ["Lucky Emblems - Milestone 42"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 42",
    ["Lucky Emblems - Milestone 43"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 43",
    ["Lucky Emblems - Milestone 44"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 44",
    ["Lucky Emblems - Milestone 45"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 45",
    ["Lucky Emblems - Milestone 46"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 46",
    ["Lucky Emblems - Milestone 47"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 47",
    ["Lucky Emblems - Milestone 48"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 48",
    ["Lucky Emblems - Milestone 49"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 49",
    ["Lucky Emblems - Milestone 50"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 50",
    ["Lucky Emblems - Milestone 51"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 51",
    ["Lucky Emblems - Milestone 52"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 52",
    ["Lucky Emblems - Milestone 53"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 53",
    ["Lucky Emblems - Milestone 54"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 54",
    ["Lucky Emblems - Milestone 55"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 55",
    ["Lucky Emblems - Milestone 56"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 56",
    ["Lucky Emblems - Milestone 57"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 57",
    ["Lucky Emblems - Milestone 58"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 58",
    ["Lucky Emblems - Milestone 59"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 59",
    ["Lucky Emblems - Milestone 60"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 60",
    ["Lucky Emblems - Milestone 61"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 61",
    ["Lucky Emblems - Milestone 62"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 62",
    ["Lucky Emblems - Milestone 63"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 63",
    ["Lucky Emblems - Milestone 64"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 64",
    ["Lucky Emblems - Milestone 65"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 65",
    ["Lucky Emblems - Milestone 66"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 66",
    ["Lucky Emblems - Milestone 67"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 67",
    ["Lucky Emblems - Milestone 68"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 68",
    ["Lucky Emblems - Milestone 69"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 69",
    ["Lucky Emblems - Milestone 70"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 70",
    ["Lucky Emblems - Milestone 71"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 71",
    ["Lucky Emblems - Milestone 72"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 72",
    ["Lucky Emblems - Milestone 73"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 73",
    ["Lucky Emblems - Milestone 74"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 74",
    ["Lucky Emblems - Milestone 75"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 75",
    ["Lucky Emblems - Milestone 76"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 76",
    ["Lucky Emblems - Milestone 77"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 77",
    ["Lucky Emblems - Milestone 78"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 78",
    ["Lucky Emblems - Milestone 79"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 79",
    ["Lucky Emblems - Milestone 80"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 80",
    ["Lucky Emblems - Milestone 81"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 81",
    ["Lucky Emblems - Milestone 82"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 82",
    ["Lucky Emblems - Milestone 83"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 83",
    ["Lucky Emblems - Milestone 84"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 84",
    ["Lucky Emblems - Milestone 85"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 85",
    ["Lucky Emblems - Milestone 86"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 86",
    ["Lucky Emblems - Milestone 87"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 87",
    ["Lucky Emblems - Milestone 88"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 88",
    ["Lucky Emblems - Milestone 89"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 89",
    ["Lucky Emblems - Milestone 90"] = "@Lucky Emblems - All Checks/Lucky Emblems - Milestone 90",
}

-- A section may be mirrored by several Overworld pins, so OVERWORLD_SECTION_MAP
-- values are either one code or a list of them. Always iterate.
local function forEachOverworldMirror(section_name, apply)
    if not section_name then return end
    local codes = OVERWORLD_SECTION_MAP[section_name]
    if not codes then return end
    if type(codes) == "string" then codes = {codes} end
    for _, code in ipairs(codes) do
        local obj = Tracker:FindObjectForCode(code)
        if obj then apply(obj) end
    end
end


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

-- Photographed Lucky Emblems. The KH3 client (Client.py's
-- build_kh3_lucky_emblem_sync_messages) merges every capture into this DataStorage
-- key as {"<global_id>": true, ...} and resends its whole set on each reconnect,
-- so the server value is the full history: the pack only has to Get it on
-- connect and SetNotify it for live updates. The client's Bounce carries the same
-- ids but is lost while PopTracker is closed, so it is not used here.
LUCKY_EMBLEMS_ID = nil
LUCKY_EMBLEM_SPOT_COUNT = 90

-- Chestsanity (apworld KeybladeChests.assign_keyblade_chests): each chest of a
-- randomized world needs a keyblade drawn by the seed. The KH3 wire slot_data
-- carries it as a per-location override, location_catalog.entries =
-- [[ap_id, assignment_index, changes, removed], ...], with changes holding
-- keyblade_chest_keyblade (item name) and keyblade_chest_native (true when it is
-- the chest's own world keyblade, which Rules.py does not require).
function LoadChestKeyblades(slot_data)
    CHEST_KEYBLADE = {}
    local catalog = type(slot_data) == "table" and slot_data["location_catalog"]
    local entries = type(catalog) == "table" and catalog["entries"] or {}
    local count = 0
    for _, entry in ipairs(entries) do
        local changes = type(entry) == "table" and entry[3]
        local blade = type(changes) == "table" and changes["keyblade_chest_keyblade"]
        if blade and changes["keyblade_chest_native"] ~= true then
            local mapping = ITEM_MAPPING_BY_NAME[blade]
            if mapping then
                CHEST_KEYBLADE[tonumber(entry[1])] = mapping.code
                count = count + 1
            else
                print(string.format("LoadChestKeyblades: no item code for %s", tostring(blade)))
            end
        end
    end
    print(string.format("LoadChestKeyblades: %d chests need a foreign keyblade", count))
end

-- Music chest Song Bonuses (MelodyOfMemory.music_chest_bonus_locations): a chest's
-- bonus is a check of the seed when its id (chest id + MUSIC_CHEST_BONUS_ID_OFFSET)
-- is among location_catalog.entries.
local SONG_BONUS_ID_MIN = 1263022848 + 0x100000
local SONG_BONUS_ID_MAX = 1263022848 + 0x200000
function LoadSongBonuses(slot_data)
    SONG_BONUS = {}
    local catalog = type(slot_data) == "table" and slot_data["location_catalog"]
    local count = 0
    for _, entry in ipairs((type(catalog) == "table" and catalog["entries"]) or {}) do
        local ap_id = type(entry) == "table" and tonumber(entry[1])
        if ap_id and ap_id >= SONG_BONUS_ID_MIN and ap_id < SONG_BONUS_ID_MAX then
            SONG_BONUS[ap_id] = true
            count = count + 1
        end
    end
    print(string.format("LoadSongBonuses: %d music chest Song Bonuses", count))
end

-- Melody of Memory in apworld 0.17: every selected song opens a music chest (an
-- authored Melody Chest, music_chest_kind "additional", or a converted vanilla
-- chest, "vanilla"); its row in location_catalog.entries carries mom_song_id.
-- The song's own section (MOM_LOCATION_ID_BASE + song id, a 0.16 song-clear id)
-- then mirrors that chest: visible, in logic with it (MOM_SONG_CHEST), and
-- cleared by the chest's Song Bonus, or by the chest itself without bonus checks
-- (MOM_SONG_BY_CHECK).
MOM_SONG_BY_CHECK = {}
MOM_SONG_LOCATION_BASE = 1263153920
function LoadMusicChests(slot_data)
    MOM_SONG_CHEST = {}
    MOM_SONG_BY_CHECK = {}
    local catalog = type(slot_data) == "table" and slot_data["location_catalog"]
    local count = 0
    for _, entry in ipairs((type(catalog) == "table" and catalog["entries"]) or {}) do
        local changes = type(entry) == "table" and entry[3]
        local song = type(changes) == "table" and changes["music_chest_kind"] and tonumber(changes["mom_song_id"])
        local chest_id = song and tonumber(entry[1])
        local mapping = chest_id and LOCATION_MAPPING[chest_id]
        if mapping then
            song = math.floor(song)
            MOM_SONG_CHEST[song] = mapping.code
            local bonus_id = chest_id + 0x100000
            MOM_SONG_BY_CHECK[SONG_BONUS[bonus_id] and bonus_id or chest_id] = song
            count = count + 1
        end
    end
    print(string.format("LoadMusicChests: %d songs open a music chest", count))
end

function ApplyLuckyEmblems(value)
    local captured = type(value) == "table" and value or {}
    for global_id = 1, LUCKY_EMBLEM_SPOT_COUNT do
        local obj = Tracker:FindObjectForCode(string.format("lucky_emblem_spot_%03d", global_id))
        if obj then
            obj.Active = captured[tostring(global_id)] == true
        end
    end
end

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
        forEachOverworldMirror(section_name, function(ow_obj)
            ow_obj.Highlight = highlight
        end)
    else
        print(string.format("UpdateHints: location %s not in LOCATION_MAPPING", locationID))
    end
end

function OnNotify(key, value, old_value)
    if key == LUCKY_EMBLEMS_ID then
        ApplyLuckyEmblems(value)
    elseif value ~= old_value and key == HINTS_ID then
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
    if key == LUCKY_EMBLEMS_ID then
        ApplyLuckyEmblems(value)
    elseif key == HINTS_ID then
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
    elseif mapping.type == "consumable_max" then
        obj.AcquiredCount = mapping.max or obj.AcquiredCount
    end
    -- An item may also switch on a second toggle (Endymion: Misty Stream ship + its own gate).
    if mapping.also then
        local also = Tracker:FindObjectForCode(mapping.also)
        if also then also.Active = true end
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
    forEachOverworldMirror(section_name, function(ow_section)
        ow_section.AvailableChestCount = 0
    end)

    -- The Melody of Memory song whose music chest this check belongs to.
    local song = MOM_SONG_BY_CHECK[location_id]
    if song and LOCATION_MAPPING[MOM_SONG_LOCATION_BASE + song] then
        onLocation(MOM_SONG_LOCATION_BASE + song, nil)
    end
end

-- Melody of Memory song ids are native Music IDs, not a 0..127 range: the 128
-- songs are spread over 0..206 with gaps. Deriving them from LOCATION_MAPPING
-- keeps this in step with the generated catalogue; MoM is the only id space
-- above MOM_LOCATION_ID_BASE, so the test is unambiguous.
local MOM_LOCATION_ID_BASE = 1263153920
-- Song ids stay below 256; the 8 authored Melody Chests follow at base + 257..264.
local MOM_SONG_ID_SPAN = 256
local MUSIC_CHEST_PLACEMENT_BY_ID = {
    [1263154177] = "MOM_CHEST_001", [1263154178] = "MOM_CHEST_002",
    [1263154179] = "MOM_CHEST_003", [1263154180] = "MOM_CHEST_004",
    [1263154181] = "MOM_CHEST_005", [1263154182] = "MOM_CHEST_006",
    [1263154183] = "MOM_CHEST_007", [1263154184] = "MOM_CHEST_008",
}
local _mom_song_ids = nil
local function momSongIds()
    if _mom_song_ids == nil then
        _mom_song_ids = {}
        for ap_id, _ in pairs(LOCATION_MAPPING) do
            if ap_id >= MOM_LOCATION_ID_BASE and ap_id < MOM_LOCATION_ID_BASE + MOM_SONG_ID_SPAN then
                _mom_song_ids[#_mom_song_ids + 1] = ap_id - MOM_LOCATION_ID_BASE
            end
        end
        table.sort(_mom_song_ids)
    end
    return _mom_song_ids
end

function autoFill(slot_data)
    if not slot_data then return end

    -- Helper: set a toggle item active state
    local function setToggle(code, active)
        local obj = Tracker:FindObjectForCode(code)
        if obj then obj.Active = active end
    end

    -- Helper: set a progressive settings item's stage (0-based)
    local function setStage(code, stage)
        local obj = Tracker:FindObjectForCode(code)
        if obj then obj.CurrentStage = stage end
    end

    -- Helper: set a consumable settings item's current amount
    local function setAmount(code, amount)
        local obj = Tracker:FindObjectForCode(code)
        if obj then obj.AcquiredCount = amount end
    end

    -- Controller unlocks the seed grants up front. These are top-level slot_data
    -- keys straight off the options (see KH3World.fill_slot_data's as_dict list);
    -- kh3_randomizer holds pools/exceptions/limiters/qol/runtime/hint, never a
    -- "controller_unlocks" block, so reading one there always yielded nil and
    -- switched every unlock off on connect.
    local function startsWith(key)
        local value = slot_data[key]
        return value ~= nil and value ~= false and value ~= 0
    end
    setToggle("unlock_wall_run",        startsWith("start_with_wall_run"))
    setToggle("unlock_magic",           startsWith("start_with_magic"))
    setToggle("unlock_attraction_flow", startsWith("start_with_attraction_flow"))
    -- Airstep=true means Air Slide works via controller (always available)
    -- Activate unlock_airstep; ability_air_slide tracks the actual item
    setToggle("unlock_airstep",         startsWith("start_with_airstep"))
    -- Links only gates the Heartbinder routes; the Heartbinders themselves
    -- are still separate items.
    setToggle("unlock_links",           startsWith("start_with_links"))

    -- Default Base Abilities (RANDOMIZER_EXCEPTION_NAMES key "Default Base
    -- Abilities" under kh3_randomizer.exceptions): when on, the randomizer
    -- keeps Block/Dodge Roll/Pole Spin (among others) as innate starting
    -- abilities instead of adding them to the AP item pool, so no
    -- "Ability: Block"/"Ability: Dodge Roll"/"Ability: Pole Spin" item is
    -- ever sent for this slot. Without this, logic that requires them (e.g.
    -- keyblade unlock routes) would stay permanently gated. Only the entries of
    -- the apworld's DEFAULT_BASE_ABILITY_CHRINIT_FIELDS that this pack tracks as
    -- items are handled here (the rest -- Scan, Aerial Dodge, Superslide, ... --
    -- have no item and no logic).
    local exceptions = (slot_data["kh3_randomizer"] and slot_data["kh3_randomizer"]["exceptions"]) or {}
    local default_base_abilities = exceptions["Default Base Abilities"] == true
    if default_base_abilities then
        setToggle("ability_block", true)
        setToggle("ability_dodge_roll", true)
        setToggle("ability_pole_spin", true)
        setToggle("ability_air_slide", true)
        setToggle("ability_wall_kick", true)
    end

    -- Stylesanity (0 = off, 1 = on; apworld default on). On: every keyblade
    -- needs its own "Unlock Style: ..." item. Off: Sora starts with
    -- Unlock: Style Change owned, so it is ticked from the start.
    local stylesanity = slot_data["stylesanity"]
    if stylesanity == nil then stylesanity = 1 end
    stylesanity = (stylesanity ~= false and stylesanity ~= 0) and 1 or 0
    setToggle("unlock_style_change", stylesanity == 0)
    setStage("style_change_setting", stylesanity)

    -- Keyblade Levels (0 = start at max, 1 = shuffled, 2 = keyblade upgrade sanity;
    -- the apworld default is shuffled). Drives the level counters and the
    -- Moogle Workshop upgrade rules.
    setStage("keyblade_levels_setting", slot_data["keyblade_levels"] or 1)

    -- World on/off flags -> Settings menu stage. The apworld dropped the old
    -- boolean "include_*" slot_data keys; each world's checks now live behind
    -- a pool mode (KH3LocationPoolMode) under slot_data.kh3_randomizer.pools,
    -- keyed by the pool's display name.
    --
    -- Since apworld 0.15.4 (still so in 0.17.10), KH3LocationPoolMode only offers randomize (2) and
    -- junk (3) -- option_vanilla (1) was removed from every pool that uses this
    -- enum (Data.filter_locations_for_options no longer excludes their
    -- locations at all), so poolHasChecks below is now always true for them.
    -- It's kept as a defensive default rather than hardcoded, in case a future
    -- apworld version reintroduces a hide-this-world's-checks pool value.
    -- The Olympus Coliseum mod pool is the one remaining exception: it kept
    -- its own separate option_off = VANILLA_LOCATION_POOL_VALUE (still 1),
    -- handled below.
    local VANILLA_POOL_MODE = 1
    local pools = (slot_data["kh3_randomizer"] and slot_data["kh3_randomizer"]["pools"]) or {}
    local function poolHasChecks(pool_name)
        -- Default to "randomize" (2) when absent, matching the option's own default.
        local mode = pools[pool_name] or 2
        return mode ~= VANILLA_POOL_MODE
    end

    setStage("battlegates_setting",        poolHasChecks("Battlegates") and 1 or 0)
    setStage("remind_setting",             poolHasChecks("Re+Mind") and 1 or 0)
    setStage("lucky_emblems_setting",      poolHasChecks("Lucky Emblems") and 1 or 0)
    setStage("keyblade_graveyard_setting", poolHasChecks("Keyblade Graveyard") and 1 or 0)
    setStage("radiant_garden_setting",     poolHasChecks("Data Battle Rewards") and 1 or 0)

    -- The per-world pools. Keys are RANDOMIZER_POOL_NAMES display names from
    -- the apworld's Options.py.
    local WORLD_POOL_SETTINGS = {
        {"olympus_setting",           "Olympus"},
        {"twilight_town_setting",     "Twilight Town"},
        {"toy_box_setting",           "Toy Box"},
        {"kingdom_of_corona_setting", "Kingdom of Corona"},
        {"monstropolis_setting",      "Monstropolis"},
        {"arendelle_setting",         "Arendelle"},
        {"the_caribbean_setting",     "The Caribbean"},
        {"san_fransokyo_setting",     "San Fransokyo"},
        {"hundred_acre_wood_setting",  "100 Acre Wood"},
        {"dark_world_setting",        "Dark World"},
        {"unreality_setting",         "Unreality"},
        -- Level Ups are the "Sora" pool in the randomizer's naming.
        {"level_ups_setting",         "Sora"},
    }
    for _, entry in ipairs(WORLD_POOL_SETTINGS) do
        setStage(entry[1], poolHasChecks(entry[2]) and 1 or 0)
    end

    -- Gummi space is a base-game toggle, not a pool: top-level include_space
    -- (0 = off, 1 = on; the apworld default is off).
    setStage("space_setting", (slot_data["include_space"] or 0) == 1 and 1 or 0)
    -- Portal Unlocks (0 = keyblades, 1 = party members): which items open the worlds,
    -- see portal_open in logic.lua.
    setStage("portal_unlocks_setting", (slot_data["portal_unlocks"] or 0) == 1 and 1 or 0)
    -- Chestsanity is shown only: the per-chest keyblades come from LoadChestKeyblades.
    setStage("chestsanity_setting", (slot_data["chestsanity"] or 0) == 1 and 1 or 0)
    -- Optional space checks (both off by default): Heartless / Builder / Special
    -- Weapon Authority milestones, and the Schwarzgeist / Omega Machina rewards.
    -- Gummi Ship Completionist needs both.
    setStage("space_grindy_setting", (slot_data["include_grindy_space_missions"] or 0) == 1 and 1 or 0)
    setStage("space_superbosses_setting", (slot_data["include_space_superbosses"] or 0) == 1 and 1 or 0)

    -- Olympus Coliseum is a third-party pool: it is NOT in
    -- RANDOMIZER_POOL_NAMES, so it never appears under kh3_randomizer.pools.
    -- It ships as a top-level slot_data key instead.
    setStage("olympus_coliseum_setting",
             (slot_data["olympus_coliseum_pool"] or 2) ~= VANILLA_POOL_MODE and 1 or 0)

    -- Classic Kingdom Checks (top-level key, 0 = off, 1 = high score)
    setStage("classic_kingdom_setting", (slot_data["classic_kingdom_checks"] or 0) ~= 0 and 1 or 0)

    -- Ingredients (top-level key, 0 = off, 1 = ingredientsanity, 2 = ingredientsanity+).
    -- The stage indices line up with the option's own values.
    setStage("ingredients_setting", slot_data["ingredients"] or 0)

    -- Moogle Workshop pools (top-level keys). Unlike the pools above these still
    -- have a vanilla mode, and vanilla (the default) adds no checks at all.
    setStage("synthesis_setting",
             (slot_data["synthesis_pool"] or VANILLA_POOL_MODE) ~= VANILLA_POOL_MODE and 1 or 0)
    setStage("photo_missions_setting",
             (slot_data["photo_missions_pool"] or VANILLA_POOL_MODE) ~= VANILLA_POOL_MODE and 1 or 0)
    setStage("keyblade_upgrades_setting",
             (slot_data["keyblade_upgrade_rewards_pool"] or VANILLA_POOL_MODE) ~= VANILLA_POOL_MODE and 1 or 0)

    -- Minigame max AP rank (top-level keys, 0 = junk, 1..4 = D..A, matching the
    -- stage indices). It never removes checks, only restricts rewards above the
    -- cap to filler/traps. Seeds without the key keep the apworld's A default.
    local MINIGAME_RANK_KEYS = {
        {"verum_rex_rank",      "verum_rex_max_rank"},
        {"festival_dance_rank", "festival_dance_max_rank"},
        {"frozen_slider_rank",  "frozen_slider_max_rank"},
        {"flash_tracer_a_rank", "flash_tracer_course_a_max_rank"},
        {"flash_tracer_b_rank", "flash_tracer_course_b_max_rank"},
    }
    for _, entry in ipairs(MINIGAME_RANK_KEYS) do
        setStage(entry[1], slot_data[entry[2]] or 4)
    end

    -- Melody of Memory. A seed's songs are drawn at random from the 128-song
    -- catalog (MelodyOfMemory.select_music_chests), so the count option alone
    -- can't say which ones are in play -- the bridge rows can.
    setAmount("mc_limit", slot_data["music_chest_count"] or 0)

    -- Up to 8 of those songs are reassigned from their menu clear to one of
    -- the 8 authored world chests (MelodyOfMemory.placed_music_chest). Their
    -- bridge row keeps type "melody_of_memory" (song_location's type is never
    -- overwritten) but carries music_chest_kind "additional" and a
    -- music_chest_placement_id -- such a row must NOT also light up the
    -- song's menu-clear section below, since that check no longer exists;
    -- only the chest at its placement does.
    local MUSIC_CHEST_PLACEMENT_CODES = {
        MOM_CHEST_001 = "mc_chest_olympus",
        MOM_CHEST_002 = "mc_chest_twilight_town",
        MOM_CHEST_003 = "mc_chest_monstropolis",
        MOM_CHEST_004 = "mc_chest_kingdom_of_corona",
        MOM_CHEST_005 = "mc_chest_the_caribbean",
        MOM_CHEST_006 = "mc_chest_toy_box",
        MOM_CHEST_007 = "mc_chest_san_fransokyo",
        MOM_CHEST_008 = "mc_chest_arendelle",
    }
    local mom_active = {}
    local chest_active = {}
    -- apworld 0.17 wire slot_data: the seed's rows are references to the bundled
    -- catalog (location_catalog.entries = [[ap_id, ...], ...]) and bridge.locations
    -- is gone. A song whose clear is a check keeps MOM_LOCATION_ID_BASE + song_id;
    -- a song moved into an authored chest takes the chest's id instead.
    local catalog = slot_data["location_catalog"]
    for _, entry in ipairs((type(catalog) == "table" and catalog["entries"]) or {}) do
        local ap_id = type(entry) == "table" and tonumber(entry[1])
        if ap_id and ap_id >= MOM_LOCATION_ID_BASE and ap_id < MOM_LOCATION_ID_BASE + MOM_SONG_ID_SPAN then
            mom_active[tostring(ap_id - MOM_LOCATION_ID_BASE)] = true
        elseif ap_id and MUSIC_CHEST_PLACEMENT_BY_ID[ap_id] then
            chest_active[MUSIC_CHEST_PLACEMENT_BY_ID[ap_id]] = true
        end
    end
    -- 0.17 songs open a music chest; their section mirrors it (LoadMusicChests).
    for song_id, _ in pairs(MOM_SONG_CHEST) do
        mom_active[tostring(song_id)] = true
    end
    -- Offline only: show every possible Song Bonus (the seed's are known once connected).
    setStage("song_bonus_setting", 0)
    -- Expanded slot_data of older apworlds.
    local bridge = slot_data["bridge"]
    for _, row in ipairs((bridge and bridge["locations"]) or {}) do
        if row["type"] == "melody_of_memory" then
            if row["music_chest_kind"] == "additional" then
                if row["music_chest_placement_id"] then
                    chest_active[row["music_chest_placement_id"]] = true
                end
            elseif row["mom_song_id"] then
                mom_active[tostring(math.floor(row["mom_song_id"]))] = true
            end
        end
    end
    for _, song_id in ipairs(momSongIds()) do
        setToggle("mom_song_" .. song_id, mom_active[tostring(song_id)] == true)
    end
    for placement_id, code in pairs(MUSIC_CHEST_PLACEMENT_CODES) do
        setToggle(code, chest_active[placement_id] == true)
    end

    -- Goal (0 = collect the 3 Proofs, 1 = collect 7 Heart Pieces) -> Settings menu stage
    local goal = slot_data["goal"] or 0
    setStage("goal", goal)

    -- Lucky Emblem milestone limit
    local le_limit = 90  -- default show all
    if slot_data["kh3_randomizer"] and slot_data["kh3_randomizer"]["limiters"] then
        le_limit = slot_data["kh3_randomizer"]["limiters"]["Lucky Emblem Limit"] or 90
    end
    setAmount("le_limit", le_limit)

    -- Lucky Emblems Per Check (0 = vanilla irregular milestones, N = every Nth
    -- emblem is a check). Top-level slot_data key, not under kh3_randomizer/limiters.
    local lep_check = slot_data["lucky_emblems_per_check"] or 0
    setAmount("lep_check", lep_check)

    -- Level up limit
    local lu_limit = 35  -- default
    if slot_data["kh3_randomizer"] and slot_data["kh3_randomizer"]["limiters"] then
        lu_limit = slot_data["kh3_randomizer"]["limiters"]["Level Up Limit"] or 35
    end
    setAmount("lu_limit", lu_limit)

    -- Moogle Shop Checks (top-level slot_data key, same pattern as lucky_emblems_per_check)
    local ms_limit = slot_data["moogle_shop_checks"] or 0
    setAmount("ms_limit", ms_limit)

    print(string.format("autoFill: battlegates=%s remind=%s lucky_emblems=%s kg=%s rg=%s le_limit=%d lep_check=%d lu_limit=%d ms_limit=%d default_base_abilities=%s",
        tostring(poolHasChecks("Battlegates")),
        tostring(poolHasChecks("Re+Mind")),
        tostring(poolHasChecks("Lucky Emblems")),
        tostring(poolHasChecks("Keyblade Graveyard")),
        tostring(poolHasChecks("Data Battle Rewards")),
        le_limit, lep_check, lu_limit, ms_limit,
        tostring(default_base_abilities)))
end

function onClear(slot_data)
    CUR_INDEX = -1
    ApplyLuckyEmblems(nil)
    LoadChestKeyblades(slot_data)
    LoadSongBonuses(slot_data)
    LoadMusicChests(slot_data)

    for name, mapping in pairs(ITEM_MAPPING_BY_NAME) do
        local obj = Tracker:FindObjectForCode(mapping.code)
        if obj then
            if mapping.type == "toggle" then
                obj.Active = false
            elseif mapping.type == "progressive" then
                obj.CurrentStage = 0
            elseif mapping.type == "consumable" or mapping.type == "consumable_max" then
                obj.AcquiredCount = 0
            end
        end
        if mapping.also then
            local also = Tracker:FindObjectForCode(mapping.also)
            if also then also.Active = false end
        end
    end

    autoFill(slot_data)

    PLAYER_ID = Archipelago.PlayerNumber or -1
    TEAM_NUMBER = Archipelago.TeamNumber or 0

    if PLAYER_ID > -1 then
        HINTS_ID = "_read_hints_" .. TEAM_NUMBER .. "_" .. PLAYER_ID
        LUCKY_EMBLEMS_ID = "kh3_lucky_emblems_" .. TEAM_NUMBER .. "_" .. PLAYER_ID
        Archipelago:SetNotify({HINTS_ID, LUCKY_EMBLEMS_ID})
        Archipelago:Get({HINTS_ID, LUCKY_EMBLEMS_ID})
    end
end

-- Auto-follow: the KH3 client (Client.py's handle_poptracker_runtime_context_bounce)
-- polls the running game once a second and, on every map change, sends a
-- {"cmd": "Bounce", "slots": [slot], "data": {...}} packet whose "data" carries
-- "kh3_world_code" -- the lowercase folder segment from the game's Unreal level
-- path (e.g. "/Game/Levels/he/he_01/he_01" -> "he" for Olympus). This table maps
-- those codes to this pack's top-level tracker.json tab titles so we can call
-- Tracker:UiHint("ActivateTab", ...) and follow the player around automatically.
--
-- Source: confirmed against data_from_ap/runtime_map_ap_grant_classification.json
-- (which enumerates every level path the apworld knows about) cross-referenced
-- with extract_data.py's WORLD_TREASURE_TABLES (same two-letter world codes).
-- Only codes with a confident, unambiguous world match are listed; codes for
-- worlds with no dedicated tab (Dark World "dw", The Final World "ew",
-- Unreality, 100 Acre Wood) or whose meaning wasn't confirmed ("ex",
-- "po", "sf", "sp", "ss", "wm", "yt", "di", "dp") are intentionally omitted --
-- an unmapped code just leaves the current tab alone instead of guessing wrong.
-- The "_DLC" suffixed codes are Re:Mind's revisits of earlier worlds' assets
-- (their checks belong to the separate "Re Mind" AP location table), so they
-- route to the Re:Mind tab rather than the original world's tab.
KH3_WORLD_CODE_TO_TAB = {
    ["he"]     = "Olympus",
    ["he_DLC"] = "Re:Mind",
    ["tt"]     = "TT",
    ["ts"]     = "Toy Box",
    ["ra"]     = "Corona",
    ["mi"]     = "Monstropolis",
    ["fz"]     = "Arendelle",
    ["ca"]     = "Caribbean",
    ["bx"]     = "SanFran",
    ["kg"]     = "KG",
    ["kg_DLC"] = "Re:Mind",
    ["bt"]     = "Re:Mind",
    ["bt_DLC"] = "Re:Mind",
    ["rg"]     = "Radiant Garden",
    ["rg_DLC"] = "Radiant Garden",
    ["GardenOfAssemblage"] = "Overworld",
    -- Gummi ship levels gm_01..gm_03 (apworld: "Gummiship"); gm_50 is a cutscene, left out.
    ["gm"]     = "Gummi Space",
}

-- Second-level auto-follow: within a world's top-level tab, some worlds split
-- into several nested map tabs (see layouts/tracker.json). "kh3_room_id" (falls
-- back to "kh3_level_id") is the finest-grained location the game currently
-- sends us -- confirmed by the apworld dev to equal the Unreal level id (e.g.
-- "fz_03"), NOT a sub-area within a level. So this table only lists room/level
-- ids that map to exactly ONE nested tab; ids that cover several of this pack's
-- nested tabs are intentionally left out (an unmapped id just leaves whichever
-- nested tab is already selected alone, same as an unmapped world_code above).
--
-- Left out for that reason, pending finer-grained data from the apworld:
--   he_02 (Mt. Olympus P1 vs P2), ts_02 (all 3 Galaxy Toys tabs),
--   ra_01 (Corona's Forest: Hills A+Tower/Hills B+C/Marsh/Campsite),
--   fz_* (none of Arendelle's 9 tabs map to a single fz_XX id),
--   ca_02+ (every Caribbean island besides Port Royal is one open "High Seas"
--   level with no per-island id -- this is the big one, see kh3_room_id).
-- Source: same data_from_ap/runtime_map_ap_grant_classification.json notes
-- used for KH3_WORLD_CODE_TO_TAB above.
KH3_ROOM_ID_TO_SUBTAB = {
    ["he_01"] = "Realm Of The Gods",
    ["he_03"] = "Thebes",
    ["he_04"] = "Thebes",
    ["ts_01"] = "Andy's House",
    ["ra_02"] = "The Kingdom",
    ["mi_01"] = "Monsters Inc.",
    ["mi_02"] = "The Factory",
    ["mi_03"] = "Power Plant",
    ["mi_04"] = "Door Vault",
    ["ca_01"] = "Port Royal",
    -- Space levels follow the apworld's gm_0<area> ids: area 1/2/3 = Starlight Way / Misty Stream / The Eclipse
    -- (same numbering as its gm_0X_Battle_NN battle ids). Not yet confirmed in game.
    ["gm_01"] = "Starlight Way",
    ["gm_02"] = "Misty Stream",
    ["gm_03"] = "The Eclipse",
}

-- Finest-grained auto-follow: "kh3_minimap_id" (confirmed by the apworld dev,
-- 2026-09-21) is the id of the minimap texture the game is currently showing
-- (source "TresUIP_NaviMapGra.SelectMap", read from NaviMapData), sent
-- alongside kh3_room_id in the same Bounce payload. It resolves exactly the
-- granularity kh3_room_id/kh3_level_id couldn't: individual islands within
-- Caribbean's single open "The High Seas" level -- the gap
-- KH3_ROOM_ID_TO_SUBTAB's comment called out as "the big one".
--
-- Only ids whose minimap_reference.json map_name/area_name resolves to
-- exactly ONE of this pack's nested tabs are listed here. Ids whose game
-- map_name has no area breakdown at all in that data (Corona's Hills A+Tower
-- vs Hills B+C vs Marsh vs Campsite split, Toy Box's 3 Galaxy Toys floors,
-- Arendelle's 9 areas, Olympus's Mt. Olympus P1 vs P2) are intentionally
-- left out, same "unmapped id leaves the tab alone" rule as
-- KH3_ROOM_ID_TO_SUBTAB -- guessing wrong is worse than not following.
-- Source: minimap_reference.json (NaviMapData/AreaSelectData dump), 2026-09-21.
KH3_MINIMAP_ID_TO_SUBTAB = {
    ["ra01_01"]         = "Hills A+Tower",  -- Kingdom of Corona: The Forest / Tower
    ["ca02_Center"]     = "Horseshoe",      -- Horseshoe Island
    ["ca02_Forest"]     = "Exile Island",
    ["ca02_Lagoon"]     = "Sandbar Isle",
    ["ca02_Monkey"]     = "Verdemontaña",   -- Isla Verdemontaña
    ["ca02_Pirates_01"] = "Huddled Isles",
    ["ca02_Pirates_02"] = "Huddled Isles",  -- Undersea Cavern: same map pins as Huddled Isles
    ["ca02_Pirates_03"] = "Huddled Isles",
    ["ca02_Pirates_04"] = "Huddled Isles",
    ["ca02_Rock"]       = "Confinement",    -- Confinement Island
    ["ca02_SunkenShip_01"] = "Ship's End",
    ["ca02_SunkenShip_02"] = "Ship's End",
    ["ca02_Twoway_01"]  = "Isla Mastiles",  -- Isla de los Mástiles
    ["ca02_Twoway_02"]  = "Isla Mastiles",
    ["ca02_west"]       = "Isle of Luck",
    -- ca02 / ca02_2 / ca02_seabattle intentionally omitted: their map_name is
    -- the undifferentiated "The High Seas" with no area, so they can mean any
    -- island (per the reference doc's own note on ca02_2/Gateway of Regret).
}

function onKH3MapChanged(message)
    local data = message and message.data
    if type(data) ~= "table" then return end
    if data["kh3_tracker_event"] ~= "map_changed" then return end

    local world_code = data["kh3_world_code"]
    local tab = world_code and KH3_WORLD_CODE_TO_TAB[world_code]
    if not tab then
        print(string.format("onKH3MapChanged: no tab mapping for world_code=%s (level_path=%s)",
            tostring(world_code), tostring(data["kh3_level_path"])))
        return
    end

    print(string.format("onKH3MapChanged: world_code=%s -> ActivateTab '%s'", world_code, tab))
    Tracker:UiHint("ActivateTab", tab)

    local minimap_id = data["kh3_minimap_id"]
    local subtab = minimap_id and KH3_MINIMAP_ID_TO_SUBTAB[minimap_id]
    local room_id = data["kh3_room_id"] or data["kh3_level_id"]
    if not subtab then
        subtab = room_id and KH3_ROOM_ID_TO_SUBTAB[room_id]
    end
    if subtab then
        print(string.format("onKH3MapChanged: minimap_id=%s room_id=%s -> ActivateTab '%s'",
            tostring(minimap_id), tostring(room_id), subtab))
        Tracker:UiHint("ActivateTab", subtab)
    end
end

Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
Archipelago:AddSetReplyHandler("notify handler", OnNotify)
Archipelago:AddRetrievedHandler("notify launch handler", OnNotifyLaunch)
Archipelago:AddBouncedHandler("kh3 poptracker context bounce handler", onKH3MapChanged)
