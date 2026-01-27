return {
  "nvim-neotest/neotest",
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "nvim-neotest/neotest-python",
    "nvim-neotest/neotest-go",
  },
  config = function ()
    local neotest = require("neotest")

    local function getPytestArgs()
            local envVarValue = os.getenv('PYTEST_ADDOPTS')
            if envVarValue == nil then
                return {}
            end

            local list = {}
            for word in envVarValue:gmatch("%S+") do
                table.insert(list, word)
            end

        return list
    end

    require("neotest").setup {
      adapters = {
        require("neotest-python"){
          dap = { justMyCode = false },
          args = getPytestArgs,
          runner = "pytest",
        },
        require("neotest-go"),
      }
    }
    vim.keymap.set('n', '<leader>or', function()
      neotest.run.run()
    end, { desc = 'Run nearest test' })
    vim.keymap.set('n', '<leader>ol', function()
      neotest.run.run_last()
    end, { desc = 'Run last test' })
    vim.keymap.set('n', '<leader>ou', function()
      neotest.run.stop()
    end, { desc = 'Stop running tests' })
    vim.keymap.set('n', '<leader>of', function ()
      neotest.run.run(vim.fn.expand('%'))
    end, { desc = 'Run tests in a current file' })
    vim.keymap.set('n', '<leader>od', function ()
      neotest.run.run({strategy='dap'})
    end, { desc = 'Run nearest test in debug mode' })
    vim.keymap.set('n', '<leader>oa', function ()
      neotest.run.attach()
    end, { desc = 'Attach to nearest test' })
    vim.keymap.set('n', '<leader>ow', function ()
      neotest.watch.toggle()
    end, { desc = 'Watch test files' })
    vim.keymap.set('n', '<leader>oo', function ()
      neotest.output.open({ enter = true })
    end, { desc = 'Displays output of tests' })
    vim.keymap.set('n', '<leader>op', function ()
      neotest.output_panel.toggle()
    end, { desc = 'Toggle test output panel' })
    vim.keymap.set('n', '<leader>oc', function ()
      neotest.output_panel.clear()
    end, { desc = 'Clear output panel' })
    vim.keymap.set('n', '<leader>os', function ()
      neotest.summary.toggle()
    end, { desc = 'Displays test suite structure' })
    vim.keymap.set('n', '[T', function ()
      neotest.jump.prev({ status = "failed" })
    end, { desc = 'Previous failed test' })
    vim.keymap.set('n', ']T', function ()
      neotest.jump.next({ status = "failed" })
    end, { desc = 'Next failed test' })
  end
}
