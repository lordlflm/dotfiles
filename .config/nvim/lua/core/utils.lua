local M = {}

function M.get_light_mode()
  local mode_file = vim.fn.expand("~/.light_mode")
  local f = io.open(mode_file, "r")
  if f == nil then
    return "dark" -- default if file doesn't exist
  end
  local mode = f:read("*l")
  f:close()
  if mode == "light" or mode == "dark" then
    return mode
  else
    return "dark"
  end
end

return M
