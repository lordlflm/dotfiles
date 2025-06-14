return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    win = {
      border = "rounded",
      wo = {
        winblend = 10, -- transparency
      }
    },
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
  config = function()
    local wk = require("which-key")
    wk.add({
      { "<leader>f", group = "Find" },        -- group
      { "<leader>h", group = "History" },     -- group
      { "<leader>g", group = "Lsp" },         -- group
      { "<leader>d", group = "Diagnostics" }, -- group
    })
  end,
}
