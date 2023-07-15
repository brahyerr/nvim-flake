{
  wrapNeovimUnstable,
  neovimUtils,
  lib,
  writeText,            # comes from pkgs
  #neovim package
  neovim-unwrapped,
  package ? neovim-unwrapped,
  extraPackages ? [],
  plugins ? [],
}: let
  neovimConfig = 
  let
    luaPaths = lib.filesystem.listFilesRecursive ./lua;
    luaList = map (path: builtins.readFile path) luaPaths;
    luaFile = builtins.concatStringsSep "\n" luaList;
  in
    neovimUtils.makeNeovimConfig {
    inherit plugins;
    withPython3 = true;
    extraPython3Packages = _: [];
    withRuby = true;
    viAlias = false;
    vimAlias = false;
    customRC = "luafile ${writeText "init.lua" luaFile}";
  };

  wrapperArgs =
    neovimConfig.wrapperArgs
    ++ ["--suffix" "PATH" ":" "${lib.makeBinPath extraPackages}"];
in
  wrapNeovimUnstable package (neovimConfig
    // {inherit wrapperArgs;})
