-- local attach_keymaps = function(client, bufnr)
--   local opts = { noremap=true, silent=true }
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgn', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lgp', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lwl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>lh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ls', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
--   vim.api.nvim_buf_set_keymap(bufnr, 'n', '<leader>ln', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
-- end

-- null-ls
local null_ls = require("null-ls")
local nb = require("null-ls").builtins

null_ls.setup({
	sources = {
		nb.formatting.stylua,
		nb.formatting.alejandra,
		-- nb.diagnostics.eslint,   -- not needed, not using node
		-- nb.diagnostics.cppcheck, -- not needed, not using cpp
		nb.diagnostics.deadnix,
		nb.code_actions.statix,
		-- nb.completion.spell,
	},
})

-- lspconfig
local lspc = require("lspconfig")
local coq = require("coq")

-- require('lspconfig').rust_analyzer.setup{}
-- require('lspconfig').lua_ls.setup{}
-- require('lspconfig').rnix.setup{}

-- lspc.rust_analyzer.setup{coq.lsp_ensure_capabilities()}
-- lspc.lua_ls.setup{coq.lsp_ensure_capabilities()}
-- lspc.rnix.setup{coq.lsp_ensure_capabilities()}
-- lspc.ltex.setup{coq.lsp_ensure_capabilities()}

-- lazy-lsp
require("lazy-lsp").setup({
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
		nix = { "rnix" },
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
})

-- SECTION: lspkind

require("lspkind").init({
	-- DEPRECATED (use mode instead): enables text annotations
	--
	-- default: true
	-- with_text = true,

	-- defines how annotations are shown
	-- default: symbol
	-- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
	mode = "symbol_text",

	-- default symbol map
	-- can be either 'default' (requires nerd-fonts font) or
	-- 'codicons' for codicon preset (requires vscode-codicons font)
	--
	-- default: 'default'
	preset = "codicons",

	-- override preset symbols
	--
	-- default: {}
	symbol_map = {
		Text = "󰉿",
		Method = "󰆧",
		Function = "󰊕",
		Constructor = "",
		Field = "󰜢",
		Variable = "󰀫",
		Class = "󰠱",
		Interface = "",
		Module = "",
		Property = "󰜢",
		Unit = "󰑭",
		Value = "󰎠",
		Enum = "",
		Keyword = "󰌋",
		Snippet = "",
		Color = "󰏘",
		File = "󰈙",
		Reference = "󰈇",
		Folder = "󰉋",
		EnumMember = "",
		Constant = "󰏿",
		Struct = "󰙅",
		Event = "",
		Operator = "󰆕",
		TypeParameter = "",
	},
})
