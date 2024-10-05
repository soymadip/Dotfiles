#!/bin/bash


# File to store workspace history
HISTORY_FILE="/tmp/hypr_workspace_history"


# Get the current workspace ID
current_workspace=$(hyprctl activeworkspace | grep -oP 'workspace ID \K\d+')


# If the history file doesn't exist, create it with the current workspace
[[ ! -f "$HISTORY_FILE" ]] && echo "$current_workspace" > "$HISTORY_FILE"


# Read the last workspace from history
last_workspace=$(cat "$HISTORY_FILE")


# Fallback for new session or empty history
[ -z "$last_workspace" ] && { [ "$current_workspace" -eq 1 ] && last_workspace=2 || last_workspace=1; }


# Save the current workspace to history
echo "$current_workspace" > "$HISTORY_FILE"



# Function to switch workspace and update history
switch_workspace() {
    local new_workspace=$1
    # Update previous workspace in history
    echo "$current_workspace" > "$HISTORY_FILE"
    # Switch to the new workspace
    hyprctl dispatch workspace "$new_workspace"
    # Optionally, send a notification (uncomment if needed)
    # notify-send --expire-time=1000 -u normal -a hyprland "Workspace: $new_workspace"
}



# Function to show OSD for workspace selection
show_osd() {
    # Get the list of workspaces
    workspaces=$(hyprctl workspaces | awk '/name/ {print $3}')

    # Display the workspace list in rofi and capture the selected workspace
    selected_workspace=$(echo "$workspaces" | rofi -dmenu -p "Select Workspace")

    echo "Workspace $current_workspace" | rofi -dmenu -theme-str 'window {location: center; anchor: center; width: 20%; height: 10%;} listview {lines: 1;}' -p "Current Workspace" &
}



# Check if a workspace number or 'r' is provided as an argument
if [[ $# -eq 1 ]]; then
    # check If the argument is a number
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        # exit if already in workspace 
        if [[ "$current_workspace" == "$1" ]]; then
            notify-send -u critical --app-name="settings" "Workspace Same" \
              "Alrady in workspace ${1}"
            exit 1
        else
            # Switch to the workspace provided in the argument
            switch_workspace "$1"
        fi
    # If the argument is r
    elif [[ "$1" == "r" ]]; then
        # check if current workspace is same to last in file.
        if [[ "$current_workspace" == "$last_workspace" ]]; then
            # increment workspace to 1
            next_workspace=$((current_workspace + 1))
            switch_workspace "$next_workspace"
        else
            # Switch to the last workspace
            switch_workspace "$last_workspace"
        fi
    else
        # Invalid argument, show an error notification
        notify-send -u critical --app-name="settings" "Config Error" \
            "<b>Workspace switcher</b> Argument must be a number or 'r'"
        exit 1
    fi
else
    # No argument provided, show an error notification
    notify-send -u critical --app-name="settings" "Config Error" \
        "<b>Workspace switcher</b> Argument empty, must be a number or 'r'"
    switch_workspace "1"
fi
