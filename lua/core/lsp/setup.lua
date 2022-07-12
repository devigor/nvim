local common = require("core.lsp.common")
local lspconfig = require("lspconfig")
local installer = require("nvim-lsp-installer")

local servers = common.servers
local on_attach = common.on_attach
local capabilities = common.capabilities

installer.setup {
	ensure_installed = servers
}

for _, server in pairs(servers) do
	local opts = {
		on_attach = on_attach,
		capabilities = capabilities,
	}
	local has_custom_opts, _ = pcall(require, "core.lsp.settings." .. server)
	if has_custom_opts then
	  require("core.lsp.settings." .. server).setup()
  else
    lspconfig[server].setup(opts)
	end
end


