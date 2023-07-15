-- SECTION: telescope
local telescope = require('telescope')

telescope.setup {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case"
    },
    pickers = {
      find_command = {
        "fd",
      },
    },
  }
}

-- telescope.load_extension('notify')
-- telescope.load_extension('noice')

vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers<CR>")
vim.keymap.set("n", "<leader>ff", "<cmd> Telescope find_files<CR>")
vim.keymap.set("n", "<leader>fg", "<cmd> Telescope live_grep<CR>")
vim.keymap.set("n", "<leader>fh", "<cmd> Telescope help_tags<CR>")
vim.keymap.set("n", "<leader>flD", "<cmd> Telescope lsp_definitions<CR>")
vim.keymap.set("n", "<leader>fld", "<cmd> Telescope diagnostics<CR>")
vim.keymap.set("n", "<leader>fli", "<cmd> Telescope lsp_implementations<CR>")
vim.keymap.set("n", "<leader>flr", "<cmd> Telescope lsp_references<CR>")
vim.keymap.set("n", "<leader>fls", "<cmd> Telescope lsp_document_symbols<CR>")
vim.keymap.set("n", "<leader>fls", "<cmd> Telescope lsp_workspace_symbols<CR>")
vim.keymap.set("n", "<leader>flt", "<cmd> Telescope lsp_type_definitions<CR>")
vim.keymap.set("n", "<leader>fn", "<cmd> Telescope notify<CR>")
vim.keymap.set("n", "<leader>fs", "<cmd> Telescope treesitter<CR>")
vim.keymap.set("n", "<leader>ft", "<cmd> Telescope<CR>")
vim.keymap.set("n", "<leader>fvb", "<cmd> Telescope git_branches<CR>")
vim.keymap.set("n", "<leader>fvc", "<cmd> Telescope git_bcommits<CR>")
vim.keymap.set("n", "<leader>fvw", "<cmd> Telescope git_commits<CR>")
vim.keymap.set("n", "<leader>fvs", "<cmd> Telescope git_status<CR>")
vim.keymap.set("n", "<leader>fvx", "<cmd> Telescope git_stash<CR>")


