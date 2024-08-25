local status, octo = pcall(require, "octo")
if (not status) then return end

octo.setup({
  enable_builtin = true,
  suppress_missing_scope = {
    projects_v2 = true,
  },
})
