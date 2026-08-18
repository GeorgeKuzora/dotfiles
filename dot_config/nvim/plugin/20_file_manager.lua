vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
})

local o = require 'oil'
o.setup {
  keymaps = {
    ['q'] = { "actions.close", mode = "n" },
  },
  columns = {},
  view_options = {
    show_hidden = true,
  },
  cleanup_delay_ms = 10,
}

Map('n', '-', function()
  o.open(nil)
end, { desc = 'Oil open parent directory' })
