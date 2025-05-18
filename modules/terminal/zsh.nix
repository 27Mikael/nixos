{
  programs.zsh = {
    enable = true;
    initExtra = ''
      source /etc/nixos/scripts/devenv/devshells.sh
    '';
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {

      vi = "nvim";
      ll = "ls -l";

      # rebuild system and home manager  
      rebuild = "sudo nixos-rebuild switch --flake .#harbinger";
      rehome = "home-manager -f /etc/nixos/home-manager/home.nix switch";
    };

    history.size = 2000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "direnv"];
      theme = "jonathan";  
    };
  };
}
