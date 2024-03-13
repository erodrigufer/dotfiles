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
  g = {
    name = "Git integrations",
    g = { "<cmd> lua _lazygit_toggle()<cr>", "Open LazyGit in floating Terminal window", { noremap = true, silent = true } },
  },
}, { prefix = "<Space>" })
