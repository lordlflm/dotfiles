-- simply put vim.cmd.colorscheme('colorscheme_name') in the config function
-- to activate the default colorscheme
return {
  -- monochrome colorscheme
  {
    'aliqyan-21/darkvoid.nvim',
    -- enabled = false,
    name = 'darkvoid',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      require('darkvoid').setup()
      -- vim.cmd.colorscheme('darkvoid')
    end
  },

  -- vague
  {
    "vague2k/vague.nvim",
    -- enabled = false,
    name = 'vague',
    lazy = false,
    priority = 1000,
    config = function()
      -- NOTE: you do not need to call setup if you don't want to.
      require("vague").setup({
        -- optional configuration here
      })
      -- vim.cmd.colorscheme('vague')
    end
  },

  -- kanagawa
  {
    "rebelot/kanagawa.nvim",
    enabled = true,
    name = "kanagawa",
    lazy = false,
    priority = 1000,
    config = function()
      require("kanagawa").setup({
        -- optional configuration here
        theme = "wave",
        background = {
          dark = "dragon",
          light = "lotus"
        }
      })
      vim.cmd.colorscheme("kanagawa")
    end
  }
}
