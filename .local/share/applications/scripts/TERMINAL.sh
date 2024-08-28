#!/usr/bin/env bash

# Function to detect the desktop environment
detect_desktop() {
    if [ "$XDG_CURRENT_DESKTOP" = "GNOME" ] || [ "$DESKTOP_SESSION" = "gnome" ]; then
        echo "GNOME"
    elif [ "$XDG_CURRENT_DESKTOP" = "KDE" ] || [ "$DESKTOP_SESSION" = "plasma" ]; then
        echo "KDE"
    else
        echo "Unknown"
    fi
}

# Function to get the default terminal in GNOME
get_gnome_terminal() {
    gsettings get org.gnome.desktop.default-applications.terminal exec | tr -d "'"
}


# Function to get the default terminal in KDE
get_kde_terminal() {
    # Check if there is a user-specified terminal in KDE configuration
    TERMINAL=$(kreadconfig6 --file kdeglobals --group General --key TerminalApplication)
    
    if [ -z "$TERMINAL" ]; then
        # Fallback to konsole if no specific terminal is configured
        TERMINAL="konsole"
    fi
    
    echo "$TERMINAL"
}




DESKTOP=$(detect_desktop)

if [ "$DESKTOP" = "GNOME" ]; then
    TERMINAL=$(get_gnome_terminal)
elif [ "$DESKTOP" = "KDE" ]; then
    TERMINAL=$(get_kde_terminal)
else
    echo "Unsupported desktop environment: $DESKTOP"
    exit 1
fi

echo "detected DE: $DESKTOP & default Terminal: $TERMINAL"


# Launch the detected terminal
if command -v "$TERMINAL" &> /dev/null; then
 "$TERMINAL" > /dev/null 2>&1 &
 disown
else
    echo "Terminal $TERMINAL not found!"
    exit 1
fi
