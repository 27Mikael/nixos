{
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {

      vi = "nvim";
      ll = "ls -l";
      rebuild = "sudo nixos-rebuild switch --flake .#harbinger";
    };

    history.size = 2000;
    history.ignoreAllDups = true;
    history.path = "$HOME/.zsh_history";
    history.ignorePatterns = ["rm *" "pkill *" "cp *"];

    oh-my-zsh = {
      enable = true;
      plugins = ["git" "direnv"];
      theme = "powerlevel10k";  
    };
  };
}
