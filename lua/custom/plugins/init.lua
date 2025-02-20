return {
  -- NOTE: Using trouble
  {
    'folke/trouble.nvim',
    opts = {
      win = {
        position = 'right',
      },
    },
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
  -- NOTE: Using vim fugitive from now on
  {
    'tpope/vim-fugitive',
    lazy = false,
  },
  -- NOTE: Using grug far for search and replace
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
}
