#!/bin/bash
set -e

#---------------------- USER CONFIGS --------------------------------------------------------------


ENABLED_MODULES=(      # pending....
    "resize_swap"
    "enable_os_prober"
    "install_chaotic_aur"
    "change_meta_to_krunner"
    "install_fonts"
)

FONTS_DIRECTORY="Assets/fonts"
USER_FONTS_DIRECTORY="~/.fonts" #for only current user

SWAP_FILE="/swapfile"
SWAP_FILE_SIZE="6G"

GRUB_FILE="/etc/default/grub"



#-------------------------------------------- SCRIPT START -----------------------------------------------

