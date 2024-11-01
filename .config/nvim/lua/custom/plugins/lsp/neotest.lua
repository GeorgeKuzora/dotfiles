return {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
  },
  config = function ()
    local neotest = require("neotest")
    require("neotest").setup {
      adapters = {
        require("neotest-python"){
          dap = { justMyCode = false },
        },
      }
    }
    vim.keymap.set('n', '<leader>tr', function()
      neotest.run.run()
    end, { desc = 'Run nearest test' })
    vim.keymap.set('n', '<leader>tf', function ()
      neotest.run.run(vim.fn.expand('%'))
    end, { desc = 'Run tests in a current file' })
    vim.keymap.set('n', '<leader>td', function ()
      neotest.run.run({strategy='dap'})
    end, { desc = 'Run nearest test in debug mode' })
    vim.keymap.set('n', '<leader>ta', function ()
      neotest.run.attach()
    end, { desc = 'Attach to nearest test' })
    vim.keymap.set('n', '<leader>tw', function ()
      neotest.watch()
    end, { desc = 'Watch test files' })
    vim.keymap.set('n', '<leader>to', function ()
      neotest.output()
    end, { desc = 'Displays output of tests' })
    vim.keymap.set('n', '<leader>tp', function ()
      neotest.output_panel()
    end, { desc = 'Records all output in a single window' })
    vim.keymap.set('n', '<leader>ts', function ()
      neotest.summary()
    end, { desc = 'Displays test suite structure' })
    vim.keymap.set('n', '<leader>tD', function ()
      neotest.diagnostic()
    end, { desc = 'Display error messages' })
    vim.keymap.set('n', '<leader>tS', function ()
      neotest.diagnostic()
    end, { desc = 'Displays the status of a test' })
  end
}
