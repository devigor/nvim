local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }
local wk = require("which-key")

-- Resize window using <CTRL> move keys
map("n", "<C-j>", ":resize +2<CR>", opts)
map("n", "<C-k>", ":resize -2<CR>", opts)
map("n", "<C-l>", ":vertical resize -2<CR>", opts)
map("n", "<C-h>", ":vertical resize +2<CR>", opts)

-- Move Lines
map("n", "<A-j>", ":m .+1<CR>==", opts)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", opts)
map("n", "<A-k>", ":m .-2<CR>==", opts)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", opts)

-- Move to window using the <ctrl> movement keys
map("n", "<left>", "<C-w>h", opts)
map("n", "<down>", "<C-w>j", opts)
map("n", "<up>", "<C-w>k", opts)
map("n", "<right>", "<C-w>l", opts)

-- Telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<CR>", opts)
map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", opts)
map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", opts)
map("n", "<leader>fh", "<cmd>Telescope help_tags<CR>", opts)

-- Nvim Tree
map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", opts)
map("n", "<C-p>", "<cmd>NvimTreeFocus<CR>", opts)

-- Folding
map("n", "<C-o>", "<cmd>foldopen<CR>", opts)
map("n", "<C-c>", "<cmd>foldclose<CR>", opts)

local leader = {
  ["w"] = {
    name = "+Windows",
    ["w"] = { "<C-W>p", "other-window" },
    ["d"] = { "<C-W>c", "delete-window" },
    ["-"] = { "<C-W>s", "split-window-below" },
    ["|"] = { "<C-W>v", "split-window-right" },
    ["2"] = { "<C-W>v", "layout-double-columns" },
    ["h"] = { "<C-W>h", "window-left" },
    ["j"] = { "<C-W>j", "window-below" },
    ["l"] = { "<C-W>l", "window-right" },
    ["k"] = { "<C-W>k", "window-up" },
    ["H"] = { "<C-W>5<", "expand-window-left" },
    ["J"] = { ":resize +5", "expand-window-below" },
    ["L"] = { "<C-W>5>", "expand-window-right" },
    ["K"] = { ":resize -5", "expand-window-up" },
    ["="] = { "<C-W>=", "balance-window" },
    ["s"] = { "<C-W>s", "split-window-below" },
    ["v"] = { "<C-W>v", "split-window-right" },
  },
  g = {
    name = "+Git",
    g = { "<cmd>Neogit kind=split<CR>", "NeoGit" },
    c = { "<Cmd>Telescope git_commits<CR>", "commits" },
    b = { "<Cmd>Telescope git_branches<CR>", "branches" },
    s = { "<Cmd>Telescope git_status<CR>", "status" },
    d = { "<cmd>DiffviewOpen<cr>", "DiffView" },
  },
  p = {
    name = "+Packer",
    p = { "<cmd>PackerSync<cr>", "Sync" },
    s = { "<cmd>PackerStatus<cr>", "Status" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    c = { "<cmd>PackerCompile<cr>", "Compile" },
  },
  s = {
    name = "+Search",
    g = { "<cmd>Telescope live_grep<cr>", "Grep" },
    b = { "<cmd>Telescope current_buffer_fuzzy_find<cr>", "Buffer" },
    s = {
      function()
        require("telescope.builtin").lsp_document_symbols({
          symbols = { "Class", "Function", "Method", "Constructor", "Interface", "Module", "Struct", "Trait" },
        })
      end,
      "Goto Symbol",
    },
    h = { "<cmd>Telescope command_history<cr>", "Command History" },
    m = { "<cmd>Telescope marks<cr>", "Jump to Mark" },
  },
  f = {
    name = "+Files",
    f = { "<cmd>Telescope find_files<cr>", "Find File" },
    r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
    p = { "<cmd>Telescope projects<cr>", "Open Projects" },
    n = { "<cmd>enew<cr>", "New File" },
  },
  ["<tab>"] = {
    name = "Workspace",
    ["<tab>"] = { "<cmd>tabnew<CR>", "New Tab" },
    n = { "<cmd>tabnext<CR>", "Next" },
    d = { "<cmd>tabclose<CR>", "Close" },
    p = { "<cmd>tabprevious<CR>", "Previous" },
    ["]"] = { "<cmd>tabnext<CR>", "Next" },
    ["["] = { "<cmd>tabprevious<CR>", "Previous" },
    f = { "<cmd>tabfirst<CR>", "First" },
    l = { "<cmd>tablast<CR>", "Last" },
  },
  q = { "<cmd>:qa!<cr>", "Quit without saving" },
  t = { "<cmd>:ToggleTerm direction=float<CR>", "Open Float Terminal" },
  x = {
    name = "Errors",
    x = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "Trouble" },
  },
}

wk.register(leader, { prefix = "<leader>" })
