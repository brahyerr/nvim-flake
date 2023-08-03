local g = vim.g
g.coq_settings = {
  auto_start = 'shut-up',
  xdg = true,
}

require 'coq_3p' {
  -- { src = "nvimlua", short_name = "nLUA" },
  { src = 'vimtex', short_name = 'vTEX' },
  -- { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
  -- { src = "codeium", short_name = "COD" },
}
