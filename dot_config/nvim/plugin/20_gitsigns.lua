vim.pack.add({
  "https://github.com/lewis6991/gitsigns.nvim",
})
require("gitsigns").setup({
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

    -- Navigation
    Map('n', ']h', function()
      if vim.wo.diff then
        vim.cmd.normal({']g', bang = true})
      else
        gitsigns.nav_hunk('next')
      end
    end,
    { desc = 'Next hunk' }
    )

    Map('n', '[h', function()
      if vim.wo.diff then
        vim.cmd.normal({'[g', bang = true})
      else
        gitsigns.nav_hunk('prev')
      end
    end,
    { desc = 'Previous hunk' }
  )

    -- Actions
    Map('n', '<leader>hs', gitsigns.stage_hunk, { desc = 'Stage hunk' })
    Map('n', '<leader>hr', gitsigns.reset_hunk, { desc = 'Reset hunk' })

    Map('v', '<leader>hs', function()
      gitsigns.stage_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = 'Stage selected' })

    Map('v', '<leader>hr', function()
      gitsigns.reset_hunk({ vim.fn.line('.'), vim.fn.line('v') })
    end, { desc = 'Reset selected' })

    Map('n', '<leader>hS', gitsigns.stage_buffer, { desc = 'Stage buffer' })
    Map('n', '<leader>hR', gitsigns.reset_buffer, { desc = 'Reset buffer' })
    Map('n', '<leader>hp', gitsigns.preview_hunk, { desc = 'Preview hunk' })
    Map('n', '<leader>hi', gitsigns.preview_hunk_inline, { desc = 'Preview hunk inline' })

    Map('n', '<leader>hb', function()
      gitsigns.blame_line()
    end, { desc = 'Blame current line' })

    Map('n', '<leader>hd', gitsigns.diffthis, { desc = 'Diff buffer' })
    Map('n', '<leader>hD', function()
      gitsigns.diffthis('~')
    end, { desc = 'Diff project' })

    Map('n', '<leader>hQ', function() gitsigns.setqflist('all') end, { desc = 'Send all hunks to quickfix' })
    Map('n', '<leader>hq', gitsigns.setqflist, { desc = 'Send current buffer hunks to quickfix' })

    -- Toggles
    Map('n', '<leader>hB', gitsigns.toggle_current_line_blame, { desc = 'Toggle current line blame' })
    Map('n', '<leader>hw', gitsigns.toggle_word_diff, { desc = 'Toggle word diff' })

    -- Text object
    Map({'o', 'x'}, 'ih', gitsigns.select_hunk, { desc = 'Inside hunk' })
  end
})
