vim.pack.add({
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-neotest/neotest-python",
  "https://github.com/nvim-neotest/neotest-go",
  "https://github.com/nvim-neotest/neotest",
})

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
Map('n', '<leader>or', function()
  neotest.run.run()
end, { desc = 'Run nearest test' })
Map('n', '<leader>ol', function()
  neotest.run.run_last()
end, { desc = 'Run last test' })
Map('n', '<leader>ou', function()
  neotest.run.stop()
end, { desc = 'Stop running tests' })
Map('n', '<leader>of', function ()
  neotest.run.run(vim.fn.expand('%'))
end, { desc = 'Run tests in a current file' })
Map('n', '<leader>od', function ()
  neotest.run.run({strategy='dap'})
end, { desc = 'Run nearest test in debug mode' })
Map('n', '<leader>oa', function ()
  neotest.run.attach()
end, { desc = 'Attach to nearest test' })
Map('n', '<leader>ow', function ()
  neotest.watch.toggle()
end, { desc = 'Watch test files' })
Map('n', '<leader>oo', function ()
  neotest.output.open({ enter = true })
end, { desc = 'Displays output of tests' })
Map('n', '<leader>op', function ()
  neotest.output_panel.toggle()
end, { desc = 'Toggle test output panel' })
Map('n', '<leader>oc', function ()
  neotest.output_panel.clear()
end, { desc = 'Clear output panel' })
Map('n', '<leader>os', function ()
  neotest.summary.toggle()
end, { desc = 'Displays test suite structure' })
Map('n', '[T', function ()
  neotest.jump.prev({ status = "failed" })
end, { desc = 'Previous failed test' })
Map('n', ']T', function ()
  neotest.jump.next({ status = "failed" })
end, { desc = 'Next failed test' })
