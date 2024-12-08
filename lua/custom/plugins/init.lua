return {
  -- NOTE: Using trouble
  {
    'folke/trouble.nvim',
    opts = {}, -- for default options, refer to the configuration section for custom setup.
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
  },

  -- NOTE: Harpoon plugin configuration
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    opts = {
      menu = {
        width = vim.api.nvim_win_get_width(0) - 4,
      },
      settings = {
        save_on_toggle = true,
      },
    },
    keys = function()
      local keys = {
        {
          '<leader>H',
          function()
            require('harpoon'):list():add()
            print '[Harpoon] Harpooned current buffer'
          end,
          desc = '[Harpoon] Harpooned current buffer',
        },
        {
          '<leader>h',
          function()
            local harpoon = require 'harpoon'
            harpoon.ui:toggle_quick_menu(harpoon:list())
            print '[Harpoon] Show Quick Menu'
          end,
          desc = '[Harpoon] Show Quick Menu',
        },
        {
          'H',
          function()
            require('harpoon'):list():prev()
            print '[Harpoon] Goto previous buffer'
          end,
          desc = '[Harpoon] Goto previous buffer',
        },
        {
          'L',
          function()
            require('harpoon'):list():next()
            print '[Harpoon] Goto next buffer'
          end,
          desc = '[Harpoon] Goto next buffer',
        },
      }

      for i = 1, 5 do
        table.insert(keys, {
          '<leader>' .. i,
          function()
            require('harpoon'):list():select(i)
            print('[Harpoon] Go to buffer', i)
          end,
          desc = '[Harpoon] Go to buffer' .. i,
        })
      end
      return keys
    end,
  },

  -- NOTE: My setup for c++ single file competitive programming
  {
    'prerit714/suno.nvim',
    name = 'suno',
    lazy = false,
    config = function()
      require('suno').setup()
    end,
  },

  -- NOTE: Using vim fugitive from now on
  {
    'tpope/vim-fugitive',
    lazy = false,
  },

  -- NOTE: Using a good search and replace plugin
  {
    'MagicDuck/grug-far.nvim',
    config = function()
      require('grug-far').setup {
        -- options, see Configuration section below
        -- there are no required options atm
        -- engine = 'ripgrep' is default, but 'astgrep' can be specified
      }
    end,
  },

  {
    'stevearc/oil.nvim',
    config = function()
      local oil = require 'oil'
      oil.setup {
        keymaps = {
          -- create a new mapping, gs, to search and replace in the current directory
          gs = {
            callback = function()
              -- get the current directory
              local prefills = { paths = oil.get_current_dir() }

              local grug_far = require 'grug-far'
              -- instance check
              if not grug_far.has_instance 'explorer' then
                grug_far.open {
                  instanceName = 'explorer',
                  prefills = prefills,
                  staticTitle = 'Find and Replace from Explorer',
                }
              else
                grug_far.open_instance 'explorer'
                -- updating the prefills without clearing the search and other fields
                grug_far.update_instance_prefills('explorer', prefills, false)
              end
            end,
            desc = 'oil: Search in directory',
          },
        },
        -- rest of your config
      }
    end,
  },
}
