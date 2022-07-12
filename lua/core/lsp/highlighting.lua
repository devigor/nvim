local M = {}

M.setup = function(client)
  if client.server_capabilities.documentHighlight then
    require("illuminate").on_attach(client)
  end
  vim.g.Illuminate_ftblacklist = {'nvimtree', 'alpha'}
  vim.g.Illuminate_delay = 1000
end

return M
