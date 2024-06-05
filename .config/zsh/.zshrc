fastfetch -c ~/.config/fastfetch/small.jsonc

# Enable Powerlevel10k instant prompt. Should stay close to the top
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}/zsh/zinit"

# Install zinit if not already
if [ ! -d "$ZINIT_HOME" ]; then
   echo -e "Installing zinit in ${ZINIT_HOME}"
   mkdir -p "$(dirname $ZINIT_HOME)0"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
   echo "done"
fi
# source zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Source prompt
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

#------------------------- PLUGINS & USER CONFIGS --------------------------

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab
# Snippets
zinit snippet OMZP::command-not-found
zinit snippet OMZP::archlinux


# Load completions
autoload -Uz compinit && compinit



# key-bindings
export KEYTIMEOUT=1
bindkey -v
bindkey -v '^L' autosuggest-accept
bindkey -v '^p' history-search-backward
bindkey -v '^n' history-search-forward


# History
HISTSIZE=50000
HISTFILE=${ZDOTDIR}/.zsh_history
SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups


# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# Shell Integrations
source /usr/share/fzf/shell/key-bindings.zsh

if [ -f "$ZDOTDIR/.zsh_functions" ]; then
    source "$ZDOTDIR/.zsh_functions"    # . = source
fi


# Aliases
alias ls='lsd -a'
alias reload='clear && exec zsh'
