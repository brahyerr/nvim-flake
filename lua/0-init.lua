vim.loader.enable()

local o = vim.opt
local g = vim.g
local home = vim.env.HOME

-- Autocmds
vim.cmd [[
autocmd BufReadPost ~/School/* setlocal foldlevel=3
autocmd BufReadPost ~/Coding/Notes/* setlocal foldlevel=3
autocmd BufReadPost ~/Notes/* setlocal foldlevel=3
autocmd FileType nix setlocal shiftwidth=2

]]
-- autocmd VimEnter ~/Coding/* execute 'Neorg workspace Coding'
-- autocmd VimEnter ~/Notes/* execute 'Neorg workspace Notes'
-- augroup MyColors
--   au!
--   au ColorScheme * highlight Normal guibg=none ctermbg=none
--   au ColorScheme * highlight LineNr guibg=none ctermbg=none
--   au ColorScheme * highlight Folded guibg=none ctermbg=none
--   au ColorScheme * highlight NonText guibg=none ctermbg=none
--   au ColorScheme * highlight SpecialKey guibg=none ctermbg=none
--   au ColorScheme * highlight VertSplit guibg=none ctermbg=none
--   au ColorScheme * highlight SignColumn guibg=none ctermbg=none
--   au ColorScheme * highlight EndOfBuffer guibg=none ctermbg=none
-- augroup CursorLine
--   au!
--   au VimEnter * setlocal cursorline
--   au WinEnter * setlocal cursorline
--   au BufWinEnter * setlocal cursorline
--   au WinLeave * setlocal nocursorline
-- augroup END

-- augroup end

-- Keybinds
local map = vim.api.nvim_set_keymap
local opts = { silent = true, noremap = true }

-- map("n", "<C-h>", "<C-w>h", opts)
-- map("n", "<C-j>", "<C-w>j", opts)
-- map("n", "<C-k>", "<C-w>k", opts)
-- map("n", "<C-l>", "<C-w>l", opts)
map('n', '<Esc>', ':noh <CR>', opts)
-- map('n', '<C-f>', ':HopWord <CR>', opts)
-- map('n', '<C-g>', ':Telescope live_grep <CR>', opts)
-- map('n', '<C-f>', ':Telescope find_files <CR>', opts)
-- map('n', '<C-b>', ':NeoTreeFocusToggle <CR>', opts)
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('n', ';', ':', { noremap = true } )

-- map leader keys
map('n', ' ', '<Nop>', opts)
g.mapleader = ' '
g.maplocalleader = ','

-- vimtex viewer
g.vimtex_view_method = 'zathura'

-- set message level
g.cmdheight = 2

-- Set folds
o.foldmethod = "expr"
o.foldlevel = 99
o.foldnestmax = 3
o.foldexpr = "nvim_treesitter#foldexpr()"     -- Without these lines, I wouldn't be able to fold things (like in Neorg)

-- Set concealer settings
o.conceallevel = 2

-- Undo history
o.undofile = true
o.undodir = home .. "/.local/share/nvim/undodir"
o.undolevels = 3000

-- Performance
o.lazyredraw = false;
o.shell = "zsh"
o.shadafile = "NONE"

-- Colors
o.termguicolors = true

-- Undo files
o.undofile = true

-- Indentation
o.smartindent = true
o.tabstop = 2
o.shiftwidth = 4
o.shiftround = true
o.expandtab = true
o.scrolloff = 3

-- Set clipboard to use system clipboard
o.clipboard = "unnamedplus"

-- Use mouse
o.mouse = "a"

-- Nicer UI settings
o.cursorline = true
o.relativenumber = true
o.number = true

-- Get rid of annoying viminfo file
o.viminfo = ""
o.viminfofile = "NONE"

-- Miscellaneous quality of life
o.ignorecase = true
o.ttimeoutlen = 5
o.hidden = true
o.shortmess = "atI"
o.wrap = false
o.backup = false
o.writebackup = false
o.errorbells = false
o.swapfile = false
o.showmode = false
o.laststatus = 3
o.pumheight = 6
o.splitright = true
o.splitbelow = true
o.completeopt = "menuone,noselect"

