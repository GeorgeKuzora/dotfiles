return {
  'folke/todo-comments.nvim',
  dependencies = { 'nvim-lua/plenary.nvim' },
  optional = true,
  opts = { signs = false },
  keys = {
    { "<leader>ft", function() Snacks.picker.todo_comments() end, desc = "Todo" },
    { "<leader>fT", function () Snacks.picker.todo_comments({ keywords = { "TODO", "FIX", "FIXME" } }) end, desc = "Todo/Fix/Fixme" },
  },
}
