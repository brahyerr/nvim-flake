local g = vim.g
g.coq_settings = {
  auto_start = 'shut-up',
  xdg = true,
  display = {
    pum = {
	    source_context = {"[", "]"},
    },
    icons = {
      mappings = {
        Text = '',
        Method = '',
        Function = 'λ',
        Constructor = '',
        Field = '',
        Variable = 'х',
        Class = '',
        Interface = '',
        Module = '',
        Property = '∅',
        Unit = 'Δ',
        Value = 'Δ',
        Enum = '◉',
        Keyword = '',
        Snippet = '',
        Color = '',
        File = '',
        Reference = '',
        Folder = '',
        EnumMember = '',
        Constant = 'π',
        Struct = '',
        Event = '',
        Operator = '',
        TypeParameter = '',
      },
    },
  },
}
require 'coq_3p' {
  -- { src = "nvimlua", short_name = "nLUA" },
  { src = 'vimtex', short_name = 'vTEX' },
  -- { src = "copilot", short_name = "COP", accept_key = "<c-f>" },
  -- { src = "codeium", short_name = "COD" },
}
