{
  description = "C development flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system}; in
      {
        packages = {
          default = pkgs.stdenv.mkDerivation {
            pname = "greet";
            version = "1.0.0";
            src = ./.;

            buildInputs = with pkgs; [
              gcc
            ];

            buildPhase = ''
              							make
              						'';

            installPhase = ''
              							make OUTDIR="$out" install
              						'';
          };
        };
        devShells = {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              clang-tools
              gcc
            ];
          };
        };
      }
    );
}
