require("core.lsp.setup")
require("core.lsp.null-ls")
local common = require("core.lsp.common")

require("typescript").setup({
  server = {
    on_attach = common.on_attach,
    flags = {
      debounce_text_changes = 150,
    },
    capabilities = common.capabilities,
  }
})
