local M = {}

M.on_attach = function(client, bufnr)
  require("core.lsp.keys").setup(client, bufnr)
  require("core.lsp.highlighting").setup(client)

  if client.name == "tsserver" then
    client.server_capabilities.document_formatting = false
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

M.capabilities = capabilities

M.servers = {
  -- "tsserver",
  "gopls",
  "sumneko_lua",
  "emmet_ls",
}

return M
