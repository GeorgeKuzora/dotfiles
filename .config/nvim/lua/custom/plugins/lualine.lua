return {
  {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    name = 'lualine',
    opts = {},
    config = function()
      local lualine = require 'lualine'

      local function show_macro_recording()
        local recording_register = vim.fn.reg_recording()
        if recording_register == '' then
          return ''
        else
          return 'Recording @' .. recording_register
        end
      end

      local function show_russian_keymap()
        local keymap = vim.opt.iminsert:get()
        if keymap == 1 then
          return 'ru'
        else
          return
        end
      end

      lualine.setup {
        options = {
          icons_enabled = true,
          theme = 'catppuccin',
          component_separators = '|',
          section_separators = '',
        },
        sections = {
          lualine_b = {
            {
              'russian-keymap',
              fmt = show_russian_keymap,
            },
            {
              'macro-recording',
              fmt = show_macro_recording,
            },
          },
        },
      }
    end,
  },
}
