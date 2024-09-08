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

# This function is for dual audio anime.
# It strips The jap Audio & makes dialouge subtitle default with signs forced.

process_anime_mkv() {

  # getting total orignal size
  local org_size=$(du -h)
  # Create output directory
  mkdir -p "Eng_Audio"
  
  #Loop through all .mkv files & Run mkvmerg
  for file in *.mkv; do
    base_name=$(basename "$file" .mkv) # Get the base name of the file (without the .mkv extension)
    mkvmerge -o "Eng_Audio/${base_name}.mkv" \
      --audio-tracks 1 \
      --subtitle-tracks 3,4,5 \
      --default-track 1 \
      --default-track 4 \
      --forced-track 1:0 \
      --forced-track 2:0 \
      --forced-track 3:1 \
      --forced-track 4:0 \
      "$file"
  done

  # print directory sizes
  echo -e "\e[38;2;216;222;233m--------------------------\033[0m"
  echo -e "Org size: \u001b[38;5;147m$org_size \033[0m"
  echo -e "Now Size: \u001b[38;5;147m$(du -sh ./Eng_Audio) \033[0m"
  echo -e "\e[38;2;216;222;233m--------------------------\033[0m"
  sleep 2

  # ask for move eng files to parent directory
  echo -e "\u001b[38;5;147m[?] Do you want to move files into parent directory?\033[0m (y/n)"
  echo -n "|==> " 
  read confirm
  if [ "$confirm" == "y" ] || [ "$confirm" == "Y" ] || [ -z "$confirm" ]; then
    # remove org files
    for file in *.mkv; do
      rm "$file"
    done
    # move files
    echo "-> Moving files to org directory"
    mv Eng_Audio/* .
    rmdir Eng_Audio
  else
    echo -e "-> \u001b[38;5;147mRemember, both files are taking space\033[0m"
    sleep 2
  fi
  echo -e "-> \u001b[38;5;147mdone, exiting shell\033[0m"
  sleep 3 && exit
}
