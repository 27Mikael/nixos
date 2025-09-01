{
  programs.zsh = {
    enable = true;
    initExtra = ''
      source /etc/nixos/scripts/devenv/devshells.sh
      source /etc/nixos/scripts/os/clean.sh

      export PATH=$HOME/Development/flutter/bin:$PATH
    '';
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {

      vi = "nvim";
      ll = "ls -l";

      # rebuild system and home manager  
      rebuild = "sudo nixos-rebuild switch --flake .#harbinger";
      test-build = "sudo nixos-rebuild build --flake .#harbinger";
      rehome = "home-manager -f /etc/nixos/home-manager/home.nix switch";
      find = ''$ nix run "github:thiagokokada/nix-alien#nix-alien-lda" -- '';
    };

    history.size = 2000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = [ "rm *" "pkill *" "cp *" ];

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" "direnv" ];
      theme = "jonathan";
    };
  };
}
