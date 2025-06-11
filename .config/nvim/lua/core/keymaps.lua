local keymaps = vim.keymap

-- use hjkl instead of arrow keys
keymaps.set({ 'n', 'v' }, '<Left>', function()
  print("Use h instead of <Left>")
end, { noremap = true, silent = true })
keymaps.set({ 'n', 'v' }, '<Right>', function()
  print("Use l instead of <Right>")
end, { noremap = true, silent = true })
keymaps.set({ 'n', 'v' }, '<Up>', function()
  print("Use k instead of <Up>")
end, { noremap = true, silent = true })
keymaps.set({ 'n', 'v' }, '<Down>', function()
  print("Use j instead of <Down>")
end, { noremap = true, silent = true })

-- always yank to system clipboard in visual mode
keymaps.set({ 'v' }, '<leader>y', '"+y', { desc = "Copy to system clipboard" })

-- Keep visual selection after indenting
keymaps.set("v", ">", ">gv", { noremap = true, silent = true })
keymaps.set("v", "<", "<gv", { noremap = true, silent = true })

-- lsp
keymaps.set("n", "<leader>gr", vim.lsp.buf.rename, { desc = "Rename symbol" })
keymaps.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format buffer" })
keymaps.set("n", "<leader>gd", vim.lsp.buf.definition, { desc = "Go to definition" })
keymaps.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
keymaps.set("n", "<leader>gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
keymaps.set("n", "<leader>ga", vim.lsp.buf.code_action, { desc = "Code action" })
keymaps.set("n", "<leader>gh", vim.lsp.buf.hover, { desc = "Hover" })

-- completion
--
-- see plugins/blink-cmp.nvim

-- diagnostics
keymaps.set("n", "<leader>df", function()
  vim.diagnostic.open_float(nil, {
    focusable = true,
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  })
end, { desc = "Show diagnostic in float" })

keymaps.set("n", "<leader>dn", function()
  vim.diagnostic.goto_next({ float = false })
end, { desc = "Next Diagnostic" })
keymaps.set("n", "<leader>dp", function()
  vim.diagnostic.goto_prev({ float = false })
end, { desc = "Previous Diagnostic" })

-- buffer navigation
--
-- see plugins/barbar.nvit
