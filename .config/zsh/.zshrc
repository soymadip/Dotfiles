#     _____                                 _ _
#    / ____|                               | (_)
#   | (___   ___  _   _ _ __ ___   __ _  __| |_ _ __
#    \___ \ / _ \| | | | '_ ` _ \ / _` |/ _` | | '_ \
#    ____) | (_) | |_| | | | | | | (_| | (_| | | |_) |
#   |_____/ \___/ \__, |_| |_| |_|\__,_|\__,_|_| .__/
#                  __/ |                       | |
#                 |___/                        |_|
#

fastfetch -c ~/.config/fastfetch/small.jsonc

# Enable Powerlevel10k instant prompt. Should stay close to the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# zinit and plugins directory
ZINIT_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/zinit"


# Install $ source zinit if not already
if [ ! -d "$ZINIT_HOME" ]; then
   echo -e "Installing zinit in ${ZINIT_HOME}"
   mkdir -p "$(dirname $ZINIT_HOME)0"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
   echo "done\n Sourcing zinit"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Source prompt
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh



#----------------------------------------- PLUGINS & USER CONFIGS ---------------------------------




#______________________Environment Varibles___________________________
export TERMINAL=/usr/bin/kitty



#_______________________Shell Integrations_____________________________
for file in "$ZDOTDIR"/functions/*.zsh; do if [ -f "$file" ]; then source "$file"; fi; done
eval_fzf



#_____________________________Plugins____________________________________
# zinit light zsh-users/zsh-syntax-highlighting
zinit light zdharma-continuum/fast-syntax-highlighting 
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
zinit light MichaelAquilina/zsh-auto-notify
zinit ice depth=1; zinit light jeffreytse/zsh-vi-mode

#________________Snippets________________
zinit snippet OMZP::command-not-found
zinit snippet OMZP::archlinux


#______________Plugins Options____________

# Load completions
autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'



#_____________________________key-bindings_________________________________
export KEYTIMEOUT=1
bindkey -v
bindkey -v '^L' autosuggest-accept
bindkey -v '^p' history-search-backward
bindkey -v '^n' history-search-forward
#bindkey -M viins '^j' fzf-history-widget
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

#_______________________________History____________________________________
HISTSIZE=100000
HISTFILE=${ZDOTDIR}/.history.zsh
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups



#____________________________Aliases_______________________________________
alias sudo='sudo ' # expand aliases with sudo
alias ls='lsd -a'
# alias ls='lf'
alias cp='cp -ri'
alias mkdir='mkdir -p'
alias reload='clear && exec zsh'
alias ZZ="exit"
alias CC='clear'
alias rmrf="rm -rf"
alias nv='nvim'
alias snv='sudo nvim'
alias chhostname='hostnamectl set-hostname'
alias cat='bat'
alias man='batman'
alias lnr='ln -s -r -i'
alias papirus-folders='pprus_ch_fldr_clr'

# git
alias gc="git clone"
alias gb="git branch"
alias ga="git add"
alias gm="git merge"
alias gp="git push"
alias gcm="git commit -m"
alias gco="git checkout"
alias gcob="git checkout -b"
alias gcs="git commit -S -m"
alias gd="git difftool"
alias gpr="gh pr create"
alias gr="git rebase -i"
alias gs="git status -sb"
alias gt="git tag"
