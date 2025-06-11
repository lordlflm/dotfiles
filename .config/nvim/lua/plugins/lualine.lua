local function lsp_clients()
  local clients = vim.lsp.get_clients({ bufnr = 0 })
  if next(clients) == nil then
    return "No LSP"
  end
  local names = {}
  for _, client in ipairs(clients) do
    if client.name ~= "" then
      table.insert(names, client.name)
    end
  end
  return "LSP: " .. table.concat(names, ", ")
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup({
      options = {
        theme = vim.g.colors_name or "auto",
      },
      sections = {
        lualine_c = {

        },
        lualine_x = {
          'encoding',
          'fileformat',
          'filetype',
          -- display python venv
          {
            function()
              if vim.bo.filetype == 'python' then
                local venv = os.getenv("VIRTUAL_ENV")
                if venv then
                  local venv_name = vim.fn.fnamemodify(venv, ":t")
                  return venv_name
                end
              end
              return ""
            end,
          },
          lsp_clients,
        },
      },
    })
  end
}
