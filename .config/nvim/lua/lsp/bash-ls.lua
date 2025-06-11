return {
  cmd = { 'bash-language-server', 'start' },
  settings = {
    bashIde = {
      -- Glob pattern for finding and parsing shell script files in the workspace.
      -- Used by the background analysis features across files.

      -- Prevent recursive scanning which will cause issues when opening a file
      -- directly in the home directory (e.g. ~/foo.sh).
      --
      -- Default upstream pattern is "**/*@(.sh|.inc|.bash|.command)".
      globPattern = vim.env.GLOB_PATTERN or '*@(.sh|.inc|.bash|.command)',
    },
  },
  filetypes = { 'bash', 'sh' },
  root_dir = function(fname)
    if type(fname) == "number" then
      fname = vim.api.nvim_buf_get_name(fname)
    end
    return vim.fs.dirname(vim.fs.find({ '.git', 'bashrc', 'zshrc' }, { path = fname, upward = true })[1])
  end,
  single_file_support = true,
}
