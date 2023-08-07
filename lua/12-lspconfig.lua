local lspconfig = require 'lspconfig'
local coq = require 'coq'

-- Enable formatting
format_callback = function(client, bufnr)
	vim.api.nvim_create_autocmd('BufWritePre', {
		group = augroup,
		buffer = bufnr,
		callback = function()
			if vim.g.formatsave then
				local params = require('vim.lsp.util').make_formatting_params({})
				client.request('textDocument/formatting', params, nil, bufnr)
			end
		end
	})
end
default_on_attach = function(client, bufnr)
	-- attach_keymaps(client, bufnr)
	format_callback(client, bufnr)
end

lspconfig.rust_analyzer.setup {}
lspconfig.ltex.setup {}
lspconfig.lua_ls.setup {}
lspconfig.nil_ls.setup{
	on_attach=default_on_attach,
	cmd = {'nil'},
	settings = {
		['nil'] = {
			nix = {
				flake = {
					autoEvalInputs = true,
					autoArchive = true,
				},
				formatting = {
					command = {'alejandra', '--quiet'},
				}
			}
		}
	}
}

local servers = { 'lua_ls', 'ltex', 'nil_ls', 'rust_analyzer' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup(require('coq').lsp_ensure_capabilities {
    -- on_attach = my_custom_on_attach,
  })
end

--  lspconfig.rust_analyzer.setup{coq.lsp_ensure_capabilities()}
--  lspconfig.lua_ls.setup{coq.lsp_ensure_capabilities()}
--  lspconfig.ltex.setup{coq.lsp_ensure_capabilities()}
