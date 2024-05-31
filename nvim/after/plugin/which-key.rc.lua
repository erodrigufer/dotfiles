local status, wk = pcall(require, "which-key")
if (not status) then return end

wk.setup()

wk.register({
  f = {
    name = "Telescope commands",
    f = { "<cmd> Telescope find_files <cr>", "Find files in current working directory" },
    s = { "<cmd> Telescope lsp_document_symbols<cr>", "List document's symbols" },
    d = { "<cmd> Telescope diagnostics <cr>", "List diagnostics of current buffer" },
    g = { "<cmd> Telescope git_files <cr>", "Find tracked files in current git repo" },
    l = { "<cmd> Telescope live_grep <cr>", "Grep a string in the files of a repo" },
    r = { "<cmd> Telescope registers <cr>", "Find string stored in registers" },
    h = { "<cmd> Telescope file_browser path=%:p:h select_buffer=true<cr>", "Open the Telescope file browser at path of current buffer" },
    j = { "<cmd> Telescope buffers <cr>", "Select opened buffer" },
    k = { "<cmd> Telescope oldfiles <cr>", "Search for recently opened files" },
    v = { "<cmd> Telescope current_buffer_fuzzy_find <cr>", "Search for a pattern in current buffer" }
  },
  l = {
    name = "Lazy integrations",
    g = { "<cmd> lua _lazygit_toggle()<cr>", "Open lazygit in floating Terminal window" },

    d = { "<cmd> lua _lazydocker_toggle()<cr>", "Open lazydocker in floating Terminal window" },
  },
  t = {
    name = "Testing",
    g = { "<cmd> TermExec dir='%:p:h' cmd='gotest -v' direction='float' name='gotest'<cr>", "Run gotest in buffer's current directory" },
  },
  d = {
    name = "Debugger",
    d = { "<cmd> lua _dap_toggle_breakpoint()<cr>", "Toggle breakpoint" },
    c = { "<cmd> lua _dap_continue()<cr>", "Continue" },
    o = { "<cmd> lua _dap_step_over()<cr>", "Step over" },
    i = { "<cmd> lua _dap_step_into()<cr>", "Step into" },
    u = { "<cmd> lua _dap_step_out()<cr>", "Step out" },
    r = { "<cmd> lua _dap_repl_open()<cr>", "REPL open" },
  },
  j = { "<cmd> AerialToggle<cr>", "Toggle Aerial window" },
  g = {
    name = "General integrations",
    t = { "<cmd> TodoTelescope <cr>", "Open ToDo in Telescope view" },
    j = { "<cmd> lua _termWithoutCmd_toggle()<cr>", "Open floating terminal window" },
  },
}, {
  prefix = "<Space>",
  silent = true,
  noremap = true,
})

-- Keymappings without prefix.
wk.register({
    ['-'] = { "<cmd> Oil <cr>", "Open parent directory with Oil" },
    ['<C-a>'] = { "ggvG$y", "Yank all the content of the current buffer" },
    [',,'] = { "<cmd> vsplit<cr>", "Vertical split" },
    [',<'] = { "<cmd> vsplit<cr>", "Horizontal split" },
  },
  {
    silent = true,
    noremap = true,
  })

-- Keymappings for <leader> key.
wk.register({
    w = { "<cmd> WhichKey '' n<cr>", "Show all NORMAL mode keymappings" },
    ['<Space>'] = { "<cmd> nohlsearch<cr>", "Remove search highlight" },
    c = { "<cmd> ccl<cr>", "Close quickfix list" },
  },
  {
    prefix = "<leader>",
    silent = true,
    noremap = true,
  })
