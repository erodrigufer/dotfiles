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
  -- vscode-like pictograms
  { 'onsails/lspkind-nvim' },
  -- nvim-cmp source for buffer words_table
  { 'hrsh7th/cmp-buffer' },
  -- nvim-cmp source for neovim's built-in LSP
  { 'hrsh7th/cmp-nvim-lsp' },
  -- Completion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      "chrisgrieser/cmp_yanky",
    },
  },
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
  -- Show the function and/or context name if cursor and
  -- context name are not in the same view.
  {
    'nvim-treesitter/nvim-treesitter-context'
  },
  -- Color and theme.
  { 'catppuccin/nvim',               name = 'catppuccin' },


  { 'L3MON4D3/LuaSnip' },

  -- TS type-checking throughout a project.
  { 'dmmulroy/tsc.nvim' },

  -- Manage keymappings.
  { 'folke/which-key.nvim',          dependencies = { 'nvim-tree/nvim-web-devicons' } },

  -- Toggleterm, to create floating windows with terminals.
  { 'akinsho/toggleterm.nvim',       version = 'v2.*' },

  -- DAP for debugging (works with v0.7.0).
  -- DAP-UI (works with v4.0.0).
  -- See as reference: https://www.youtube.com/watch?v=oYzZxi3SSnM&list=PLsz00TDipIffreIaUNk64KxTIkQaGguqn&index=7
  { 'mfussenegger/nvim-dap',         dependencies = { 'rcarriga/nvim-dap-ui', 'nvim-neotest/nvim-nio', 'leoluz/nvim-dap-go' } },

  -- Floating command line.
  { 'VonHeikemen/fine-cmdline.nvim', dependencies = { 'MunifTanjim/nui.nvim' } },

  -- Directory/file manager in a buffer.
  { 'stevearc/oil.nvim' },

  -- Navigate the symbols of a buffer effectively.
  { 'stevearc/aerial.nvim' },

  -- Startup dashboard.
  { 'nvimdev/dashboard-nvim',        event = { 'VimEnter' },                                                                  dependencies = { 'nvim-tree/nvim-web-devicons' } },

  -- nvim surround.
  { 'kylechui/nvim-surround',        event = 'VeryLazy' },

  -- Handle GitHub Issues, PRs, etc. within nvim.
  {
    "pwntester/octo.nvim",
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'nvim-tree/nvim-web-devicons',
    },
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    ---@module "ibl"
    opts = {},
  },

  -- Moving around effectively.
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      modes = {
        search = { enabled = true },
        char = { jump_labels = true },
      },
    },
    keys = {
      { "s",     mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S",     mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      { "<c-e>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
  },
  -- Completions for git (especially to integrate with octo).
  {
    "petertriho/cmp-git",
    dependencies = { 'hrsh7th/nvim-cmp' },
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    lazy = false,
    version = false, -- set this if you want to always pull the latest change
    opts = {
      -- add any opts here
    },
    build = "make",
    dependencies = {
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      --- The below dependencies are optional,
      "hrsh7th/nvim-cmp", -- autocompletion for avante commands and mentions
      "nvim-tree/nvim-web-devicons",
      {
        -- support for image pasting
        "HakonHarnes/img-clip.nvim",
        event = "VeryLazy",
        opts = {
          -- recommended settings
          default = {
            embed_image_as_base64 = false,
            prompt_for_file_name = false,
            drag_and_drop = {
              insert_mode = true,
            },
            -- required for Windows users
            use_absolute_path = true,
          },
        },
      },
      {
        -- Make sure to set this up properly if you have lazy=true
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {
          file_types = { "markdown", "Avante" },
        },
        ft = { "markdown", "Avante" },
      },
    },
  },
  {
    "gbprod/yanky.nvim",
    opts = {},
    keys = {
      { "<Space>p", function() require("telescope").extensions.yank_history.yank_history({}) end, desc = "Open Yank History" },
      { "y",        "<Plug>(YankyYank)",                                                          mode = { "n", "x" },                                desc = "Yank text" },
      { "p",        "<Plug>(YankyPutAfter)",                                                      mode = { "n", "x" },                                desc = "Put yanked text after cursor" },
      { "P",        "<Plug>(YankyPutBefore)",                                                     mode = { "n", "x" },                                desc = "Put yanked text before cursor" },
      { "gp",       "<Plug>(YankyGPutAfter)",                                                     mode = { "n", "x" },                                desc = "Put yanked text after selection" },
      { "gP",       "<Plug>(YankyGPutBefore)",                                                    mode = { "n", "x" },                                desc = "Put yanked text before selection" },
      { "<c-p>",    "<Plug>(YankyPreviousEntry)",                                                 desc = "Select previous entry through yank history" },
      { "<c-n>",    "<Plug>(YankyNextEntry)",                                                     desc = "Select next entry through yank history" },
      { "]p",       "<Plug>(YankyPutIndentAfterLinewise)",                                        desc = "Put indented after cursor (linewise)" },
      { "[p",       "<Plug>(YankyPutIndentBeforeLinewise)",                                       desc = "Put indented before cursor (linewise)" },
      { "]P",       "<Plug>(YankyPutIndentAfterLinewise)",                                        desc = "Put indented after cursor (linewise)" },
      { "[P",       "<Plug>(YankyPutIndentBeforeLinewise)",                                       desc = "Put indented before cursor (linewise)" },
      { ">p",       "<Plug>(YankyPutIndentAfterShiftRight)",                                      desc = "Put and indent right" },
      { "<p",       "<Plug>(YankyPutIndentAfterShiftLeft)",                                       desc = "Put and indent left" },
      { ">P",       "<Plug>(YankyPutIndentBeforeShiftRight)",                                     desc = "Put before and indent right" },
      { "<P",       "<Plug>(YankyPutIndentBeforeShiftLeft)",                                      desc = "Put before and indent left" },
      { "=p",       "<Plug>(YankyPutAfterFilter)",                                                desc = "Put after applying a filter" },
      { "=P",       "<Plug>(YankyPutBeforeFilter)",                                               desc = "Put before applying a filter" },
    },
  },
  { 'augmentcode/augment.vim' },

})
