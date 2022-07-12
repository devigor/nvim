local M = {}

M.map = function(mode, mapping, cmd, options)
  local opts = { noremap = true, silent = true }
  if options then
    opts = vim.tbl_extend("force", opts, options)
  end

  vim.api.nvim_set_keymap(mode, mapping, cmd, opts)
end

return M
