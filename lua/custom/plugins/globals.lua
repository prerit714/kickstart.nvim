--[[
--All the stuff here is recommended by TJ :)
--]]

---Prints the passed input from the lua runtime
---@param v any
---@return any
P = function(v)
  print(vim.inspect(v))
  return v
end

RELOAD = function(...)
  return require('plenary.reload').reload_module(...)
end

---Reloads the input module
---@param name string
---@return unknown
R = function(name)
  RELOAD(name)
  return require(name)
end

-- Just for the sake of lazy do the below
local M = {}

return M
