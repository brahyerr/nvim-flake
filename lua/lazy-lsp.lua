require('lazy-lsp').setup {
  -- By default all available servers are set up. Exclude unwanted or misbehaving servers.
  -- excluded_servers = {
  ---   "ccls", "zk",
  --- },
  excluded_servers = {
    "sqls",
  },
  -- Alternatively specify preferred servers for a filetype (others will be ignored).
  preferred_servers = {
    haskell = { "hls" },
    rust = { "rust_analyzer" },
    nix = { "nixd" },
  },
  -- Default config passed to all servers to specify on_attach callback and other options.
  default_config = {
    flags = {
      debounce_text_changes = 150,
    },
    -- on_attach = on_attach,
    -- capabilities = capabilities,
  },
  -- Override config for specific servers that will passed down to lspconfig setup.
  -- Note that the default_config will be nerged with this specific configuration so you don't need to specify everything twice.
  configs = {
    lua_ls = {
      settings = {
        Lua = {
          diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim" },
          },
        },
      },
    },
  },
}
