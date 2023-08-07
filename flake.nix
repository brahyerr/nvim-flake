{
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    neovim-src = {
      url = "github:neovim/neovim";
      flake = false;
    };
    flake-compat = {
      url = "github:edolstra/flake-compat";
      flake = false;
    };
  };

  outputs = {
    self,
    nixpkgs,
    neovim-src,
    ...
  }: let
    inherit (nixpkgs) lib;
    withSystem = f:
      lib.fold lib.recursiveUpdate {}
      (map f ["x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin"]);
  in
    withSystem (system: let
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      formatter.${system} = pkgs.alejandra;
      overlays.default = final: _: removeAttrs self.packages.${final.system} ["default"];
      overlay = self.overlays.default;
      devShells.${system}.default = pkgs.mkShell {
        packages = [
          self.packages.${system}.default
          pkgs.roswell
          pkgs.nvfetcher
        ];
      };

      packages.${system} = {
        default = self.packages.${system}.neovim;

        neovim = let
          luaPaths = lib.filesystem.listFilesRecursive ./lua;
          luaList = map (path: builtins.readFile path) luaPaths;
          luaFile = builtins.concatStringsSep "\n" luaList;
          neovimConfig = pkgs.neovimUtils.makeNeovimConfig {
            plugins =
              [pkgs.vimPlugins.nvim-treesitter.withAllGrammars]
              ++ lib.mapAttrsToList (
                _: value: (pkgs.vimUtils.buildVimPluginFrom2Nix value)
              )
              (import ./plugins/_sources/generated.nix {inherit (pkgs) fetchgit fetchurl fetchFromGitHub dockerTools;});
            withPython3 = true;
            extraPython3Packages = _: [];
            withRuby = true;
            viAlias = false;
            vimAlias = false;
            customRC = "luafile ${pkgs.writeText "init.lua" luaFile}";
          };
          wrapperArgs = let
            path = lib.makeBinPath (
              builtins.attrValues
              {
                inherit
                  (pkgs)
                  #nix
                  
                  nixd
                  # deadnix
                  statix
                  alejandra
                  nil

                  # tex
                  ltex-ls

                  # lua
                  lua-language-server
                  stylua

                  #other
                  
                  ripgrep
                  fd
                  xdg-utils
                  ;
              }
            );
          in
            neovimConfig.wrapperArgs
            ++ [
              "--prefix"
              "PATH"
              ":"
              path
            ];
        in
          pkgs.wrapNeovimUnstable (pkgs.neovim-unwrapped.overrideAttrs {
            src = neovim-src;
            version = neovim-src.shortRev or "dirty";
            patches = [];
            preConfigure = ''
              sed -i cmake.config/versiondef.h.in -e "s/@NVIM_VERSION_PRERELEASE@/-dev-$version/"
            '';
          })
          (neovimConfig // {inherit wrapperArgs;});
      };
    });
}
