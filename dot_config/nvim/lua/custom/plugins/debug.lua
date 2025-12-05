return {
  'mfussenegger/nvim-dap',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    'jay-babu/mason-nvim-dap.nvim',
    'nvim-neotest/nvim-nio',
    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
  },
  config = function()
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

    local sign = vim.fn.sign_define
    sign("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = ""})
    sign("DapBreakpointCondition", { text = "●", texthl = "DapBreakpointCondition", linehl = "", numhl = ""})
    sign("DapLogPoint", { text = "◆", texthl = "DapLogPoint", linehl = "", numhl = ""})
    sign("DapStopped", { text = "→", texthl = "DapStopped", linehl = "", numhl = ""})
    sign("DapBreakpointRejected", { text = "", texthl = "DapBreakpointRejected", linehl = "", numhl = ""})

    require('dap-go').setup( {
      delve = {},
    })

    require('dap-python').setup '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'

    vim.keymap.set('n', '<leader>xb', dap.set_breakpoint, { desc = 'Debug: Set Breakpoint' })
    vim.keymap.set('n', '<leader>xBb', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>xBe', dap.set_exception_breakpoints, { desc = 'Debug: Set Exception Breakpoint' })
    vim.keymap.set('n', '<Leader>xBc', function()
      require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))
    end, { desc = 'Debug: Set breakpoint with condition' })
    vim.keymap.set('n', '<Leader>xBl', function()
      require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
    end, { desc = 'Debug: Set log point' })
    vim.keymap.set('n', '<leader>xBv', dap.list_breakpoints, { desc = 'Debug: List breakpoints' })
    vim.keymap.set('n', '<leader>xBx', dap.clear_breakpoints, { desc = 'Debug: Clear breakpoints' })

    vim.keymap.set('n', '<leader>xc', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<leader>xr', dap.run_to_cursor, { desc = 'Debug: Run to cursor' })

    vim.keymap.set('n', '<leader>x<Right>', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<leader>x<Left>', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>x<Down>', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<leader>x<Down>', dap.restart_frame, { desc = 'Debug: Restart frame' })

    vim.keymap.set('n', '<leader>xr', dap.repl.toggle, { desc = 'Debug: REPL' })

    vim.keymap.set('n', '<leader>xp', dap.pause, { desc = 'Debug: Pause' })
    vim.keymap.set('n', '<leader>xx', dap.restart, { desc = 'Debug: Restart' })
    vim.keymap.set('n', '<leader>xl', dap.run_last, { desc = 'Debug: Run last' })
    vim.keymap.set('n', '<leader>xq', dap.terminate, { desc = 'Debug: Terminate' })

    vim.keymap.set({'n', 'v'}, '<Leader>xh', function()
      require('dap.ui.widgets').hover()
    end, { desc = 'Debug: Hover symbol' })
    vim.keymap.set({'n', 'v'}, '<Leader>xv', function()
      require('dap.ui.widgets').preview()
    end, { desc = 'Debug: Preview symbol' })
    vim.keymap.set('n', '<Leader>xf', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.frames)
    end, { desc = 'Debug: Frames' })
    vim.keymap.set('n', '<Leader>xs', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.scopes)
    end, { desc = 'Debug: Scopes' })
    vim.keymap.set('n', '<Leader>xt', function()
      local widgets = require('dap.ui.widgets')
      widgets.centered_float(widgets.threads)
    end, { desc = 'Debug: Threads' })
  end,
}
