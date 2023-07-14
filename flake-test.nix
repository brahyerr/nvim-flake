{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
    neovim-flake.url = "github:neovim/neovim?dir=contrib";
    neovim-flake.inputs.nixpkgs.follows = "nixpkgs";

    #neovim-nightly-overlay.url = "github:nix-community/neovim-nightly-overlay";
  };

  outputs = {
    self,
    nixpkgs,
    neovim-flake,
  }: let
    inherit (nixpkgs) lib;
    withSystem = f:
      lib.fold lib.recursiveUpdate {}
      (map (s: f s) ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"]);
  in
    withSystem (system: let

      pkgs = import nixpkgs {
        inherit system;
        overlays = [
          # neovim-nightly-overlay.overlay 
          neovimFlakeOverlay
          neovimCustomOverlay
        ];
      };

      neovimFlakeOverlay = prev: final: {
        neovim = neovim-flake.packages.x86_64-linux.neovim;
      };

      # myNeovim-overlay = prev: final: {
      #   myNeovim = import ./pkgs/neovim.nix { pkgs = final; };
      # };

      neovimCustomOverlay = prev: final: {
        neovim-custom = import ./pkgs/neovim.nix { pkgs = final; };
      };

    in {
      packages.${system}.default = pkgs.neovim-custom.neovimUnwrapped;    # Make this better

      devShells.${system}.default = pkgs.mkShell {
        packages = [
          pkgs.nvfetcher
        ];
      };
    });
}
