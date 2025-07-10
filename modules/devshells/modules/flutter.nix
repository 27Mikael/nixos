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

    buildInputs =
      [ androidPkgs.androidsdk pkgs.openjdk17 pkgs.flutter pkgs.gradle ];

    ANDROID_SDK_ROOT = "${androidPkgs.androidsdk}/libexec/android-sdk";
    JAVA_HOME = "${pkgs.openjdk17}";
    NIXPKGS_ACCEPT_ANDROID_SDK_LICENSE = "1";

    shellHook = ''
      echo "Minimal Flutter CLI env with Android SDK"
      echo "ANDROID_SDK_ROOT = $ANDROID_SDK_ROOT"
      yes | sdkmanager --licenses || true
    '';
  };
}

