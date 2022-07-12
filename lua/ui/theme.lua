vim.g.tokyonight_dev = true
vim.g.tokyonight_style = "night"
vim.g.tokyonight_sidebars = {
  "qf",
  "vista_kind",
  "terminal",
  "packer",
  "spectre_panel",
  "NeogitStatus",
  "help",
}
vim.g.tokyonight_cterm_colors = false
vim.g.tokyonight_terminal_colors = true
vim.g.tokyonight_italic_comments = true
vim.g.tokyonight_italic_keywords = true
vim.g.tokyonight_italic_functions = false
vim.g.tokyonight_italic_variables = false
vim.g.tokyonight_transparent = false
vim.g.tokyonight_hide_inactive_statusline = true
vim.g.tokyonight_lualine_bold = true
vim.g.tokyonight_dark_sidebar = true
vim.g.tokyonight_dark_float = true
vim.g.tokyonight_colors = {}

vim.cmd[[colorscheme tokyonight]]

-- require("catppuccin").setup{
--   transparent_background = false,
--   term_colors = false,
--   styles = {
--     comments = "italic",
--     conditionals = "italic",
--     loops = "NONE",
--     functions = "italic",
--     keywords = "NONE",
--     strings = "NONE",
--     variables = "NONE",
--     numbers = "NONE",
--     booleans = "NONE",
--     properties = "italic",
--     types = "italic",
--     operators = "NONE",
--   },
--   integrations = {
-- 	  treesitter = true,
-- 	  native_lsp = {
-- 		  enabled = true,
-- 		  virtual_text = {
-- 			  errors = "italic",
-- 			  hints = "italic",
-- 			  warnings = "italic",
-- 			  information = "italic",
-- 		},
-- 		  underlines = {
--         errors = "underline",
--         hints = "underline",
--         warnings = "underline",
--         information = "underline",
-- 		  },
--   	},
--     lsp_trouble = false,
--     cmp = true,
--     lsp_saga = false,
--     gitgutter = false,
--     gitsigns = true,
--     telescope = true,
--     nvimtree = {
--       enabled = true,
--       show_root = false,
--       transparent_panel = false,
--     },
--     neotree = {
--       enabled = false,
--       show_root = false,
--       transparent_panel = false,
--     },
--     which_key = false,
--     indent_blankline = {
--       enabled = true,
--       colored_indent_levels = false,
--     },
--     dashboard = true,
--     neogit = false,
--     vim_sneak = false,
--     fern = false,
--     barbar = false,
--     bufferline = true,
--     markdown = true,
--     lightspeed = false,
--     ts_rainbow = false,
--     hop = false,
--     notify = true,
--     telekasten = true,
--     symbols_outline = true,
--   }
-- }

-- vim.g.catppuccin_flavour = "mocha" -- latte, frappe, macchiato, mocha