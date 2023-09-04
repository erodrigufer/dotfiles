local status, colorizer = pcall(require,'colorizer')
if (not status) then return end

colorizer.setup {
  '*'; -- Highlight all files, but customize some others.
  '!vim'; -- Exclude vim from highlighting.
  -- Exclusion Only makes sense if '*' is specified!
}
