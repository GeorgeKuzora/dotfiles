vim.pack.add({
  "https://github.com/mason-org/mason.nvim",
  "https://github.com/jay-babu/mason-nvim-dap.nvim",
  "https://github.com/nvim-neotest/nvim-nio",
  "https://github.com/leoluz/nvim-dap-go",
  "https://github.com/mfussenegger/nvim-dap-python",
  "https://github.com/mfussenegger/nvim-dap",
})

require("mason").setup()

local dap = require 'dap'

dap.defaults.fallback.terminal_win_cmd = '50vsplit new'

require('mason-nvim-dap').setup {
  automatic_setup = true,
  handlers = {},
  ensure_installed = {
    'delve',
    'debugpy',
  },
}

require('dap-go').setup( { delve = {} })
require('dap-python').setup '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'

local sign = vim.fn.sign_define
sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
sign("DapStopped", { text = "→", texthl = "DapStopped", linehl = "", numhl = ""})
sign("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected", linehl = "", numhl = ""})

Map('n', '<leader>xb', dap.set_breakpoint, { desc = 'Debug: Set Breakpoint' })
Map('n', '<leader>xBb', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
Map('n', '<leader>xBe', dap.set_exception_breakpoints, { desc = 'Debug: Set Exception Breakpoint' })
Map('n', '<Leader>xBc', function()
  require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
end, { desc = 'Debug: Set breakpoint with condition' })
Map('n', '<Leader>xBl', function()
  require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
end, { desc = 'Debug: Set log point' })
Map('n', '<leader>xBv', dap.list_breakpoints, { desc = 'Debug: List breakpoints' })
Map('n', '<leader>xBx', dap.clear_breakpoints, { desc = 'Debug: Clear breakpoints' })

Map('n', '<leader>xc', dap.continue, { desc = 'Debug: Start/Continue' })
Map('n', '<leader>xr', dap.run_to_cursor, { desc = 'Debug: Run to cursor' })

Map('n', '<leader>x<Right>', dap.step_into, { desc = 'Debug: Step Into' })
Map('n', '<leader>x<Left>', dap.step_out, { desc = 'Debug: Step Out' })
Map('n', '<leader>x<Down>', dap.step_over, { desc = 'Debug: Step Over' })
Map('n', '<leader>x<Down>', dap.restart_frame, { desc = 'Debug: Restart frame' })

Map('n', '<leader>xr', dap.repl.toggle, { desc = 'Debug: REPL' })

Map('n', '<leader>xp', dap.pause, { desc = 'Debug: Pause' })
Map('n', '<leader>xx', dap.restart, { desc = 'Debug: Restart' })
Map('n', '<leader>xl', dap.run_last, { desc = 'Debug: Run last' })
Map('n', '<leader>xq', dap.terminate, { desc = 'Debug: Terminate' })

Map({'n', 'v'}, '<Leader>xh', function()
  require('dap.ui.widgets').hover()
end, { desc = 'Debug: Hover symbol' })
Map({'n', 'v'}, '<Leader>xv', function()
  require('dap.ui.widgets').preview()
end, { desc = 'Debug: Preview symbol' })
Map('n', '<Leader>xf', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.frames)
end, { desc = 'Debug: Frames' })
Map('n', '<Leader>xs', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.scopes)
end, { desc = 'Debug: Scopes' })
Map('n', '<Leader>xt', function()
  local widgets = require('dap.ui.widgets')
  widgets.centered_float(widgets.threads)
end, { desc = 'Debug: Threads' })
