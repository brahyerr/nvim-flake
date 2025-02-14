local map = vim.keymap.set
require('trouble').setup()

map('n', '<leader>xx', '<cmd>TroubleToggle<cr>', { silent = true, noremap = true })
map('n', '<leader>xw', '<cmd>TroubleToggle workspace_diagnostics<cr>', { silent = true, noremap = true })
map('n', '<leader>xd', '<cmd>TroubleToggle document_diagnostics<cr>', { silent = true, noremap = true })
map('n', '<leader>xl', '<cmd>TroubleToggle loclist<cr>', { silent = true, noremap = true })
map('n', '<leader>xq', '<cmd>TroubleToggle quickfix<cr>', { silent = true, noremap = true })
map('n', 'gR', '<cmd>TroubleToggle lsp_references<cr>', { silent = true, noremap = true })
