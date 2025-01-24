return {
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    opts = {
      statuscolumn = { enabled = true },
      lazygit = { enabled = true },
      rename = { enabled = true },
      indent = {
        indent = {
          priority = 1,
          enabled = true, -- enable indent guide,
          char = '┊',
          only_scope = false, -- only show indent guides of the scope,
          only_current = false, -- only show indent guides in the current window,
          hl = 'SnacksIndent', ---@type string|string[] hl groups for indent guide,
        },
        animate = {
          enabled = vim.fn.has 'nvim-0.10' == 1,
          style = 'out',
          easing = 'linear',
          duration = {
            step = 20, -- ms per step
            total = 500, -- maximum duration
          },
        },
        scope = {
          enabled = true, -- enable highlighting the current scope
          priority = 200,
          char = '┊',
          underline = false, -- underline the start of the scope
          only_current = false, -- only show scope in the current window
          hl = 'SnacksIndentScope',
        },
      },
    },
    keys = {
      { '<leader>gl', function () Snacks.lazygit.open() end, desc = 'LazyGit' },
    },
  },
}
