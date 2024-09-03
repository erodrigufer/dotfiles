local status, mason = pcall(require, "mason")
if (not status) then return end
local status2, masonLspconfig = pcall(require, "mason-lspconfig")
if (not status2) then return end

mason.setup({
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})

-- prettier cannot be installed with this command, it must still be install manually!!
masonLspconfig.setup {
  automatic_installation = true,
    "docker_compose_language_service", "eslint", "gopls", "jsonls", "tsserver", "lua_ls", "html",
  ensure_installed = { "awk_ls", "bashls", "arduino_language_server", "cssls", "dockerls",
    "terraformls" }
}
