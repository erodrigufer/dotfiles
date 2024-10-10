local status, wk = pcall(require, "which-key")
if (not status) then return end

wk.setup()

wk.add({
  { "<Space>d",  group = "Debugger",                                                  remap = false },
  { "<Space>dc", "<cmd> lua _dap_continue()<cr>",                                     desc = "Continue",                                                  remap = false },
  { "<Space>dd", "<cmd> lua _dap_toggle_breakpoint()<cr>",                            desc = "Toggle breakpoint",                                         remap = false },
  { "<Space>di", "<cmd> lua _dap_step_into()<cr>",                                    desc = "Step into",                                                 remap = false },
  { "<Space>do", "<cmd> lua _dap_step_over()<cr>",                                    desc = "Step over",                                                 remap = false },
  { "<Space>dr", "<cmd> lua _dap_repl_open()<cr>",                                    desc = "REPL open",                                                 remap = false },
  { "<Space>du", "<cmd> lua _dap_step_out()<cr>",                                     desc = "Step out",                                                  remap = false },
  { "<Space>j",  group = "Telescope commands",                                        remap = false },
  { "<Space>jd", "<cmd> Telescope diagnostics <cr>",                                  desc = "List diagnostics of current buffer",                        remap = false },
  { "<Space>jf", "<cmd> Telescope git_files <cr>",                                    desc = "Find tracked files in current git repo",                    remap = false },
  { "<Space>jg", "<cmd> Telescope lsp_document_symbols<cr>",                          desc = "List document's symbols",                                   remap = false },
  { "<Space>jk", "<cmd> Telescope buffers <cr>",                                      desc = "Select opened buffer",                                      remap = false },
  { "<Space>jj", "<cmd> Telescope file_browser path=%:p:help select_buffer=true<cr>", desc = "Open the Telescope file browser at path of current buffer", remap = false },
  { "<Space>jo", "<cmd> Telescope oldfiles <cr>",                                     desc = "Search for recently opened files",                          remap = false },
  { "<Space>jl", "<cmd> Telescope live_grep <cr>",                                    desc = "Grep a string in the files of a repo",                      remap = false },
  { "<Space>jr", "<cmd> Telescope registers <cr>",                                    desc = "Find string stored in registers",                           remap = false },
  { "<Space>jv", "<cmd> Telescope current_buffer_fuzzy_find <cr>",                    desc = "Search for a pattern in current buffer",                    remap = false },
  { "<Space>h",  group = "General integrations",                                      remap = false },
  { "<Space>hj", "<cmd> lua _termWithoutCmd_toggle()<cr>",                            desc = "Open floating terminal window",                             remap = false },
  { "<Space>hy", "<cmd> TodoTelescope <cr>",                                          desc = "Open ToDo in Telescope view",                               remap = false },
  { "<Space>g",  group = "ChatGPT",                                                   remap = false },
  {
    "<Space>gg",
    "<cmd>GpChatNew vsplit<cr>",
    desc = "New Chat vsplit",
    nowait = true,
    remap = false
  },
  {
    "<Space>gj",
    "<cmd>GpChatToggle<cr>",
    desc = "Toggle Chat",
    nowait = true,
    remap = false
  },
  {
    "<Space>gf",
    "<cmd>GpChatFinder<cr>",
    desc = "Chat Finder",
    nowait = true,
    remap = false
  },
  {
    "<Space>ga",
    "<cmd>GpAppend<cr>",
    desc = "Append",
    nowait = true,
    remap = false
  },
  {
    "<Space>gb",
    "<cmd>GpPrepend<cr>",
    desc = "Prepend",
    nowait = true,
    remap = false
  },
  {
    "<Space>gn",
    "<cmd>GpNextAgent<cr>",
    desc = "Next Agent",
    nowait = true,
    remap = false
  },
  {
    "<C-g>r",
    ":<C-u>'<,'>GpRewrite<cr>",
    desc = "Visual rewrite",
    nowait = true,
    remap = false,
    mode = "v"
  },
  {
    "<C-g>a",
    ":<C-u>'<,'>GpAppend<cr>",
    desc = "Visual append",
    nowait = true,
    remap = false,
    mode = "v"
  },
  {
    "<C-g>g",
    ":<C-u>'<,'>GpChatNew<cr>",
    desc = "New Chat",
    nowait = true,
    remap = false,
    mode = "v"
  },
  { "<Space>o",        "<cmd> Octo<cr>",                                                                                     desc = "Open Octo command list",                                                                remap = false },
  { "<Space>a",        "<cmd> AerialToggle<cr>",                                                                             desc = "Toggle Aerial window",                                                                  remap = false },
  { "<Space>l",        "<cmd> lua _lazygit_toggle()<cr>",                                                                    desc = "Open lazygit in floating Terminal window",                                              remap = false },
  { "<Space>t",        group = "Testing",                                                                                    remap = false },
  { "<Space>tg",       "<cmd> TermExec dir='%:p:h' cmd='gotest -v' direction='float' name='gotest'<cr>",                     desc = "Run gotest in buffer's current directory",                                              remap = false },
  { ",,",              "<cmd> vsplit<cr><cmd>wincmd l<cr><cmd> Telescope file_browser path=%:p:help select_buffer=true<cr>", desc = "Vertical split, move to new window and use Telescope to open new file in current repo", remap = false },
  { ",.",              "<cmd> vsplit<cr><cmd>wincmd l<cr><cmd> Telescope git_files<cr>",                                     desc = "Vertical split, move to new window and use Telescope to open new file in current repo", remap = false },
  { ",<",              "<cmd> vsplit<cr><cmd>wincmd l<cr>",                                                                  desc = "Vertical split and move to new window",                                                 remap = false },
  { ",l",              "<cmd> vsplit<cr><cmd>wincmd l<cr><cmd> Telescope live_grep<cr>",                                     desc = "Vertical split, move to new window and use Telescope to search for a string with grep", remap = false },
  { "<C-l>",           "<cmd>wincmd l<cr>",                                                                                  desc = "Move to right window",                                                                  remap = false },
  { "<C-h>",           "<cmd>wincmd h<cr>",                                                                                  desc = "Move to left window",                                                                   remap = false },
  { "<C-j>",           "<cmd>wincmd j<cr>",                                                                                  desc = "Move to lower window",                                                                  remap = false },
  { "<C-k>",           "<cmd>wincmd k<cr>",                                                                                  desc = "Move to upper window",                                                                  remap = false },
  { "-",               "<cmd> Oil <cr>",                                                                                     desc = "Open parent directory with Oil",                                                        remap = false },
  { "<C-a>",           "ggvG$y",                                                                                             desc = "Yank all the content of the current buffer",                                            remap = false },
  { "<C-Space>",       "<cmd> Telescope git_files <cr>",                                                                     desc = "Find tracked files in current git repo",                                                remap = false },
  { "<leader><Space>", "<cmd> nohlsearch<cr>",                                                                               desc = "Remove search highlight",                                                               remap = false },
  { "<leader>c",       "<cmd> ccl<cr>",                                                                                      desc = "Close quickfix list",                                                                   remap = false },
  { "<leader>,",       "<cmd> bd<cr>",                                                                                       desc = "Close current buffer",                                                                  remap = false },
  { "<leader>d",       vim.diagnostic.setqflist,                                                                             desc = "Open quickfix list with diagnostics",                                                   remap = false },
  { "<leader>w",       "<cmd> WhichKey '' n<cr>",                                                                            desc = "Show all NORMAL mode keymappings",                                                      remap = false },
  { "<leader>g",       "<cmd>!gh b<cr>",                                                                                     desc = "Execute gh b in the background",                                                        remap = false },
})
