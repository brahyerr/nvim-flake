{ pkgs }: 
let
customRC = "luafile ${pkgs.writeText "init.lua" (import ../lua)}";
plugins =
  (pkgs.lib.mapAttrsToList (
      _: value: (
        pkgs.vimUtils.buildVimPluginFrom2Nix
        {
          inherit (value) name date version;
          src = pkgs.fetchgit {
            inherit (value.src) url rev sha256;
          };
        }
      )
    )
    (pkgs.lib.importJSON ../plugins/_sources/generated.json))
  ++ [pkgs.vimPlugins.nvim-treesitter.withAllGrammars];
in {
  neovimUnwrapped = pkgs.wrapNeovim pkgs.neovim {
    #package =  neovim-flake.packages."${system}".neovim;
    # package = pkgs.neovim-nightly;
    configure = {
      inherit customRC;
      packages.all.start = plugins;
    };
  };
}
