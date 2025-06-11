return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "c",
        "cpp",
        "lua",
        "python",
        "java",
        "rust",
        "javascript",
        "html",
        "css",
        "json",
        "go",
        "markdown",
        "markdown_inline"
      },
      auto_install = true,
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
