vim.diagnostic.config({
  virtual_lines = { current_line = true },
  -- update_in_insert = true,
  underline = true,
  severity_sort = true,
  signs = {
    text = {
      [vim.diagnostic.severity.HINT] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.ERROR] = " ",
    },
  },
})
