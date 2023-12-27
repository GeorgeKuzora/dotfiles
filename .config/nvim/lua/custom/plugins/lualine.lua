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
              'macro-recording',
              fmt = show_macro_recording,
            },
          },
        },
      }
    end,
  },
}
