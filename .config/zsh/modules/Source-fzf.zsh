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
# Point release distros like fedora & ubuntu still uses fzf v<0.48
# so we need to call the script manually there.

function eval_fzf {
    # Get the version of fzf
    fzf_version=$(fzf --version | cut -d' ' -f1)

    export FZF_DEFAULT_OPTS=" \
     --color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
     --color=fg:#cad3f5,header:#ed8796,info:#ed8796,pointer:#b7bdf8 \
     --color=marker:#b7bdf8,fg+:#cad3f5,prompt:#91d7e3,hl+:#ed8796 \
     --color=selected-bg:#494d64 \
     --multi"

    # Check if the version is 0.48.0 or later
    if [[ $(echo "$fzf_version 0.48.0" | tr " " "\n" | sort -V | head -n1) = "0.48.0" ]]; then
        source <(fzf --zsh)
    else
        source /usr/share/fzf/shell/key-bindings.zsh
    fi
  }
