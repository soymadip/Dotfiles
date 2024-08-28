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
# In order to work native-messaging to work with librewolf, we need
# to symlink forefox dirs to librewolf.

enable_librewolf_ntv_msging () {

  if [ -e ~/.librewolf/native-messaging-hosts ]; then
    echo "The destination directory ~/.librewolf/native-messaging-hosts already exists."
    read -p "Do you want to overwrite it? (y/n): " overwrite
    if [ "$overwrite" = "y" ]; then
      rm -i ~/.librewolf/native-messaging-hosts
      ln -s -r -i ~/.mozilla/native-messaging-hosts ~/.librewolf/native-messaging-hosts
    else
      echo "Aborting..."
      return
    fi
  fi

  if [ -e /usr/lib/librewolf/native-messaging-hosts ]; then
    echo "The destination directory /usr/lib/librewolf/native-messaging-hosts already exists."
    read -p "Do you want to overwrite it? (y/n): " overwrite2
    if [ "$overwrite2" = "y" ]; then
      sudo rm -i /usr/lib/librewolf/native-messaging-hosts
      sudo ln -s /usr/lib/mozilla/native-messaging-hosts /usr/lib/librewolf/native-messaging-hosts
    else
      echo "Aborting..."
      return
    fi
  fi
}
