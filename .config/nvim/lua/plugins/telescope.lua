return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').setup({
        -- follow symlinks with find files and live grep
        pickers = {
          find_files = {
            find_command = { "fd", "--type", "f", "--follow", "--hidden", "--exclude", ".git" },
          },
          live_grep = {
            additional_args = function()
              return { "--follow" }
            end,
          },
        },
      })

      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find file' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Fuzz grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Find buffer' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find help documentation' })
      vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = 'Find symbols in document' })
      vim.keymap.set('n', '<leader>fS', builtin.lsp_workspace_symbols, { desc = 'Find symbols in workspace' })
      -- vim.keymap.set('n', '<leader>fc', builtin.colorscheme, { desc = 'Switch colorscheme' })
      vim.keymap.set('n', '<leader>hc', builtin.command_history, { desc = 'Command history' })
      vim.keymap.set('n', '<leader>hs', builtin.search_history, { desc = 'Search history' })
      -- vim.keymap.set('n', '<leader>q', builtin.quickfix, { desc = 'Quickfix list' })
      vim.keymap.set('n', '<leader>ft', builtin.treesitter, { desc = 'Find Treesitter symbols' })
    end
  },
  {
    'nvim-telescope/telescope-ui-select.nvim',
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  }
}
