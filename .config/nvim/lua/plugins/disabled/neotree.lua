return {
  "nvim-neo-tree/neo-tree.nvim",
  enabled = false,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  config = function()
    require("neo-tree").setup({
      use_libuv_file_watcher = true,
      filesystem = {
        follow_current_file = {
          enabled = true,
        }
      },
    })

    vim.keymap.set('n', '<leader>t', ':Neotree filesystem toggle left<CR>', { desc = 'Show filesystem' })
  end
}
