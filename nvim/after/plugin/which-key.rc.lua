local status, wk = pcall(require, "which-key")
if (not status) then return end

wk.setup {}

wk.register({
  f = {
    name = "Telescope commands",
    f = { "<cmd> Telescope find_files <cr>", "Find files in current working directory" },
    d = { "<cmd> Telescope diagnostics <cr>", "List diagnostics of current LSP" },
    g = { "<cmd> Telescope git_files <cr>", "Find tracked files in current git repo" },
    l = { "<cmd> Telescope live_grep <cr>", "Grep a string in the files of a repo" },
    r = { "<cmd> Telescope registers <cr>", "Find string stored in registers" },
    b = { "<cmd> Telescope file_browser path=%:p:h select_buffer=true<cr>", "Open the Telescope file browser at path of current buffer", noremap = true },
    j = { "<cmd> Telescope buffers <cr>", "Select opened buffer" }
  },
  l = {
    name = "Lazy integrations",
    g = { "<cmd> lua _lazygit_toggle()<cr>", "Open lazygit in floating Terminal window", { noremap = true, silent = true } },

    d = { "<cmd> lua _lazydocker_toggle()<cr>", "Open lazydocker in floating Terminal window", { noremap = true, silent = true } },
  },
  t = {
    name = "Testing",
    g = { "<cmd> TermExec dir='%:p:h' cmd='gotest -v' direction='float' name='gotest'<cr>", "Run gotest in buffer's current directory", { noremap = true, silent = true } },
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
  j = {
    name = "Terminal integrations",
    j = { "<cmd> lua _termWithoutCmd_toggle()<cr>", "Open floating terminal window" },
  },
}, { prefix = "<Space>" })
