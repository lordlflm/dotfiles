-- line numbers
vim.cmd("set number")
vim.cmd("set relativenumber")

vim.cmd("set termguicolors")
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set scrolloff=10")
vim.cmd("set cursorline")

-- ruler
vim.cmd("set colorcolumn=120")

-- undo file
vim.cmd("set undofile")

-- folding
-- vim.opt.foldmethod = "expr"
-- vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- vim.opt.foldlevelstart = 99
-- vim.opt.foldenable = true

-- virtual lines background color
for _, virt_group in ipairs({
  "DiagnosticVirtualLinesError",
  "DiagnosticVirtualLinesWarn",
  "DiagnosticVirtualLinesInfo",
  "DiagnosticVirtualLinesHint",
  "PrecognitionHighlight"
}) do
  local hl = vim.api.nvim_get_hl(0, { name = virt_group, link = true })

  local base_group = hl.link or virt_group
  local base_hl = vim.api.nvim_get_hl(0, { name = base_group })

  vim.api.nvim_set_hl(0, virt_group, {
    fg = base_hl.fg,
    bg = vim.api.nvim_get_hl(0, { name = "ColorColumn" }).bg, -- same color as ColorColumn
    italic = base_hl.italic,
  })
end
