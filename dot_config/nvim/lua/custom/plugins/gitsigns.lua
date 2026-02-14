return {
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    -- See `:help gitsigns.txt`
    signs = {
      add = { text = '+' },
      change = { text = '~' },
      delete = { text = '_' },
      topdelete = { text = '‾' },
      changedelete = { text = '~' },
      untracked = { text = '?' },
    },
    attach_to_untracked = true,

    on_attach = function(bufnr)
      local gitsigns = require('gitsigns')

      local map = vim.keymap.set

      -- Navigation
      map('n', ']h', function()
        if vim.wo.diff then
          vim.cmd.normal({']g', bang = true})
        else
          gitsigns.nav_hunk('next')
        end
      end,
      { desc = 'Next hunk' }
      )

      map('n', '[h', function()
        if vim.wo.diff then
          vim.cmd.normal({'[g', bang = true})
        else
          gitsigns.nav_hunk('prev')
        end
      end,
      { desc = 'Previous hunk' }
    )

      -- Actions
      map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
      map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })

      map('v', '<leader>hs', function()
        gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, { desc = 'Stage selected' })

      map('v', '<leader>hr', function()
        gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
      end, { desc = 'Reset selected' })

      map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
      map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
      map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
      map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })

      map('n', '<leader>hb', function()
        gitsigns.blame_line()
      end, { desc = 'Blame current line' })

      map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff buffer' })
      map('n', '<leader>hD', function()
        gitsigns.diffthis('~')
      end, { desc = 'Diff project' })

      map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = 'Send all hunks to quickfix' })
      map('n', '<leader>hq', gitsigns.setqflist, { desc = 'Send current buffer hunks to quickfix' })

      -- Toggles
      map('n', '<leader>hB', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line blame' })
      map('n', '<leader>hw', gitsigns.toggle_word_diff, { desc = 'Toggle word diff' })

      -- Text object
      map({'o', 'x'}, 'ih', gitsigns.select_hunk, { desc = 'Inside hunk' })
    end
  },
}
