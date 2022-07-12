require("nvim-treesitter.configs").setup({
  ensure_installed = {
    "comment",
    "css",
    "php",
    "go",
    "graphql",
    "html",
    "javascript",
    "jsonc",
    "lua",
    "markdown",
    "regex",
    "rust",
    "toml",
    "tsx",
    "typescript",
    "vue",
    "yaml",
  },
  indent = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
  highlight = {
    enable = true,
    use_languagetree = true,
    disable = { "nvim-tree", "alpha" },
  },
  respect_buf_cwd = true,
  update_cwd = true,
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
})
