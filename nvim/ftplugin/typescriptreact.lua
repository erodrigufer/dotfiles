local status, wk = pcall(require, "which-key")
if (not status) then return end

wk.add({
  { "<Leader>t",  group = "Typescript commands" },
  { "<Leader>tm", "<cmd>TypescriptAddMissingImports<cr>", desc = "Add missing imports" },
  { "<Leader>tr", "<cmd>TypescriptRemoveUnused<cr>",      desc = "Remove unused symbols" },
  { "<Leader>tt", "<cmd>TSC<cr>",                         desc = "Transpile TS" },
})
