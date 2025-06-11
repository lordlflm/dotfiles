return {
  -- Mason
  {
    "williamboman/mason.nvim",
    config = function()
      require('mason').setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
          }
        }
      })
    end
  },

  --   local on_attach = function(client, bufnr)
  --   opts.buffer = bufnr
  --   opts.desc = 'Go to definition'
  --   keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
  --   opts.desc = 'Go to declaration'
  --   keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
  --   opts.desc = 'Go to implementation'
  --   keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
  --   opts.desc = 'Show code actions'
  --   keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  --   opts.desc = 'Rename variable'
  --   keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  --   opts.desc = 'Hover function'
  --   keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
  --   opts.desc = 'Show diagnostic'
  --   keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
  -- end

}
