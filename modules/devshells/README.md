# Simple use instructions

Devshells makes it possible to have arbitrarily complex dev-environments. You have full control of versioning, allowing you to keep constant across systems your development environments and preventing the "it works on my system" debacle.

# How to use

ensure you are running the nix package manager or nixos on the target system. The module is set up as a flake so it should be possible to import it into any system and run the dev shells (in theory) -> as of this moment embedded in my configs, not sure how that affects universality.

 <!--
TODO: properly define the use cases (local devshells vs global dev shells)
TODO: define how to protect dev-environments from garbage clean up
-->

## To start a dev-environment

 **to setup a custom per project based dev-environment**
  cd into devshells and run `nix develop .#devshell --profile /dir/of/your/choice`
  then `cd /dir/of/your/choice` and `./devshell` to run your dev environment
  the following are a list of available dev-environments

  ```
  └───devShells
      └───x86_64-linux
          ├───bun: development environment 'bun'
          ├───clang: development environment 'clang-shell'
          ├───gcc: development environment 'gcc-shell'
          ├───ml: development environment 'pyml'
          ├───nodejs_22: development environment 'nodejs_22'
          └───py: development environment 'pyshell'
  ```
