local splits = require 'smart-splits'
local map = vim.keymap.set

splits.setup()

-- these keymaps will also accept a range,
-- for example `10<A-h>` will `resize_left` by `(10 * config.default_amount)`
map('n', '<A-h>', splits.resize_left)
map('n', '<A-j>', splits.resize_down)
map('n', '<A-k>', splits.resize_up)
map('n', '<A-l>', splits.resize_right)
-- moving between splits
map('n', '<C-h>', splits.move_cursor_left)
map('n', '<C-j>', splits.move_cursor_down)
map('n', '<C-k>', splits.move_cursor_up)
map('n', '<C-l>', splits.move_cursor_right)
-- swapping buffers between windows
map('n', '<leader><leader>h', splits.swap_buf_left)
map('n', '<leader><leader>j', splits.swap_buf_down)
map('n', '<leader><leader>k', splits.swap_buf_up)
map('n', '<leader><leader>l', splits.swap_buf_right)
-- make split
-- map('n', '<leader>ss', Split)
-- map('n', '<leader>sv', Vsplit)
map("n", "<leader>ss", "<cmd>split<CR>")
map("n", "<leader>sv", "<cmd>vsplit<CR>")
