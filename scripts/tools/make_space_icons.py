#!/usr/bin/env python3
"""Draw the Gummi space tracker icons (zone ship counters, Endymion, special weapons).

The Gummi ship logo is cropped from images/map_overworld.png, then placed on a
coloured rounded square with a short caption. Output: images/items/gummi/*.png

Usage: python scripts/tools/make_space_icons.py
"""
from pathlib import Path

from PIL import Image, ImageDraw, ImageFont

ROOT = Path(__file__).resolve().parents[2]
OUT = ROOT / "images/items/gummi"
SIZE = 96
ICONS = {
    "starlight_way": ("Starlight", (88, 70, 150)),
    "misty_stream": ("Misty", (40, 120, 130)),
    "eclipse": ("Eclipse", (150, 85, 40)),
    "endymion": ("Endymion", (150, 125, 40)),
    "special_weapons": ("Weapons", (140, 55, 60)),
}


def font(size):
    for name in ("arialbd.ttf", "arial.ttf", "DejaVuSans-Bold.ttf"):
        try:
            return ImageFont.truetype(name, size)
        except OSError:
            continue
    return ImageFont.load_default()


def main():
    logo = Image.open(ROOT / "images/map_overworld.png").convert("RGBA").crop((28, 30, 74, 71))
    logo = logo.resize((int(logo.width * 1.4), int(logo.height * 1.4)), Image.LANCZOS)
    OUT.mkdir(parents=True, exist_ok=True)
    for key, (caption, color) in ICONS.items():
        im = Image.new("RGBA", (SIZE, SIZE), (0, 0, 0, 0))
        d = ImageDraw.Draw(im)
        d.rounded_rectangle([2, 2, SIZE - 3, SIZE - 3], radius=14, fill=color + (255,),
                            outline=(255, 255, 255, 200), width=3)
        im.alpha_composite(logo, ((SIZE - logo.width) // 2, 10))
        f = font(17)
        w = d.textlength(caption, font=f)
        d.text(((SIZE - w) / 2, SIZE - 29), caption, font=f, fill=(255, 255, 255, 255),
               stroke_width=2, stroke_fill=(0, 0, 0, 255))
        im.save(OUT / f"{key}.png", optimize=True)
    print(f"wrote {len(ICONS)} icons to {OUT.relative_to(ROOT)}")


if __name__ == "__main__":
    main()
