return {
  {
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup {
        indent = { char = '┊' },
        scope = {
          enabled = false,
          show_start = false,
          show_end = false,
        },
      }
    end,
  },

  {
    'echasnovski/mini.indentscope',
    version = false,
    config = function()
      require('mini.indentscope').setup {
        mappings = {
          -- Textobjects
          object_scope = 'in',
          object_scope_with_border = 'an',

          -- Motions (jump to respective border line; if not present - body line)
          goto_top = '[n',
          goto_bottom = ']n',
        },
        symbol = '┊',
      }
    end,
  },
}
