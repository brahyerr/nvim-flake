local lspconfig = require('lspconfig')
local coq = require('coq')

lspconfig.rust_analyzer.setup{}
lspconfig.ltex.setup{}
lspconfig.lua_ls.setup{}
lspconfig.nixd.setup{}
-- require('lspconfig').rnix.setup{}

local servers = { 'lua_ls', 'ltex', 'nixd', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities({
    -- on_attach = my_custom_on_attach,
  }))
end

--  lspconfig.rust_analyzer.setup{coq.lsp_ensure_capabilities()}
--  lspconfig.lua_ls.setup{coq.lsp_ensure_capabilities()}
--  lspconfig.ltex.setup{coq.lsp_ensure_capabilities()}
