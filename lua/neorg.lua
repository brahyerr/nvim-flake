require('neorg').setup {
  load = {
    ['core.defaults'] = {}, -- Loads default behaviour
    ['core.keybinds'] = {
      config = {
        hook = function(keybinds)
          keybinds.remap_key('norg', 'i', '<M-CR>', '<C-CR>') -- Remaps the iterate bind, since it interferes with wezterm
        end,
      },
    },
    ['core.concealer'] = { -- Adds pretty icons to your documents
      config = {
        icons = {
          heading = {
            icons = { '◉', '◎', '○', '◈', '▶', '↪' },
          },
          todo = {
            pending = { icon = '' },
            done = { icon = '✔' },
          },
        },
      },
    },
    ['core.export'] = {}, -- Export .norg format to other formats
    ['core.autocommands'] = {},
    ['core.tempus'] = {}, -- Does not work without a newer verison of nvim
    ['core.ui.calendar'] = {}, -- Does not work without a newer verison of nvim
    ['core.promo'] = {},
    ['core.itero'] = {}, -- automatically add heading/list prefix based on context
    ['core.integrations.telescope'] = {}, -- Make it easy to find and create links using telescope
    ['core.summary'] = {}, -- Generate workspace summaries
    ['core.dirman'] = { -- Manages Neorg workspaces
      config = {
        workspaces = {
          Coding = '~/Coding',
          Fitness = '~/School/fitness',
          School = '~/School',
        },
        default_workspace = 'School',
        conceallevel = 2,
      },
    },
  },
}
