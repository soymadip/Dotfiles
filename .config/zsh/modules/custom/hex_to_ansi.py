import sys

def hex_to_rgb(hex_color):
    hex_color = hex_color.lstrip('#')
    return tuple(int(hex_color[i:i+2], 16) for i in (0, 2, 4))

def rgb_to_ansi(r, g, b):
    # Approximate the RGB values to the closest 256-color code
    if r == g == b:
        if r < 8:
            return 16
        elif r > 248:
            return 231
        else:
            return int(round(((r - 8) / 247) * 24) + 232)
    else:
        return 16 + (36 * int(r / 255 * 5)) + (6 * int(g / 255 * 5)) + int(b / 255 * 5)

def hex_to_ansi(hex_color):
    rgb = hex_to_rgb(hex_color)
    return rgb_to_ansi(*rgb)

if __name__ == "__main__":
    hex_color = sys.argv[1] if len(sys.argv) > 1 else "#FF5733"
    ansi_code = hex_to_ansi(hex_color)
    print(f"\n\033[38;5;{ansi_code}m{hex_color}\033[0m ANSI Code: {ansi_code}")
