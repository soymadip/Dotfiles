# Point release distros like fedora & ubuntu still uses fzf v<0.48
# so we need to call the script manually there.

function eval_fzf {
    # Get the version of fzf
    fzf_version=$(fzf --version | cut -d' ' -f1)

    # Check if the version is 0.48.0 or later
    if [[ $(echo "$fzf_version 0.48.0" | tr " " "\n" | sort -V | head -n1) = "0.48.0" ]]; then
        source <(fzf --zsh)
    else
        source /usr/share/fzf/shell/key-bindings.zsh
fi
}