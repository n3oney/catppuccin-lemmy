{
  description = "devshell for building catppuccin lemmy";

  inputs = {
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = {
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem
    (
      system: let
        pkgs = nixpkgs.legacyPackages.${system};
      in {
        devShell = with pkgs;
          mkShell {
            buildInputs = [
              nodejs
              alejandra
            ];

            shellHook = ''PATH="$PWD/node_modules/.bin:$PATH"'';
          };

        packages = rec {
          catppuccin-lemmy = pkgs.callPackage ./nix {};
          default = catppuccin-lemmy;
        };
      }
    );
}
