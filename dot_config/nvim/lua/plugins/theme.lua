return {
  -- colorscheme
  {
    'RedsXDD/neopywal.nvim',
    name = 'neopywal',
    lazy = false,
    priority = 1000,
    config = function()
      -- Optionally configure and load the colorscheme
      -- directly inside the plugin declaration.
      require('neopywal').setup()
      vim.cmd.colorscheme('neopywal')
    end
  },

  -- lualine
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      require('lualine').setup({
        options = { 
          theme = 'neopywal'
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
