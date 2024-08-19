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



RED='\033[0;31m'
LAVENDER='\u001b[38;5;147m'
GREEN='\033[0;32m'
AQUA='\e[38;2;216;222;233m'
NC='\033[0m' # No Color/escape code


prnt_cprmt() {
  clear
  echo -e "${LAVENDER}============= OUTPUT ==============${NC}\n"
}


prnt_cftr() {
  echo -e "\n\n${LAVENDER}============== END ================${NC}\n"
  echo -e "${LAVENDER}Do you wanna close the Terminal now?${NC}"
  echo -n "==-> "; read confirm
  if [[ "$confirm" == "y" ]] || [[ "$confirm" == "Y" ]] || [[ -z "$confirm" ]]; then
    exit
  fi
}


#
# rn_cr_cmd() {
#   command="$()" 
#
#   echo -e "\n============ OUTPUT ==============\n"
#   "${command}"
#   echo -e "\n============ END ==============\n"
#   echo -e "\n${RED}Do you wanna close the Terminal now?${NC}"
#   echo -n "==-> "; read confirm
#   if [[ "$confirm" == "y" ]] || [[ "$confirm" == "Y" ]] || [[ -z "$confirm" ]]; then
#     exit
#   fi
# }
