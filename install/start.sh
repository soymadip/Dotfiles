#!/usr/bin/env bash

#     _____                                 _ _
#    / ____|                               | (_)
#   | (___   ___  _   _ _ __ ___   __ _  __| |_ _ __ 
#    \___ \ / _ \| | | | '_  _ \ / _ |/ _ | | '_ \  \
#    ____) | (_) | |_| | | | | | | (_| | (_| | | |_) |
#   |_____/ \___/ \__, |_| |_| |_|\__,_|\__,_|_| .__/
#                  __/ |                       | |
#                 |___/                        |_|
#_______________________________________________________________________




# Clone KireiSakura Kit
setup_KireiKit() {
    local esc_col='\033[0m' 

    echo -e "\033[1;33m[-]-> Checking if KireiSakura-Kit exists ${esc_col}"  
    if [[ -d "KireiSakura-Kit" ]]; then  
        echo -e "\033[0;32m[✔]-> KireiSakura-Kit already exists, sourcing...${esc_col}"
    else
        echo -e "\033[0;31m[X]-> KireiSakura-Kit not found.\033[38;5;67m\n[!]-> Cloning KireiSakura-Kit...${esc_col}"
        git clone https://github.com/soymadip/KireiSakura-Kit || { echo -e "\033[0;31m[X]-> Clone failed${esc_col}"; exit 1; }
    fi

    . KireiSakura-Kit/pre.sh &&  sleep 2
}



# start script
function confirm_start_script {
    welcome
    prompt "Do you wanna: Install packages, Setup configs, change defaults?" cfrm_start
    if [[ "$cfrm_start" == "y" || "$cfrm_start" == "Y" || -z "$cfrm_start" ]]; then
        log "Starting script" inform
    else
        log "User denied to start...." error && log "Exiting...." error
        sleep 3 && clear && exit 1
    fi
}

# start script
function confirm_start_script {
    welcome
    prompt "Do you wanna: Install packages, Setup configs, change defaults?" cfrm_start
    [[ "$cfrm_start" == "y" || "$cfrm_start" == "Y" || -z "$cfrm_start" ]]; log "Starting script" inform || log "User denied to start...." error && log "Exiting...." error && sleep 3 && clear && exit 1
}





# \\\\\\\\\\\\\\\\\\ Triggering Functions ///////////////////////

LOG_FILE="init-install.log"
CACHE_DIR="$HOME/.cache/setup"


source /path/to/KireiSakura-Kit/init.sh

# setup_KireiKit
confirm_start_script
load_util install_adtionl_repos kde-plasma_utils install_all_packages restore_dotfiles


# Stow dotfiles
stow_restore

# Installing additional repos & packages
install_adtionl_repos
. packages.sh 
install_all_packages rice_pckgs core_pckgs de_pckgs cli_pckgs user_pckgs

# Change wallpaper, icon theme, cursor theme
change_wallpaper "$HOME/Pictures/ADMIN/catppuccin-lofi.jpeg"
change_icon_theme "Papirus-Dark"
change_papirus_folder_color "cat-mocha-lavender" "Papirus-Dark"
change_cursor_theme "catppuccin-frappe-lavender-cursors" "32"

# set sddm theme 
change_sddm_theme breeze
