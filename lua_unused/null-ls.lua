local null_ls = require 'null-ls'
local nb = require('null-ls').builtins

null_ls.setup {
  sources = {
    nb.formatting.stylua,
    nb.formatting.alejandra,
    -- nb.diagnostics.eslint,   -- not needed, not using node
    -- nb.diagnostics.cppcheck, -- not needed, not using cpp
    nb.diagnostics.statix,
    -- nb.diagnostics.deadnix,
    nb.code_actions.statix,
    nb.completion.spell,
  },
}
