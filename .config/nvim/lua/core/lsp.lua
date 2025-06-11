local lsp_configs = {}
local lsp_dir = vim.fn.stdpath("config") .. "/lua/lsp"

for _, file in ipairs(vim.fn.globpath(lsp_dir, "*.lua", false, true)) do
  local name = vim.fn.fnamemodify(file, ":t:r") -- get filename without extension
  lsp_configs[name] = require("lsp." .. name)
end

-- Register all loaded configs
for name, config in pairs(lsp_configs) do
  vim.lsp.config[name] = config
end

-- Enable all servers you just loaded
vim.lsp.enable(vim.tbl_keys(lsp_configs))
