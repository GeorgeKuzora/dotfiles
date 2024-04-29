return {
  'max397574/better-escape.nvim',
  lazy = true,
  event = 'InsertCharPre',
  opts = {
    timeout = 300,
    mapping = { 'ii', 'шш' },
    clear_empty_lines = false, -- clear line after escaping if there is only whitespace
    keys = function()
      return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
    end, -- keys used for escaping, if it is a function will use the result everytime
  },
}
