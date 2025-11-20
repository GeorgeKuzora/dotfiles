return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>rx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>rw',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>rd',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>rs',
      '<cmd>Trouble symbols toggle focus=false win.position=right<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>;',
      '<cmd>Trouble symbols toggle focus=true win.position=right<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>rl',
      '<cmd>Trouble lsp toggle focus=false win.position=bottom<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>rL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>rq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
    {
      '<leader>rr',
      '<cmd>Trouble lsp_references toggle<cr>',
      desc = 'Trouble LSP References',
    },
    {
      '<leader>rt',
      '<cmd>Trouble lsp_type_definitions toggle<cr>',
      desc = 'Trouble LSP Type Definitions',
    },
    {
      '<leader>ro',
      '<cmd>Trouble todo toggle<cr>',
      desc = 'Open todos in trouble',
    },
    {
      '<leader>rc',
      function ()
        require("trouble").close()
      end,
      desc = 'Close trouble',
    },
  },
}
