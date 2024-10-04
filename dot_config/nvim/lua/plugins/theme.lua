return {
  -- colorscheme
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      vim.g.everforest_enable_italic = true
      vim.cmd.colorscheme('everforest')
    end
  },

  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { 
          theme = 'everforest'
        }
      })
    end
  },

  -- mini nvim icons
  { 
  'echasnovski/mini.nvim', 
  version = false,
  config = function()
    require('mini.icons').setup()
  end
  }
}
