return {
  'utilyre/barbecue.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  name = 'barbecue',
  version = '*',
  dependencies = {
    'SmiteshP/nvim-navic',
    'nvim-tree/nvim-web-devicons', -- optional dependency
  },
  opts = {
    -- configurations go here
  },
  config = function()
    -- triggers CursorHold event faster
    vim.opt.updatetime = 200

    require('barbecue').setup {
      theme = 'catppuccin-mocha', -- catppuccin-latte, catppuccin-frappe, catppuccin-macchiato, catppuccin-mocha
      create_autocmd = false, -- prevent barbecue from updating itself automatically
    }

    vim.api.nvim_create_autocmd({
      'WinResized', -- or WinResized on NVIM-v0.9 and higher
      'BufWinEnter',
      'CursorHold',
      'InsertLeave',

      -- include this if you have set `show_modified` to `true`
      'BufModifiedSet',
    }, {
      group = vim.api.nvim_create_augroup('barbecue.updater', {}),
      callback = function()
        require('barbecue.ui').update()
      end,
    })

    vim.keymap.set('n', '<leader>lb', function()
      require('barbecue.ui').toggle()
    end, { desc = 'Toggle [B]arbecue ui' })
  end,
}
