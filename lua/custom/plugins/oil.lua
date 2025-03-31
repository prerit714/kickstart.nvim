return {
  'stevearc/oil.nvim',
  -- Optional dependencies
  dependencies = vim.g.have_nerd_font or { 'nvim-tree/nvim-web-devicons' },
  opts = {
    default_file_explorer = true,
  },
}
