local status, dashboard = pcall(require, "dashboard")
if (not status) then return end

dashboard.setup({
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
      concat = "erodrigufer",
    },
    shortcut = {
      {
        desc = '󰊳 Update',
        group = '@property',
        action = 'Lazy update',
        key = 'u'
      },
      {
        icon = ' ',
        icon_hl = '@variable',
        desc = 'Files',
        group = 'Label',
        action = 'Telescope find_files',
        key = 'f',
      },
      {
        icon = '⌕ ',
        icon_hl = '@variable',
        desc = 'Grep',
        group = 'Label',
        action = 'Telescope live_grep',
        key = 'l',
      },
    },
    footer = false,
  },
})
