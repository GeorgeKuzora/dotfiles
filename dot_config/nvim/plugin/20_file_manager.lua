vim.pack.add({
  { src = 'https://github.com/nvim-mini/mini.files', version = 'stable' },
})
local files = require('mini.files')
files.setup()
Map("n", "-", function() MiniFiles.open() end, { desc = "File Manager" })
