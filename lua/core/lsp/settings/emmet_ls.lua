local lspconfig = require("lspconfig")

local M = {}

M.setup = function()
  lspconfig['emmet_ls'].setup({
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
  })
end

return M
