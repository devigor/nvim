local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
end

return require("packer").startup(function(use)
  -- LSP
  use("neovim/nvim-lspconfig")
  use("williamboman/nvim-lsp-installer")

  -- Interface
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use("kyazdani42/nvim-web-devicons")
  use("nvim-lualine/lualine.nvim")
  use("goolord/alpha-nvim")
  use("lewis6991/gitsigns.nvim")
  use("kyazdani42/nvim-tree.lua")
  use("onsails/lspkind.nvim")
  use("SmiteshP/nvim-navic")
  use("folke/tokyonight.nvim")
  use("tami5/lspsaga.nvim")
  use({
    "catppuccin/nvim",
    as = "catppuccin",
  })

  -- DevEx
  use("windwp/nvim-autopairs")
  use("numToStr/Comment.nvim")
  use("lukas-reineke/indent-blankline.nvim")
  use("windwp/nvim-ts-autotag")
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")
  use("jose-elias-alvarez/null-ls.nvim")
  use("RRethy/vim-illuminate")
  use("folke/which-key.nvim")
  use("folke/trouble.nvim")
  use("akinsho/toggleterm.nvim")

  -- Git
  use("TimUntersberger/neogit")
  use("sindrets/diffview.nvim")

  -- TypeScript
  use("jose-elias-alvarez/typescript.nvim")

  -- Telescope
  use("nvim-lua/plenary.nvim")
  use("nvim-telescope/telescope.nvim")
  use("ahmedkhalf/project.nvim")

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
