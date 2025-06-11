return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    win = {
      border = "rounded",
      wo = {
        winblend = 10, -- transparency
      }
    }
    --     border = "rounded",       -- none, single, double, shadow
    --     position = "bottom",      -- or "top"
    --     margin = { 1, 0, 1, 0 },  -- top, right, bottom, left
    --     padding = { 1, 2, 1, 2 }, -- top, right, bottom, left
    --     winblend = 10,            -- transparency
    --   },
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  },
}
