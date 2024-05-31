-- Install packer.
local status, packer = pcall(require, 'packer')
if (not status) then
  print('Packer is not installed')
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-tree/nvim-web-devicons'
  -- General functions for neovim
  -- (required by many packages).
  use 'nvim-lua/plenary.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-telescope/telescope.nvim', branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }
  -- File browser.
  use {
    'nvim-telescope/telescope-file-browser.nvim',
    requires = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  }
  -- LSP
  use 'neovim/nvim-lspconfig'
  use 'onsails/lspkind-nvim'            -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer'              -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp'            -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp'                -- Completion
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  -- Show Errors, diagnostics.
  use 'folke/trouble.nvim'
  -- Find TODOs, FIX and BUGs in repo.
  use { 'folke/todo-comments.nvim',
    requires = { 'nvim-lua/plenary.nvim' },
  }

  -- Comments.
  use 'numToStr/Comment.nvim'

  -- HTML colors.
  use 'norcalli/nvim-colorizer.lua'

  -- Line with opened buffers on top of window.
  use {
    'akinsho/bufferline.nvim', tag = '*',
    requires = { { 'nvim-tree/nvim-web-devicons' } }
  }

  -- Show git changes on left-side of window,
  -- git blame and git diff functions.
  use 'lewis6991/gitsigns.nvim'
  --
  -- Post-install/update hook with neovim command.
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  -- Color and theme.
  use { 'catppuccin/nvim', as = 'catppuccin' }

  use('MunifTanjim/prettier.nvim')

  use 'L3MON4D3/LuaSnip'

  -- TS type-checking throughout a project.
  use('dmmulroy/tsc.nvim')

  -- Useful TS functions.
  use('jose-elias-alvarez/typescript.nvim')

  -- Work on zip files directly with vim.
  use('lbrayner/vim-rzip')

  -- Moving around effectively.
  use('ggandor/leap.nvim')

  -- Manage keymappings.
  use('folke/which-key.nvim')

  -- Toggleterm, to create floating windows with terminals.
  use { "akinsho/toggleterm.nvim", tag = 'v2.*' }

  -- DAP for debugging (works with v0.7.0).
  -- DAP-UI (works with v4.0.0).
  -- See as reference: https://www.youtube.com/watch?v=oYzZxi3SSnM&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=7
  use { "mfussenegger/nvim-dap", requires = { "rcarriga/nvim-dap-ui", "nvim-neotest/nvim-nio", "leoluz/nvim-dap-go" } }

  -- Floating command line.
  use { 'VonHeikemen/fine-cmdline.nvim', requires = { 'MunifTanjim/nui.nvim' } }

  -- Directory/file manager in a buffer.
  use({ "stevearc/oil.nvim" })

  -- Navigate the symbols of a buffer effectively.
  use({ "stevearc/aerial.nvim" })
end)
