return {
  'sindrets/diffview.nvim',
  opts = {
    view = {
      merge_tool = {
        layout = 'diff3_mixed',
      },
    },
  },
  keys = {
    { '<leader>go', '<cmd>DiffviewOpen<cr>', desc = 'Open Diffview' },
    { '<leader>gc', '<cmd>DiffviewClose<cr>', desc = 'Close Diffview' },
  },
}
