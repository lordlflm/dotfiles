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

  -- Mason lsp config
  {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    config = function()
      require('mason-lspconfig').setup({
        ensure_installed = {
          -- lua
          'lua_ls',
          -- c/c++
          'clangd',
          -- Python
          'flake8',
          'black',
          'isort',
          'pyright',
          -- web
          'angular-language-server',
          'eslint-lsp',
          -- java
          'java-language-server',
          -- rust
          'rust-analyser',

        }
      })
    end
  },

  -- lsp config
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require('cmp_nvim_lsp')
      local capabilities = cmp_nvim_lsp.default_capabilities()
      local opts = { noremap = true, silent = true }
      local keymap = vim.keymap

      local on_attach = function(client, bufnr)
        opts.buffer = bufnr
        opts.desc = 'Go to definition'
        keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)
        opts.desc = 'Go to declaration'
        keymap.set('n', '<leader>gD', vim.lsp.buf.declaration, opts)
        opts.desc = 'Go to implementation'
        keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)
        opts.desc = 'Show code actions'
        keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        opts.desc = 'Rename variable'
        keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        opts.desc = 'Hover function'
        keymap.set('n', '<leader>h', vim.lsp.buf.hover, opts)
        opts.desc = 'Show diagnostic'
        keymap.set('n', '<leader>e', vim.diagnostic.open_float, opts)
      end

      -- lua
      lspconfig.lua_ls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      -- c/c++
      lspconfig.clangd.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      -- python
      lspconfig.pyright.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      -- web
      lspconfig.angularls.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      lspconfig.eslint.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      -- java
      lspconfig.java_language_server.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
      -- rust
      lspconfig.rust_analyser.setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end
  },

  -- none ls
  {
    "nvimtools/none-ls.nvim",
    config = function()
      local null_ls = require("null-ls")

      null_ls.setup({
        sources = {
          -- c/c++
          null_ls.builtins.formatting.clang_format,
          -- lua
          null_ls.builtins.formatting.stylua,
          -- web
          null_ls.builtins.formatting.prettier,
          -- python
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.isort,
        }
      })

      vim.keymap.set('n', '<leader>gf', vim.lsp.buf.format, { desc = 'Format file' })
    end
  }
}
