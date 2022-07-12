local common = require("core.lsp.common")

local M = {}

M.setup = function()
  require("typescript").setup({
    debug = false,
    server = {
      on_attach = common.on_attach,
      capabilities = common.capabilities,
    },
  })
end

return M
