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
    luafiles = lib.filesystem.listFilesRecursive ./lua;
    luafilter = builtins.filter (path: path != ./lua/init.lua) luafiles;    # Filter out init.lua so that it is always at the top
    lualist = map (path: builtins.readFile path) luafilter;
    luainit = builtins.readFile ./lua/init.lua;
    luatext = luainit + builtins.concatStringsSep "\n" lualist;
  in
    neovimUtils.makeNeovimConfig {
    inherit plugins;
    withPython3 = true;
    extraPython3Packages = _: [];
    withRuby = true;
    viAlias = false;
    vimAlias = false;
    customRC = "luafile ${writeText "init.lua" luatext}";
  };

  wrapperArgs =
    neovimConfig.wrapperArgs
    ++ ["--suffix" "PATH" ":" "${lib.makeBinPath extraPackages}"];
in
  wrapNeovimUnstable package (neovimConfig
    // {inherit wrapperArgs;})
