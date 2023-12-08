local status, telescope = pcall(require, "telescope")
if (not status) then return end

-- Load the file_browser extension for telescope.
telescope.load_extension "file_browser"
