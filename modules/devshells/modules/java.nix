{ pkgs }:

let
  basepkgs = with pkgs; [
    openjdk21 # for tools
    openjdk17 # for projects
    gradle # Mod projects are usually Gradle-based
    cfr
  ];
in {
  mc_dev = pkgs.mkShell {
    name = "minecraft-java-mod-devshell";
    buildInputs = basepkgs
      ++ (with pkgs; [ jetbrains.idea-community prismlauncher ]);
    shellHook = ''
      echo "[✔] Java Minecraft Modding Shell Ready"

      # Set Java 21 as default
      export JAVA_HOME=${pkgs.openjdk21}
      export PATH=$JAVA_HOME/bin:$PATH

      # Java 17 explicitly exposed
      export JAVA_HOME_17=${pkgs.openjdk17}
      echo "Default JAVA_HOME set to: $JAVA_HOME (Java 21)"
      echo "JAVA_HOME_17 available at: $JAVA_HOME_17"      # 
    '';
  };
}

