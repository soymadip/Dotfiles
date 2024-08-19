

source ~/Dotfiles/install/KireiSakura-Kit/Utilities/core-functions.sh


change_papirus_folder_color() {
    local color_name="$1"
    local theme_name=${2:-Papirus-Dark}

    echo "Color is: '$color_name'"
    echo "Theme is: '$theme_name'"

    if ! command -v papirus-folders >/dev/null 2>&1; then
        echo "Papirus-folders is not installed, installing..."
        install_package papirus-folders-catppuccin-git 
    fi

    log "Changing Papirus folder color to $color_name" inform 
    papirus-folders -v -C "$color_name" --theme "$theme_name"
    echo "Done"
}


change_papirus_folder_color cat-mocha-lavender Papirus-Dark
