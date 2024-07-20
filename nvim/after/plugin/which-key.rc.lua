local status, wk = pcall(require, "which-key")
if (not status) then return end

wk.setup()

wk.add({
  { "<Space>d",        group = "Debugger",                                                               remap = false },
  { "<Space>dc",       "<cmd> lua _dap_continue()<cr>",                                                  desc = "Continue",                                                                              remap = false },
  { "<Space>dd",       "<cmd> lua _dap_toggle_breakpoint()<cr>",                                         desc = "Toggle breakpoint",                                                                     remap = false },
  { "<Space>di",       "<cmd> lua _dap_step_into()<cr>",                                                 desc = "Step into",                                                                             remap = false },
  { "<Space>do",       "<cmd> lua _dap_step_over()<cr>",                                                 desc = "Step over",                                                                             remap = false },
  { "<Space>dr",       "<cmd> lua _dap_repl_open()<cr>",                                                 desc = "REPL open",                                                                             remap = false },
  { "<Space>du",       "<cmd> lua _dap_step_out()<cr>",                                                  desc = "Step out",                                                                              remap = false },
  { "<Space>f",        group = "Telescope commands",                                                     remap = false },
  { "<Space>fd",       "<cmd> Telescope diagnostics <cr>",                                               desc = "List diagnostics of current buffer",                                                    remap = false },
  { "<Space>ff",       "<cmd> Telescope git_files <cr>",                                                 desc = "Find tracked files in current git repo",                                                remap = false },
  { "<Space>fg",       "<cmd> Telescope lsp_document_symbols<cr>",                                       desc = "List document's symbols",                                                               remap = false },
  { "<Space>fh",       "<cmd> Telescope buffers <cr>",                                                   desc = "Select opened buffer",                                                                  remap = false },
  { "<Space>fj",       "<cmd> Telescope file_browser path=%:p:help select_buffer=true<cr>",              desc = "Open the Telescope file browser at path of current buffer",                             remap = false },
  { "<Space>fk",       "<cmd> Telescope oldfiles <cr>",                                                  desc = "Search for recently opened files",                                                      remap = false },
  { "<Space>fl",       "<cmd> Telescope live_grep <cr>",                                                 desc = "Grep a string in the files of a repo",                                                  remap = false },
  { "<Space>fr",       "<cmd> Telescope registers <cr>",                                                 desc = "Find string stored in registers",                                                       remap = false },
  { "<Space>fv",       "<cmd> Telescope current_buffer_fuzzy_find <cr>",                                 desc = "Search for a pattern in current buffer",                                                remap = false },
  { "<Space>g",        group = "General integrations",                                                   remap = false },
  { "<Space>gj",       "<cmd> lua _termWithoutCmd_toggle()<cr>",                                         desc = "Open floating terminal window",                                                         remap = false },
  { "<Space>gt",       "<cmd> TodoTelescope <cr>",                                                       desc = "Open ToDo in Telescope view",                                                           remap = false },
  { "<Space>j",        "<cmd> AerialToggle<cr>",                                                         desc = "Toggle Aerial window",                                                                  remap = false },
  { "<Space>l",        group = "Lazy integrations",                                                      remap = false },
  { "<Space>ld",       "<cmd> lua _lazydocker_toggle()<cr>",                                             desc = "Open lazydocker in floating Terminal window",                                           remap = false },
  { "<Space>lg",       "<cmd> lua _lazygit_toggle()<cr>",                                                desc = "Open lazygit in floating Terminal window",                                              remap = false },
  { "<Space>t",        group = "Testing",                                                                remap = false },
  { "<Space>tg",       "<cmd> TermExec dir='%:p:h' cmd='gotest -v' direction='float' name='gotest'<cr>", desc = "Run gotest in buffer's current directory",                                              remap = false },
  { ",,",              "<cmd> vsplit<cr><cmd>wincmd l<cr><cmd> Telescope git_files<cr>",                 desc = "Vertical split, move to new window and use Telescope to open new file in current repo", remap = false },
  { ",<",              "<cmd> vsplit<cr><cmd>wincmd l<cr>",                                              desc = "Vertical split and move to new window",                                                 remap = false },
  { ",l",              "<cmd> vsplit<cr><cmd>wincmd l<cr><cmd> Telescope live_grep<cr>",                 desc = "Vertical split, move to new window and use Telescope to search for a string with grep", remap = false },
  { "-",               "<cmd> Oil <cr>",                                                                 desc = "Open parent directory with Oil",                                                        remap = false },
  { "<C-a>",           "ggvG$y",                                                                         desc = "Yank all the content of the current buffer",                                            remap = false },

  { "<leader><Space>", "<cmd> nohlsearch<cr>",                                                           desc = "Remove search highlight",                                                               remap = false },
  { "<leader>c",       "<cmd> ccl<cr>",                                                                  desc = "Close quickfix list",                                                                   remap = false },
  { "<leader>d",       vim.diagnostic.setqflist,                                                         desc = "Open quickfix list with diagnostics",                                                   remap = false },
  { "<leader>w",       "<cmd> WhichKey '' n<cr>",                                                        desc = "Show all NORMAL mode keymappings",                                                      remap = false },
})
