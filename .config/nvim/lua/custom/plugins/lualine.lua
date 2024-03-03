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

      local function maximize_status()
        return vim.t.maximized and '   ' or ''
      end

      local function lsp_server_name()
        local msg = 'No Active Lsp'
        local buf_ft = vim.api.nvim_get_option_value('filetype', { buf = 0 })
        local clients = vim.lsp.get_clients()
        if next(clients) == nil then
          return msg
        end
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return msg
      end

      lualine.setup {
        options = {
          icons_enabled = true,
          theme = 'rose-pine',
          component_separators = '|',
          section_separators = '',
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
            { 'maximize_status', fmt = maximize_status },
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
              icon = ' LSP:',
            },
          },
          lualine_y = { 'progress' },
          lualine_z = { 'location' },
        },
      }
    end,
  },
}
