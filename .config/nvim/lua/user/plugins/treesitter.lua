return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = { "lua", "python", "java", "c_sharp", "css", "html", "htmldjango", "javascript", "json", "markdown", "markdown_inline", "sql", "typescript" },
    rainbow = {
      enable = true,
      disable = { "jsx", "cpp" }, -- list of languages you want to disable the plugin for
      extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
      max_file_lines = nil, -- Do not enable for files with more than n lines, int
      -- colors = {}, -- table of hex strings
      -- termcolors = {} -- table of colour name strings
      hlgroups = {
               'TSRainbowRed',
               'TSRainbowYellow',
               'TSRainbowBlue',
               'TSRainbowOrange',
               'TSRainbowGreen',
               'TSRainbowViolet',
               'TSRainbowCyan'
      },
    },
  }
}
