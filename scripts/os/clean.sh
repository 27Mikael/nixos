clean_up() {
  if [[ $# -eq 0 ]]; then
    echo "Usage: clean_up <arg>"
    return 1
  fi

  for arg in "$@"; do
    echo "Deleting system generations(s): $arg"
    sudo nix-env --profile /nix/var/nix/profiles/system --delete-generations "$arg"
  done
}
