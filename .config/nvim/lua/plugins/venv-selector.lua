return {
  "linux-cultist/venv-selector.nvim",
  dependencies = {
    -- "neovim/nvim-lspconfig",
    -- "mfussenegger/nvim-dap", "mfussenegger/nvim-dap-python", --optional
    { "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
  },
  lazy = false,
  branch = "regexp", -- This is the regexp branch, use this for the new version
  keys = {
    { ",v", "<cmd>VenvSelect<cr>" },
  },
  ---@type venv-selector.Config
  opts = {
    name = ".venv",              -- Default venv folder name to look for
    auto_activate = true,        -- Auto-activate when opening a Python file/project
    auto_refresh = true,         -- Refresh list when opening Telescope
    search_venv_managers = true, -- Support Poetry, Pipenv, Conda
    parents = 2,                 -- Look up the folder tree for venvs
  },
}
