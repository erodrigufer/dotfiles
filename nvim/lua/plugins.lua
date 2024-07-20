-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

require("lazy").setup({
  { 'nvim-tree/nvim-web-devicons' },
  -- General functions for neovim
  -- (required by many packages).
  { 'nvim-lua/plenary.nvim' },
  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons', lazy = true }
  },
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } }
  },
  -- File browser.
  {
    'nvim-telescope/telescope-file-browser.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' }
  },
  -- LSP
  { 'neovim/nvim-lspconfig' },
  -- vscode-like pictograms
  { 'onsails/lspkind-nvim' },
  -- nvim-cmp source for buffer words_table
  { 'hrsh7th/cmp-buffer' },
  -- nvim-cmp source for neovim's built-in LSP
  { 'hrsh7th/cmp-nvim-lsp' },
  -- Completion
  { 'hrsh7th/nvim-cmp' },
  -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  { 'jose-elias-alvarez/null-ls.nvim' },
  { 'williamboman/mason.nvim' },
  { 'williamboman/mason-lspconfig.nvim' },
  -- Show Errors, diagnostics.
  { 'folke/trouble.nvim' },
  -- Find TODOs, FIX and BUGs in repo.
  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },

  -- HTML colors.
  { 'norcalli/nvim-colorizer.lua' },

  -- Line with opened buffers on top of window.
  {
    'akinsho/bufferline.nvim',
    version = '*',
    dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  },

  -- Show git changes on left-side of window,
  -- git blame and git diff functions.
  { 'lewis6991/gitsigns.nvim' },
  --
  -- Post-install/update hook with neovim command.
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
  },
  -- Color and theme.
  { 'catppuccin/nvim',                   name = 'catppuccin' },

  { 'MunifTanjim/prettier.nvim' },

  { 'L3MON4D3/LuaSnip' },

  -- TS type-checking throughout a project.
  { 'dmmulroy/tsc.nvim' },

  -- Useful TS functions.
  { 'jose-elias-alvarez/typescript.nvim' },

  -- Work on zip files directly with vim.
  { 'lbrayner/vim-rzip' },

  -- Moving around effectively.
  { 'ggandor/leap.nvim' },

  -- Manage keymappings.
  { 'folke/which-key.nvim' },

  -- Toggleterm, to create floating windows with terminals.
  { 'akinsho/toggleterm.nvim',           version = 'v2.*' },

  -- DAP for debugging (works with v0.7.0).
  -- DAP-UI (works with v4.0.0).
  -- See as reference: https://www.youtube.com/watch?v=oYzZxi3SSnM&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=7
  { 'mfussenegger/nvim-dap',             dependencies = { 'rcarriga/nvim-dap-ui', 'nvim-neotest/nvim-nio', 'leoluz/nvim-dap-go' } },

  -- Floating command line.
  { 'VonHeikemen/fine-cmdline.nvim',     dependencies = { 'MunifTanjim/nui.nvim' } },

  -- Directory/file manager in a buffer.
  { 'stevearc/oil.nvim' },

  -- Navigate the symbols of a buffer effectively.
  { 'stevearc/aerial.nvim' },

  -- Startup dashboard.
  { 'nvimdev/dashboard-nvim',            event = { 'VimEnter' },                                                                  dependencies = { 'nvim-tree/nvim-web-devicons' } },

  -- nvim surround.
  { 'kylechui/nvim-surround',            event = 'VeryLazy' },

  -- SQL client.
  {
    'tpope/vim-dadbod',
    dependencies = { 'kristijanhusak/vim-dadbod-ui', 'kristijanhusak/vim-dadbod-completion' },
    cmd = {
      'DBUI',
      'DBUIToggle',
      'DBUIAddConnection',
      'DBUIFindBuffer',
    },
    init = function()
      -- Use nerd fonts for DBUI.
      vim.g.db_ui_use_nerd_fonts = 1
    end,
  },

  -- ChatGPT integration.
  {
    "robitx/gp.nvim"
  },

})
