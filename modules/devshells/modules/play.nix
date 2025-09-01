{ pkgs }:

let basepkgs = with pkgs; [ playwright-driver.browsers ];
in {
  play = pkgs.mkShell {
    name = "play";
    buildInputs = basepkgs
      ++ (with pkgs; [ jetbrains.idea-community prismlauncher nix-ld ]);
    shellHook = ''
      echo "[✔] playwright is ready"

      export PLAYWRIGHT_BROWSERS_PATH=${pkgs.playwright-driver.browsers}
      export PLAYWRIGHT_SKIP_VALIDATE_HOST_REQUIREMENTS=true
    '';
  };
}
