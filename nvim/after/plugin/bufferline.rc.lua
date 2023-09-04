local status, bufferline = pcall(require, "bufferline")
if (not status) then return end

local frappe = require("catppuccin.palettes").get_palette "frappe"
bufferline.setup {
    highlights = require("catppuccin.groups.integrations.bufferline").get {
        styles = { "italic", "bold" },
        custom = {
            all = {
                fill = { bg = "#000000" },
            },
            frappe = {
                background = { fg = frappe.text },
            },
            latte = {
                background = { fg = "#000000" },
            },
        },
    },
}
