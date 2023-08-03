require('telescope').load_extension 'file_browser'

vim.api.nvim_set_keymap('n', '<space>fb', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { noremap = true })
-- vim.keymap.set("n", "<leader>fb", "<cmd> Telescope file_browser path=%:p:h select_buffer=true<CR>")
