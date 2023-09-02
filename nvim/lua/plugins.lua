-- Install packer.
local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  use {
  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.2',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  -- LSP
  use 'neovim/nvim-lspconfig'
  use "folke/trouble.nvim"
  use { "folke/todo-comments.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  }
  use {
  'akinsho/bufferline.nvim', tag = "*", 
  requires = { {'nvim-tree/nvim-web-devicons'} }
  }
  -- Plugins go here!!
end)

