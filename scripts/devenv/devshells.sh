dev_env() {
  local prev_dir=$(pwd)
  nix develop /etc/nixos/modules/devshells#"$1" --command zsh -c "cd \"$dir\" && exec zsh"
}
