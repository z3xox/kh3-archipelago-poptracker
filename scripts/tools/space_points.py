"""Pin coordinates (original image px) for the Gummi space maps.

Gazers are the green ship markers (Moogle, Cactuar, ...) printed on each map.
Letters are the red-heart battle markers printed on each map (A, B, ...), in
the order of the apworld's gm_0X_Battle_NN ids. Spheres follow Greek letters.
"""
MAPS = {
    'starlight_way': dict(map='map_gummi_starlight_way', zone='Starlight Way', area=1,
        battles={'A': (1222, 984), 'B': (1371, 329), 'C': (628, 429), 'D': (1822, 1041),
                 'E': (1255, 694), 'F': (959, 338), 'G': (1804, 410),
                 'H': (323, 400), 'I': (1639, 573), 'J': (554, 960)},
        battle_ids=[1, 2, 3, 4, 5, 7, 8, 10, 11, 12],
        names=['Countdown 1', 'Countdown 2', 'Countdown 3', 'Countdown 4',
               'Speed Skirmish 1', 'Speed Skirmish 2', 'Speed Skirmish 3',
               'Astrowarrior', 'Flower Guardian', 'Comet Crawlers'],
        spheres={'α': (1145, 679), 'β': (935, 540), 'γ': (1054, 860)},
        gazers={'Moogle': (494, 71), 'Cactuar': (2081, 1181), 'Bomb': (804, 1449)}),
    'misty_stream': dict(map='map_gummi_misty_stream', zone='Misty Stream', area=2,
        battles={'A': (1101, 416), 'B': (1592, 610), 'C': (799, 457), 'D': (1437, 1045),
                 'E': (689, 964), 'F': (1109, 1121), 'G': (1338, 420), 'H': (549, 636),
                 'I': (1478, 834), 'J': (1247, 1034), 'K': (700, 311), 'L': (1621, 788),
                 'M': (843, 1019), 'N': (493, 474), 'O': (1719, 374), 'P': (1010, 1011),
                 'Q': (1038, 771)},
        battle_ids=list(range(1, 18)),
        names=[f'Countdown {i}' for i in range(5, 11)] + [f'Speed Skirmish {i}' for i in range(4, 11)]
              + ['Dreadshark', 'Glacial Fortress', 'Space Worm', 'Schwarzgeist'],
        spheres={'δ': (1514, 417), 'ε': (470, 863), 'ζ': (990, 1163)},
        gazers={'Imp': (816, 91), 'Tonberry': (1465, 67), 'Endymion': (1129, 1456)}),
    'eclipse': dict(map='map_gummi_eclipse', zone='The Eclipse', area=3,
        battles={'A': (2138, 440), 'B': (1848, 741), 'C': (2440, 762),
                 'D': (2138, 1042), 'E': (2105, 662), 'F': (2058, 728)},
        battle_ids=[1, 2, 3, 4, 5, 6],
        names=['Colossus Pyramid', 'Countdown 11', 'Speed Skirmish 11',
               'Supreme Warrior', 'Scarlet Shark', 'Omega Machina'],
        spheres={'η': (2050, 897), 'θ': (2235, 955), 'ι': (2045, 1195)},
        gazers={'Ultros': (2142, 238), 'Bismarck': (1735, 1170), 'Omega': (2522, 1125)}),
}
