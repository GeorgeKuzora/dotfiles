local theme = "vesper"

vim.pack.add({
  {
    src = "https://github.com/datsfilipe/vesper.nvim",
    name = theme,
  }
})

require('vesper').setup {}

vim.cmd.colorscheme(theme)
