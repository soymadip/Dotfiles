#     _____                                 _ _       
#    / ____|                               | (_)      
#   | (___   ___  _   _ _ __ ___   __ _  __| |_ _ __  
#    \___ \ / _ \| | | | '_ ` _ \ / _` |/ _` | | '_ \ 
#    ____) | (_) | |_| | | | | | | (_| | (_| | | |_) |
#   |_____/ \___/ \__, |_| |_| |_|\__,_|\__,_|_| .__/ 
#                  __/ |                       | |    
#                 |___/                        |_|    
#_______________________________________________________________________     
#                      

function disable_discover_autostart {
    # Uncomment NoExtract
    sudo sed -i '/^#NoExtract =/s/^#//' /etc/pacman.conf
    #add the lines.
    sudo sed -i '/^NoExtract =/ s/$/ etc\/xdg\/autostart\/org.kde.discover.notifier.desktop/' /etc/pacman.conf
}