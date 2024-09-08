
function import-mod {
  local module_names=("$@")
  local module_dir="$ZDOTDIR/modules"


  if [[ ${module_names[1]} == "--all" ]]; then

    for mod_file in "$module_dir"/*.zsh; do
      if [ -f "$mod_file" ]; then
        source "$mod_file"
      else
        echo "Failed to source module file: $(basename "$mod_file")"
      fi
    done

  else

    for module in "${module_names[@]}"; do
      local mod_file="$module_dir/$module.zsh"
      if [ -f "$mod_file" ]; then
        source "$mod_file"
      else
        echo "Failed to source module file: $(basename "$mod_file")"
      fi
    done

  fi
}
