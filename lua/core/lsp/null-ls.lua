local null_ls = require("null-ls")
local common = require("core.lsp.common")

local M = {}

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#code-actions
local code_actions = null_ls.builtins.code_actions
-- https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTINS.md#hover
local hover = null_ls.builtins.hover

local sources = {
  -- Formatting
  formatting.stylua,
  formatting.goimports,
  formatting.prettier.with({
    extra_args = { "--no-semi", "--single-quote", "--jsx-double-quote" },
  }),
  -- Diagnostics
  diagnostics.tsc,
  -- Code actions
  code_actions.gitsigns,
  code_actions.gitrebase,
  -- Hover
  hover.dictionary,
}

M.setup = function()
  null_ls.setup({
    sources = sources,
    on_attach = common.on_attach,
  })
end

return M
