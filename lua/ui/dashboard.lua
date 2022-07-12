local M = {}

function M.setup()
  local alpha = require("alpha")

  local dashboard = require("alpha.themes.dashboard")

  -- Header
  dashboard.section.header.val = {
    [[   _   _   ______    ____   __      __  _____   __  __   ]],
    [[  | \ | | |  ____|  / __ \  \ \    / / |_   _| |  \/  |  ]],
    [[  |  \| | | |__    | |  | |  \ \  / /    | |   | \  / |  ]],
    [[  | . ` | |  __|   | |  | |   \ \/ /     | |   | |\/| |  ]],
    [[  | |\  | | |____  | |__| |    \  /     _| |_  | |  | |  ]],
    [[  |_| \_| |______|  \____/      \/     |_____| |_|  |_|  ]],
  }
  dashboard.section.header.opts.hl = "Operator"

  local function button(sc, txt, keybind, keybind_opts)
    local b = dashboard.button(sc, txt, keybind, keybind_opts)
    b.opts.hl = "Keyword"
    b.opts.hl_shortcut = "Constant"
    return b
  end

  dashboard.section.buttons.val = {
    button("e", "   New file", ":ene <BAR> startinsert <CR>"),
    button("f", "   Find file", ":Telescope find_files<CR>"),
    button("r", "   Recently used files", ":Telescope oldfiles<CR>"),
    button("p", "   Find project", ":Telescope projects<CR>"),
    button("s", "   Settings", ":e ~/.config/nvim/init.lua <CR>"),
    button("u", "   Update plugins", ":PackerSync<CR>"), -- Packer sync
    button("q", "   Quit Neovim", ":qa<CR>"),
  }
  dashboard.section.buttons.opts = {
    spacing = 1,
  }

  -- Footer
  local function footer()
    local version = vim.version()
    local nvim_version_info = "   Neovim v" .. version.major .. "." .. version.minor .. "." .. version.patch

    return nvim_version_info
  end

  dashboard.section.footer.val = footer()
  dashboard.section.footer.opts.hl = "AlphaFooter"

  -- Layout
  dashboard.config.layout = {
    { type = "padding", val = 2 },
    dashboard.section.header,
    { type = "padding", val = 2 },
    dashboard.section.buttons,
    { type = "padding", val = 1 },
    dashboard.section.footer,
  }

  dashboard.opts.opts.noautocmd = true

  alpha.setup(dashboard.opts)
end

return M.setup()

