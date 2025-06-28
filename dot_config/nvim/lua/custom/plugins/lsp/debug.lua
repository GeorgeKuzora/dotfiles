return {
  'mfussenegger/nvim-dap',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    -- Creates a beautiful debugger UI
    'rcarriga/nvim-dap-ui',
    'theHamsta/nvim-dap-virtual-text',

    -- Installs the debug adapters for you
    'williamboman/mason.nvim',
    'jay-babu/mason-nvim-dap.nvim',

    -- Add your own debuggers here
    'leoluz/nvim-dap-go',
    'mfussenegger/nvim-dap-python',
    'nvim-neotest/nvim-nio',
  },
  config = function()
    local dap = require 'dap'
    local dapui = require 'dapui'

    require('mason-nvim-dap').setup {
      automatic_setup = true,
      handlers = {},
      ensure_installed = {
        'delve',
        'debugpy',
      },
    }

    dapui.setup {
      icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
      controls = {
        icons = {
          pause = '⏸',
          play = '▶',
          step_into = '⏎',
          step_over = '⏭',
          step_out = '⏮',
          step_back = 'b',
          run_last = '▶▶',
          terminate = '⏹',
          disconnect = '⏏',
        },
      },
    }
    dap.listeners.after.event_initialized['dapui_config'] = dapui.open
    dap.listeners.before.event_terminated['dapui_config'] = dapui.close
    dap.listeners.before.event_exited['dapui_config'] = dapui.close
    vim.fn.sign_define('DapBreakpoint', { text = '🔴', texthl = 'red', linehl = '', numhl = '' })
    require('nvim-dap-virtual-text').setup {}

    require('dap-go').setup( {
      delve = {},
    })
    require('dap-python').setup '~/.local/share/nvim/mason/packages/debugpy/venv/bin/python'

    vim.keymap.set('n', '<leader>xx', dap.restart, { desc = 'Debug: Restart' })
    vim.keymap.set('n', '<leader>xe', function()
      require('dapui').eval(nil, { enter = true })
    end, { desc = 'Debug: Evaluate variable' })
    vim.keymap.set('n', '<leader>xr', dap.run_to_cursor, { desc = 'Debug: Run to cursor' })
    vim.keymap.set('n', '<leader>xc', dap.continue, { desc = 'Debug: Start/Continue' })
    vim.keymap.set('n', '<leader>xB', function()
      dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
    end, { desc = 'Debug: Set Breakpoint with condition' })
    vim.keymap.set('n', '<leader>xt', dapui.toggle, { desc = 'Debug: See last session result.' })
    vim.keymap.set('n', '<leader>xp', dap.pause, { desc = 'Debug: Pause' })
    vim.keymap.set('n', '<leader>xb', dap.toggle_breakpoint, { desc = 'Debug: Toggle Breakpoint' })
    vim.keymap.set('n', '<leader>xo', dap.step_over, { desc = 'Debug: Step Over' })
    vim.keymap.set('n', '<leader>xi', dap.step_into, { desc = 'Debug: Step Into' })
    vim.keymap.set('n', '<leader>xu', dap.step_out, { desc = 'Debug: Step Out' })
    vim.keymap.set('n', '<leader>xs', dap.terminate, { desc = 'Debug: Stop' })
  end,
}
