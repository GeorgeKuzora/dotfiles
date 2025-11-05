return {
  {
    'nvim-lualine/lualine.nvim',
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

      local function lsp_server_name()
        local clients = vim.lsp.get_clients { bufnr = 0 }
        if not next(clients) then
          return
        end

        local names = {}
        for i, client in ipairs(clients) do
          names[i] = client.name
        end

        return table.concat(names, ', ')
      end

      lualine.setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = '|',
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        },
        sections = {
          lualine_a = { 'mode', {
            'russian-keymap',
            fmt = show_russian_keymap,
          } },
          lualine_b = { 'branch', 'diff', 'diagnostics' },
          lualine_c = {
            {
              'macro-recording',
              fmt = show_macro_recording,
            },
            {
              'filename',
              file_status = true,
              newfile_status = true,
              path = 1,
            },
          },
          lualine_x = {
            'encoding',
            'fileformat',
            'filetype',
            {
              'lsp_server_name',
              fmt = lsp_server_name,
              icon = ' ',
            },
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },
}
