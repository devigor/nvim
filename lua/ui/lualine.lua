local navic = require("nvim-navic")

local function lsp_progress()
  return {
    function()
      local msg = 'No Active Lsp'
      local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
      local clients = vim.lsp.get_active_clients()
      if next(clients) == nil then
        return msg
      end
      for _, client in ipairs(clients) do
        local filetypes = client.config.filetypes
        if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
          return " LSP: " .. client.name
        end
      end
      return " LSP: " .. msg
    end,
    color = { fg = '#74c7ec', gui = 'bold' }
  }
end

local function modified()
  if vim.bo.modified then
    return '+'
  elseif vim.bo.modifiable == false or vim.bo.readonly == true then
    return '-'
  end
  return ''
end

vim.cmd("au User LspProgressUpdate let &ro = &ro")

local config = {
  options = {
    theme = "tokyonight",
    section_separators = { left = "", right = "" },
    component_separators = { left = "|", right = "|" },
    icons_enabled = true,
    globalstatus = true,
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch" },
    lualine_c = {
      { "diagnostics", sources = { "nvim_diagnostic" } },
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { "filename", file_status = false, path = 0 },
      { modified, color = { bg = "#ca1243" } },
    },
    lualine_x = { lsp_progress() },
    lualine_y = { "location" },
    lualine_z = {{ navic.get_location(), cond = navic.is_available, color = { fg = "#FFFFFF"  } }},
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {},
  },
  extensions = { "nvim-tree" },
}

-- try to load matching lualine theme
local M = {}

function M.load()
  local name = vim.g.colors_name or ""
  local ok, _ = pcall(require, "lualine.themes." .. name)
  if ok then
    config.options.theme = name
  end
  require("lualine").setup(config)
end

M.load()

return M
