local wk = require("which-key")
local map = vim.api.nvim_set_keymap

local M = {}

function M.setup(client, bufnr)
  -- Mappings.
  local opts = { noremap = true, silent = true }

  local keymap = {
    c = {
      name = "+Code",
      r = { "<cmd>Lspsaga rename<CR>", "Rename" },
      a = { "<cmd>Lspsaga code_action<CR>", "Code Action" },
      d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line Diagnostics" },
      f = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format file" },
      l = {
        name = "+LSP",
        i = { "<cmd>LspInfo<cr>", "Lsp Info" },
        a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", "Add Folder" },
        r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", "Remove Folder" },
        l = {
          "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
          "List Folders",
        },
      },
    },
    x = {
      s = { "<cmd>Telescope document_diagnostics<cr>", "Search Document Diagnostics" },
      w = { "<cmd>Telescope workspace_diagnostics<cr>", "Workspace Diagnostics" },
    },
  }

  if client.name == "tsserver" then
    keymap.c.o = { "<cmd>:TypescriptOrganizeImports<CR>", "Organize Imports" }
    keymap.c.R = { "<cmd>:TypescriptRenameFile<CR>", "Rename File" }
  end

  local keymap_goto = {
    name = "+GoTo",
    r = { "<cmd>Telescope lsp_references<cr>", "References" },
    R = { "<cmd>Trouble lsp_references<cr>", "Trouble References" },
    d = { "<Cmd>lua vim.lsp.buf.definition()<CR>", "Goto Definition" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Signature Help" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "Goto Implementation" },
    -- I = { "<Cmd>lua vim.lsp.buf.declaration()<CR>", "Goto Declaration" },
    t = { "<cmd>lua vim.lsp.buf.type_definition()<CR>", "Goto Type Definition" },
  }

  map("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
  map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
  map("n", "[e", "<cmd>lua vim.diagnostic.goto_prev({severity = vim.diagnostic.severity.ERROR})<CR>", opts)
  map("n", "]e", "<cmd>lua vim.diagnostic.goto_next({severity = vim.diagnostic.severity.ERROR})<CR>", opts)

  wk.register(keymap, { buffer = bufnr, prefix = "<leader>" })
  wk.register(keymap_goto, { buffer = bufnr, prefix = "g" })
end

return M
