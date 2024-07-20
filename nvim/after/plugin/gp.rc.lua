local status, gp = pcall(require, "gp")
if (not status) then return end

gp.setup({
  openai_api_key = { "cat", os.getenv("HOME") .. "/.openai.env" }
}
)
