return {
  'folke/trouble.nvim',
  opts = {}, -- for default options, refer to the configuration section for custom setup.
  cmd = 'Trouble',
  keys = {
    {
      '<leader>xx',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xw',
      '<cmd>Trouble diagnostics toggle<cr>',
      desc = 'Diagnostics (Trouble)',
    },
    {
      '<leader>xd',
      '<cmd>Trouble diagnostics toggle filter.buf=0<cr>',
      desc = 'Buffer Diagnostics (Trouble)',
    },
    {
      '<leader>xs',
      '<cmd>Trouble symbols toggle focus=false win.position=right<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>a',
      '<cmd>Trouble symbols toggle focus=true win.position=right<cr>',
      desc = 'Symbols (Trouble)',
    },
    {
      '<leader>xl',
      '<cmd>Trouble lsp toggle focus=false win.position=bottom<cr>',
      desc = 'LSP Definitions / references / ... (Trouble)',
    },
    {
      '<leader>xL',
      '<cmd>Trouble loclist toggle<cr>',
      desc = 'Location List (Trouble)',
    },
    {
      '<leader>xq',
      '<cmd>Trouble qflist toggle<cr>',
      desc = 'Quickfix List (Trouble)',
    },
    {
      '<leader>xr',
      '<cmd>Trouble lsp_references toggle<cr>',
      desc = 'Trouble LSP References',
    },
    {
      '<leader>xt',
      '<cmd>Trouble lsp_type_definitions toggle<cr>',
      desc = 'Trouble LSP Type Definitions',
    },
    {
      '<leader>xo',
      '<cmd>Trouble todo toggle<cr>',
      desc = 'Open todos in trouble',
    },
    {
      '<leader>xc',
      function ()
        require("trouble").close()
      end,
      desc = 'Open todos in trouble',
    },
  },
}
