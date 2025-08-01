{ pkgs }:

let
  androidPkgs = pkgs.androidenv.composeAndroidPackages {
    platformVersions = [ "33" ]; # only API level 33
    buildToolsVersions = [ "33.0.0" ];
    includeNDK = true;
    includeEmulator = false;
  };
in {
  flutter = pkgs.mkShell {
    name = "flutter-cli-shell";

    buildInputs = [
      androidPkgs.androidsdk
      pkgs.openjdk17
      pkgs.flutter
      pkgs.gradle

      # Linux desktop Flutter requirements
      pkgs.gtk3
      pkgs.xz
      pkgs.icu
      pkgs.adwaita-icon-theme
      pkgs.gnome-themes-extra
      pkgs.fontconfig
      pkgs.freetype
    ];

    ANDROID_SDK_ROOT = "${androidPkgs.androidsdk}/libexec/android-sdk";
    JAVA_HOME = "${pkgs.openjdk17}";
    NIXPKGS_ACCEPT_ANDROID_SDK_LICENSE = "1";

    shellHook = ''
      echo "Flutter CLI env with Android SDK + Linux desktop deps"
      echo "ANDROID_SDK_ROOT = $ANDROID_SDK_ROOT"

      yes | sdkmanager --licenses || true

      export XCURSOR_THEME=Adwaita
      export XCURSOR_SIZE=24
      export GTK_THEME=Adwaita:dark
      export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:${pkgs.icu}/lib
      export ICU_DATA=${pkgs.icu}/share/icu/${pkgs.icu.version}
    '';
  };
}

