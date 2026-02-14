return {
  {
    'sindrets/diffview.nvim',
    event = 'VeryLazy',
    opts = {
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
    },
  },
  {
    "julienvincent/hunk.nvim",
    cmd = { "DiffEditor" },
    dependencies = { "MunifTanjim/nui.nvim" },
    config = function()
      require("hunk").setup()
    end,
  },
}
