#!/usr/bin/env bash

# Source all scripts in the "packages" directory
for script in packages/*; do
    if [[ -f "$script" ]]; then
        source "$script"
    fi
done


sduo pacman -S --noconfirm --needed kde_packages[@]
sduo pacman -S --noconfirm --needed system_packages[@]
sduo pacman -S --noconfirm --needed aur_packages[@]
sduo pacman -S --noconfirm --needed fonts[@]
sduo pacman -S --noconfirm --needed user_packages[@]


