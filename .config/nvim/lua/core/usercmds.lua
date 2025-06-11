vim.api.nvim_create_user_command('ReloadColors', function()
  vim.o.background = require("core.utils").get_light_mode()
  vim.cmd.colorscheme(vim.g.colors_name or 'auto')
end, {})
