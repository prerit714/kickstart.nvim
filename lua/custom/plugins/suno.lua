return {
  name = 'suno',
  dev = true,
  lazy = false,
  dir = '$HOME/Projects/Lua/suno.nvim',
  opts = {
    foo = 'bar',
  },
  config = function()
    require('suno').setup {
      hello = 'world',
    }
  end,
}
