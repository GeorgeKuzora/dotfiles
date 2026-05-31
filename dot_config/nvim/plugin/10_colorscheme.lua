local theme = "sora"

vim.pack.add({
  {
    src = "https://github.com/Aejkatappaja/sora",
    name = theme,
  }
})

require("sora").setup({
  transparent = false,
  italic = true,
  italic_comments = true,

  on_colors = function(colors)
    -- colors.bg = "#000000"
  end,

  on_highlights = function(hl, colors)
    -- hl.Normal = { fg = colors.fg, bg = "#000000" }
  end,
})

vim.cmd.colorscheme(theme)
