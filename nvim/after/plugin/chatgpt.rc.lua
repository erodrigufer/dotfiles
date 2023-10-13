local status, chatgpt = pcall(require, "chatgpt")
if (not status) then return end

local home = vim.fn.expand("$HOME")

chatgpt.setup({
  -- Requires a file at '${HOME}/.chatgpt.vim.env' with the OpenAI API token.
  api_key_cmd = "cat " .. home .. "/.chatgpt.nvim.env"
})
