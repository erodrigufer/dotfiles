local status, configs = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

configs.setup({
  -- A list of parser names, or "all" (the listed parsers should always be installed)
  ensure_installed = {
    "c",
    "lua",
    "vim",
    "vimdoc",
    "query",
    "go",
    "typescript",
    "regex",
    "tsx",
    "json",
    "html",
    "bash",
    "erlang",
    "elixir",
    "make",
    "javascript",
    "css",
    "dockerfile",
    "awk",
    "diff",
    "elm",
    "git_config",
    "git_rebase",
    "gitignore",
    "gitcommit",
    "gitattributes",
    "gomod",
    "gosum",
    "gotmpl",
    "gowork",
    "hcl",
    "http",
    "jsdoc",
    "luadoc",
    "pem",
    "passwd",
    "scss",
    "sql",
    "ssh_config",
    "svelte",
    "terraform",
    "tmux",
    "toml",
    "yaml"

  },
  auto_install = true,
  ignore_install = {},

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    enable = true,
    disable = {},
    additional_vim_regex_highlighting = false,
  },
  indent = { enable = true },

})
