{ pkgs }:

let
  basepkgs = with pkgs; [
    # android studio 
    android-studio
    androidsdk

    # java
    openjdk17
    gradle

    # flutter
    flutter
  ];

in {
  flutter = pkgs.mkShell {
    name = "flutter";
    buildInputs = basepkgs;

    ANDROID_SDK_ROOT = "${pkgs.androidsdk}/libexec/android-sdk";
    ANDROID_NDK_ROOT = "${pkgs.androidsdk}/libexec/android-sdk/ndk-bundle";

    JAVA_HOME = "${pkgs.openjdk17}";
    NIXPKGS_ACCEPT_ANDROID_SDK_LICENSE = 1;

    shellHook = ''
      echo "Flutter devnev deployed"
      echo "ANDROID_SDK_ROOT set to $ANDROID_SDK_ROOT"
      echo "JAVA_HOME set to $JAVA_HOME"
    '';
  };
}
