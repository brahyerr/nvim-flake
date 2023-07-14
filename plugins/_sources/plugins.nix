{
  lib,
  config,
  pkgs,
  inputs,
  ...
}:
### This neovim config was nicked from notusknot's dotfiles-nix repo. ###
with lib; let
  cfg = config.modules.hm.terminal.neovim;
  vim-moonfly-colors = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "vim-moonfly-colors";
    version = "2023-06-19";
    src = pkgs.fetchFromGitHub {
      owner = "bluz71";
      repo = "vim-moonfly-colors";
      rev = "77c9a89d4f9474fb415d142e8385634717157737";
      sha256 = "0k3l0sfz4bx8z65s6z8h17bpp1vd2rssmg1nr29cvcgy8m7257r3";
    };
    meta.homepage = "https://github.com/bluz71/vim-moonfly-colors/";
  };
  neorg-telescope = pkgs.vimUtils.buildVimPluginFrom2Nix {
    pname = "neorg-telescope";
    version = "2023-05-20";
    src = pkgs.fetchFromGitHub {
      owner = "nvim-neorg";
      repo = "neorg-telescope";
      rev = "d24f445c912451ddbf17cbe8da36561b51b10d39";
      sha256 = "00nn3v2294mzd1y35r4ykns42n3n0zmfg1q3dybmvv2lnrz8a9n5"; # I used the wrong hash before and for some reason it built
    };
  };
in {
  options.modules.hm.terminal.neovim = {
    enable = mkEnableOption "nvim";
    package = pkgs.neovim-nightly;
    colorScheme = mkOption { 
      type = types.pkgs; default = with pkgs.vimPlugins; vim-moonfly-colors;
      description = "Neovim colorscheme to use. Specify the package name, but not the `pkgs.vimPlugins` prefix.";
    };
  };
  config = mkIf cfg.enable {
    home.file.".config/nvim/settings.lua".source = ./config/init.lua;

    home.packages = with pkgs; [
      rnix-lsp
      alejandra deadnix statix # Nix
      ripgrep
      fd
      fzf
      lua-language-server
      stylua # Lua
      ltex-ls # LaTeX, I feel like I should put this in a dev shell, rather than globally
      tree-sitter
      texlive.combined.scheme-full
    ];

    programs.neovim = {
      enable = true;
      plugins = with pkgs.vimPlugins; [
        vim-nix
        vimtex
        #packer
        #lazy.nvim
        #nvim tab splitter
        nui-nvim # dependency for neo-tree, noice.nvim
        plenary-nvim
        coq-artifacts
        {
          plugin = coq_nvim;
          config = ''
            lua << EOF
            local g = vim.g
            g.coq_settings = {
              auto_start = "shut-up",
            }
            EOF
          '';
        }
        {
          plugin = vim-moonfly-colors;
          config = ''
          lua << EOF
          vim.g.moonflyTransparent = true
          vim.g.moonflyCursorColor = true
          vim.g.moonflyNormalFloat = true
          vim.g.moonflyTerminalColors = true
          vim.g.moonflyTransparent = true
          vim.g.moonflyUndercurls = true
          vim.g.moonflyUnderlineMatchParen = true
          vim.g.moonflyVirtualTextColor = true
          vim.cmd [[colorscheme moonfly]]
          EOF
          '';
        }
        #{
        #  plugin = impatient-nvim;           # apparently outdated as of nvim 0.9, put ``vim.loader.enable() at the top of init.lua``
        #  config = "lua require('impatient')";
        #}
        {
          plugin = lualine-nvim;
          config = "lua require('lualine').setup()";
        }
        {
          plugin = telescope-nvim;
          config = ''
            lua << EOF
            local scope = require('telescope')
            scope.setup()
            scope.load_extension('notify')
            scope.load_extension('noice')
            EOF
          '';
        }
        {
          plugin = neogen;                                # Generate annotations with :Neogen
          config = "lua require('neogen').setup()";
        }
        {
          plugin = toggleterm-nvim;
          config = "lua require('toggleterm').setup()";
        }
        {
          plugin = indent-blankline-nvim;
          config = "lua require('indent_blankline').setup()";
        }
        {
          plugin = nvim-web-devicons; # dependency for neo-tree, trouble.nvim
          config = "lua require('nvim-web-devicons').setup()";
        }
        {
          plugin = neo-tree-nvim;
          config = "lua require('neo-tree').setup()";
        }
        {
          plugin = nvim-notify; # dependency for noice.nvim
          config = ''
          lua << EOF
          require('notify').setup({
            background_colour = "#0b0c16",
          })
          EOF
          '';
        }
        {
          plugin = clipboard-image-nvim;
          config = ''
            lua << EOF
            local map = vim.keymap.set

            map("n", "<leader>pp", "<cmd>PasteImg<cr>",
              {silent = true, noremap = true}
            )
            EOF
          '';

        }
        {
          plugin = comment-nvim;
          config = "lua require('Comment').setup()";
        }
        {
          plugin = noice-nvim;
          config = ''
            lua << EOF
            require("noice").setup({
              lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                  ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                  ["vim.lsp.util.stylize_markdown"] = true,
                  ["cmp.entry.get_documentation"] = true,
                  -- message = {
                    -- Messages shown by lsp servers
                    -- enabled = true,
                    -- view = "notify",
                    -- opts = {},
                  -- },
                },
              },
              -- you can enable a preset for easier configuration
              presets = {
                bottom_search = false, -- use a classic bottom cmdline for search
                command_palette = true, -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false, -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false, -- add a border to hover docs and signature help
              },
              messages = {
                -- NOTE: If you enable messages, then the cmdline is enabled automatically.
                -- This is a current Neovim limitation.
                enabled = true, -- enables the Noice messages UI
                view = "mini", -- default view for messages
                view_error = "notify", -- view for errors
                view_warn = "notify", -- view for warnings
                view_history = "messages", -- view for :messages
                view_search = false,
                -- view_search = "virtualtext", -- view for search count messages. Set to `false` to disable
              },
              views = {
                cmdline_popup = {
                  position = {
                    row = 10,
                    col = "50%",
                  },
                },
              },
            })
            EOF
          '';
        }
        {
          plugin = trouble-nvim;
          config = ''
            lua << EOF
            local map = vim.keymap.set
            require('trouble').setup()

            map("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
              {silent = true, noremap = true}
            )
            map("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
              {silent = true, noremap = true}
            )
            map("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
              {silent = true, noremap = true}
            )
            map("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
              {silent = true, noremap = true}
            )
            map("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
              {silent = true, noremap = true}
            )
            map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
              {silent = true, noremap = true}
            )
            EOF
          '';
        }
        #{
        #  plugin = lazy-nvim;    # I want to be able to use lazy nvim without the auto-update feature, also want to not use tags
        #  config = ''
        #    lua << EOF

        #    -- Find a way to generate the list of plugins with Nix functions
        #    local plugins = {
        #      'LnL7/vim-nix',
        #      'MunifTanjim/nui.nvim',
        #      'nvim-lua/plenary.nvim',
        #      'ms-jpq/coq_nvim',
        #      'ms-jpq/coq.artifacts',
        #      'nvim-lualine/lualine.nvim',
        #      {
        #        'nvim-telescope/telescope.nvim',
        #        -- tag = '0.1.1',
        #        dependencies = { 'nvim-lua/plenary.nvim' }
        #      }

        #    }

        #  '';
        #}
        {
          plugin = neorg;
          config = ''
            lua << EOF
            require('neorg').setup {
              load = {
                ["core.defaults"] = {}, -- Loads default behaviour
                ["core.keybinds"] = {
                  config = {
                    hook = function(keybinds)
                      keybinds.remap_key("norg", "i", "<M-CR>", "<C-CR>")   -- Remaps the iterate bind, since it interferes with wezterm
                    end,
                  },
                },
                ["core.concealer"] = {}, -- Adds pretty icons to your documents
                ["core.export"] = {},    -- Export .norg format to other formats
                ["core.autocommands"] = {},
                ["core.tempus"] = {},      -- Does not work without a newer verison of nvim
                ["core.ui.calendar"] = {}, -- Does not work without a newer verison of nvim
                ["core.promo"] = {},
                ["core.itero"] = {},     -- automatically add heading/list prefix based on context
                ["core.integrations.telescope"] = {},             -- Make it easy to find and create links using telescope
                ["core.dirman"] = { -- Manages Neorg workspaces
                  config = {
                    workspaces = {
                      Coding = "~/Coding",
                      Notes = "~/Notes",
                      School = "~/School",
                    },
                    default_workspace = "School",
                    conceallevel = 2,
                  },
                },
              },
            }
            EOF
          '';
        }
        {
          plugin = neorg-telescope;
          config =  ''
            lua << EOF
            local neorg_callbacks = require("neorg.callbacks")

            neorg_callbacks.on_event("core.keybinds.events.enable_keybinds", function(_, keybinds)
              -- Map all the below keybinds only when the "norg" mode is active
              keybinds.map_event_to_mode("norg", {
                n = { -- Bind keys in normal mode
                  { "<C-s>", "core.integrations.telescope.find_linkable" },
                },

                i = { -- Bind in insert mode
                  { "<C-l>", "core.integrations.telescope.insert_link" },
                },
              }, 
              {
                silent = true,
                noremap = true,
              })
            end)
            EOF
          '';
        }
        {
          plugin = hop-nvim;
          config = ''
            lua << EOF
            local hop = require('hop')
            local map = vim.keymap.set
            hop.setup()

            local directions = require('hop.hint').HintDirection
            map("", 'f', function()
              hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true })
            end, {remap=true})
            map("", 'F', function()
              hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true })
            end, {remap=true})
            map("", 't', function()
              hop.hint_char1({ direction = directions.AFTER_CURSOR, current_line_only = true, hint_offset = -1 })
            end, {remap=true})
            map("", 'T', function()
              hop.hint_char1({ direction = directions.BEFORE_CURSOR, current_line_only = true, hint_offset = 1 })
            end, {remap=true})
            EOF
          '';
        }
        {
          plugin = smart-splits-nvim; # No default keymaps, need to manually configure. Not recommended to lazy load with wezterm.
          config = ''
            lua << EOF
            local splits = require('smart-splits')
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

            EOF
          '';
        }
        {
          plugin = lazy-lsp-nvim;
          config = ''
            lua << EOF
            require('lazy-lsp').setup {
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
            }
            EOF
          '';
        }
        {
          plugin = null-ls-nvim;
          config = ''
            lua << EOF
            local null_ls = require("null-ls")
            local nb = require('null-ls').builtins

            null_ls.setup({
              sources = {
                nb.formatting.stylua,
                nb.formatting.alejandra,
                -- nb.diagnostics.eslint,   -- not needed, not using node
                -- nb.diagnostics.cppcheck, -- not needed, not using cpp
                nb.diagnostics.deadnix,
                nb.code_actions.statix,
                nb.completion.spell,
              },
            })
            EOF
          '';
        }
        {
          plugin = nvim-lspconfig;
          config = ''
            lua << EOF
            local lsp = require('lspconfig')
            local coq = require('coq')

            -- require('lspconfig').rust_analyzer.setup{}
            -- require('lspconfig').lua_ls.setup{}
            -- require('lspconfig').rnix.setup{}

            lsp.rust_analyzer.setup{coq.lsp_ensure_capabilities()}
            lsp.lua_ls.setup{coq.lsp_ensure_capabilities()}
            lsp.rnix.setup{coq.lsp_ensure_capabilities()}
            lsp.ltex.setup{coq.lsp_ensure_capabilities()}
            EOF
          '';
        }
        ### Global
        nvim-treesitter-parsers.bash
        nvim-treesitter-parsers.markdown
        nvim-treesitter-parsers.markdown_inline
        nvim-treesitter-parsers.regex
        nvim-treesitter-parsers.lua
        nvim-treesitter-parsers.nix
        nvim-treesitter-parsers.yaml
        nvim-treesitter-parsers.org         # neorg tries to automatically install parsers when entering a .norg file with `core.defaults` loaded.
        nvim-treesitter-parsers.norg        # neorg tries to write to store paths which is a no-no. Installing parser plugins prevents this (?)

        nvim-treesitter-parsers.java        # I want to move this parser to a dev shell definition in a java project folder
        nvim-treesitter-parsers.html        # Same with html
        nvim-treesitter-parsers.python      # Same with python
        nvim-treesitter-parsers.sxhkdrc     # This too, since it doesn't really make sense to have this available globally
        nvim-treesitter-context
        {
          plugin = nvim-treesitter;
          config = ''
            lua << EOF
            require('nvim-treesitter.configs').setup {
              highlight = {
                enable = true,
                  additional_vim_regex_highlighting = false,
                },
            }
            EOF
          '';
        }
      ];

      extraConfig = ''
        luafile ~/.config/nvim/settings.lua
      '';
    };
  };
}
