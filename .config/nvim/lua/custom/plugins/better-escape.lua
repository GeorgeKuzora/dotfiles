return {
  'max397574/better-escape.nvim',
  config = function()
    local escape = function()
      vim.api.nvim_input '<esc>'
      local current_line = vim.api.nvim_get_current_line()
      if current_line:match '^%s+i$' or current_line:match '^%s+ш$' then
        vim.schedule(function()
          vim.api.nvim_set_current_line ''
        end)
      end
      return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
    end
    require('better_escape').setup {
      timeout = vim.o.timeoutlen,
      mappings = {
        i = {
          i = {
            -- These can all also be functions
            i = escape,
          },
          ш = {
            -- These can all also be functions
            ш = escape,
          },
        },
      },
    }
  end,
}
