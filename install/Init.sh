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



# clone KireiSakura Kit
function setup_KireiKit {
    local red='\033[0;31m'
    local nc='\033[0m' 
    local blue='\033[38;5;67m'
    local yellow='\033[1;33m'
    local green='\033[0;32m'

    echo -e "${yellow}[-]-> Checking if KireiSakura-Kit exists ${nc}"  
    if [[ -d "KireiSakura-Kit" ]]; then  
        echo -e "${green}[✔]-> KireiSakura-Kit already exists, sourcing...${nc}"
        sleep 1 
    else
        echo -e "${red}}[X]-> KireiSakura-Kit not found.${nc}"  
        echo -e "${blue}[!]-> Cloning KireiSakura-Kit...${nc}"
        if ! git clone https://github.com/soymadip/KireiSakura-Kit; then
            echo -e "${red}[X]-> Failed to clone KireiSakura-Kit${nc}"
            exit 1
        fi
    fi

    source KireiSakura-Kit/Utilities/core-functions.sh
    sleep 1
}



# start script
function confirm_start_script {
    welcome
    prompt "Do you wanna: Install packages, Setup configs, change defaults?" cfrm_start
    if [[ "$cfrm_start" == "y" || "$cfrm_start" == "Y" || -z "$cfrm_start" ]]; then
        log "Starting script" inform
    else
        log "User denied to start...." error
        log "Exiting...." error
        sleep 3
        clear && exit 1
    fi
}




# Function to install packages from multiple groups
function loop_install_packages {
    
    for group_name in "$@"; do
        
        local -n group="$group_name"
        log "Starting installation of packages from group: $group_name" inform

        prompt "Install packages from $group_name?" confirm_instpkgs
        if [[ "$confirm_instpkgs" == "y" || "$confirm_instpkgs" == "Y" || -z "$confirm_instpkgs" ]]; then
            log "Installing packages from $group_name..." inform
            for pkg in "${group[@]}"; do
                echo -e "\n"
                log "Installing $pkg" inform
                install_package "$pkg"
                sleep 1
            done
            echo -e "\n"
            log "Packages from $group_name are installed" success
        else
            echo -e "\n"
            log "User denied installation of packages from $group_name" error
        fi

        # Log the completion of the group installation and print footer
        log "Finished processing group: $group_name \n" success 
    done
    log "All packages are installed" success
    print_footer
}



# Function to restore dotfiles using stow
function stow_restore {
    local cwd=$(pwd)
    local dot_dir=${1:-$HOME/Dotfiles}

    log "Restoring dotfiles using stow" inform

    if ! command -v stow >/dev/null 2>&1; then
        log "Stow is not installed, installing.... " inform
        if ! sudo pacman -S --noconfirm --needed stow; then
            log "Failed to install stow" error
            exit 1
        else
            log "Stow is installed" 
        fi
    fi  

    log "Current dir is $cwd"
    log "Changing directory to $dot_dir"

    if cd "$dot_dir"; then
        log "Running stow -v -R ."
        if stow -v -R .; then
            log "Stow completed" success
        else
            log "Stow failed" error
        fi
    else
        log "Failed to change directory to $dot_dir" error
    fi

    log "Changing directory back to $cwd"
    cd "$cwd" || log "Failed to change back to $cwd" error
}


# Function to change papirus folders color


# \\\\\\\\\\\\\\\\\\ Triggering Functions ///////////////////////

LOG_FILE="init-install.log"

setup_KireiKit
confirm_start_script


# Stow dotfiles
stow_restore


# Installing additional repos & packages
source KireiSakura-Kit/Utilities/install-additional_repo.sh && install_adtionl_repos
source packages.sh
loop_install_packages rice_pckgs core_pckgs de_pckgs cli_pckgs user_pckgs


# Change wallpaper, icon theme, cursor theme
source KireiSakura-Kit/Utilities/kde-plasma_utils.sh

change_wallpaper "$HOME/Pictures/ADMIN/catppuccin-lofi.jpeg"
change_icon_theme "Papirus-Dark"
change_papirus_folder_color "cat-mocha-lavender" "Papirus-Dark"
change_cursor_theme "catppuccin-frappe-lavender-cursors" "32"

# set sddm theme 
change_sddm_theme breeze