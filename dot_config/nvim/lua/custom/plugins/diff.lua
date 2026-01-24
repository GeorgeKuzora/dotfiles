return {
  "esmuellert/codediff.nvim",
  dependencies = { "MunifTanjim/nui.nvim" },
  cmd = "CodeDiff",
  keys = {
    { '<leader>go', '<cmd>CodeDiff<cr>', desc = 'Toggle CodeDiff' },
  },
}
