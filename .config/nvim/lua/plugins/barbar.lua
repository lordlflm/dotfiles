return {
  {
    'romgrk/barbar.nvim',
    dependencies = {
      'lewis6991/gitsigns.nvim',     -- OPTIONAL: for git status
      'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    },
    init = function() vim.g.barbar_auto_setup = false end,
    opts = {
      -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
      -- animation = true,
      -- insert_at_start = true,
      -- …etc.
    },
    version = '^1.0.0', -- optional: only update when a new 1.x version is released
    config = function()
      local map = vim.api.nvim_set_keymap
      local opts = { noremap = true, silent = true }
      require('barbar').setup({
        pinned = { filename = true },

        -- Move to previous/next
        map('n', '<A-Left>', '<Cmd>BufferPrevious<CR>', opts),
        map('n', '<A-Right>', '<Cmd>BufferNext<CR>', opts),
        -- pin
        map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts),
        --reorder
        map('n', '<A-,>', '<Cmd>BufferMovePrevious<CR>', opts),
        map('n', '<A-.>', '<Cmd>BufferMoveNext<CR>', opts),
        -- close
        map('n', '<A-c>', '<Cmd>BufferClose<CR>', opts)
      })
    end
  },
}
