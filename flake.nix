{
  description = "Shell for working on the site";

  inputs.flake-utils.url = "github:numtide/flake-utils";
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";


  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem
      (system:
        let pkgs = nixpkgs.legacyPackages.${system}; in
        rec {
          devShell = pkgs.mkShell {
            buildInputs = [
              pkgs.mdbook
              pkgs.hugo
            ];
          };
        }) // { };
}
