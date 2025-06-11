return {
  "olimorris/codecompanion.nvim",
  enabled = false,
  opts = {
    strategies = {
      chat = {
        adapter = "openai",
      },
      inline = {
        adapter = "openai",
      },
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
}
