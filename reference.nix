{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    emacs-overlay.url = "github:nix-community/emacs-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    emacs-overlay,
  }: let
    inherit (nixpkgs) lib;
    withSystem = f:
      lib.fold lib.recursiveUpdate {}
      (map (s: f s) ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"]);
  in
    withSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [(import emacs-overlay)];
      };
    in {
      packages.${system}.default =
        (pkgs.emacsWithPackagesFromUsePackage {
          package = pkgs.emacs29-pgtk;
          config = ./config.org;
          defaultInitFile = true;
          alwaysTangle = true;
        })
        .overrideAttrs (_: {meta.mainProgram = "emacs";});

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          self.packages.${system}.default
        ];
      };
    });
}
