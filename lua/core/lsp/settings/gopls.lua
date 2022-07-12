local lspconfig = require("lspconfig")
local common = require("core.lsp.common")

local M = {}

M.setup = function()
  lspconfig["gopls"].setup({
    md = { "gopls" },
    -- for postfix snippets and analyzers
    capabilities = common.capabilities,
    on_attach = common.on_attach,
    settings = {
      gopls = {
        experimentalPostfixCompletions = true,
        analyses = {
          unusedparams = true,
          shadow = true,
        },
        staticcheck = true,
      },
    },
  })
end

return M
