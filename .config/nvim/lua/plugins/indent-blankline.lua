return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  config = function()
    require("ibl").setup({
      indent = { char = "│" },
      scope = {
        enabled = true,
        show_start = false, -- ⛔ disable top marker
        show_end = false,   -- ⛔ disable bottom marker
        highlight = { "IblScope" },
      },
      -- TODO adjust color
      vim.api.nvim_set_hl(0, "IblScope", { fg = "#fab387" })
    })
  end
}
