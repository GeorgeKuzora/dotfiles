return {
  'milanglacier/minuet-ai.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { "<leader>av", '<cmd>Minuet virtualtext toggle<cr>', desc = "Toggle virtual text" },
  },
  config = function()
    require('minuet').setup {
      provider = 'openai_fim_compatible',
      n_completions = 1, -- recommended for local model for resource saving
      context_window = 512, -- adjust context window size for available computing resources
      provider_options = {
        openai_fim_compatible = {
          api_key = 'TERM',
          name = 'Ollama',
          end_point = 'http://127.0.0.1:29841/v1/completions',
          model = 'qwen2.5-coder:7b',
          optional = {
            max_tokens = 256,
            top_p = 0.9,
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = { 'python', 'lua', 'go' },
        show_on_completion_menu = true,
        keymap = {
          -- accept whole completion
          accept = '<C-A-y>',
          -- accept one line
          accept_line = '<C-y>',
          -- accept n lines (prompts for number)
          -- e.g. "A-z 2 CR" will accept 2 lines
          accept_n_lines = '<A-z>',
          -- Cycle to prev completion item, or manually invoke completion
          prev = '<A-[>',
          -- Cycle to next completion item, or manually invoke completion
          next = '<A-]>',
          dismiss = '<A-e>',
        },
      },
    }
    vim.cmd('Minuet virtualtext disable')
  end,
}
