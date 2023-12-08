local status, wk = pcall(require, "which-key")
if (not status) then return end

wk.register({
  t = {
    name = "Typescript commands",
    t = { "<cmd>TSC<cr>", "Transpile TS" },
    m = { "<cmd>TypescriptAddMissingImports<cr>", "Add missing imports" },
    r = { "<cmd>TypescriptRemoveUnused<cr>", "Remove unused symbols" }
  },
}, { prefix = "<Leader>" })
