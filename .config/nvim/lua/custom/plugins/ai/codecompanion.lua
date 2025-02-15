return {
  'olimorris/codecompanion.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    {
      'echasnovski/mini.diff',
      version = false,
      config = function()
        require('mini.diff').setup()
      end,
    },
  },
  opts = {
    adapters = {
      llama3 = function()
        return require('codecompanion.adapters').extend('ollama', {
          name = 'llama3',
          schema = {
            model = {
              default = 'qwen2.5-coder:7b',
            },
          },
          env = {
            url = 'http://127.0.0.1:29841',
          },
          headers = {
            ['Content-Type'] = 'application/json',
          },
          parameters = {
            sync = true,
          },
        })
      end,
    },
    strategies = {
      chat = {
        adapter = 'llama3',
        keymaps = {
          completion = {
            modes = {
              i = '<C-a>',
            },
            index = 1,
            callback = 'keymaps.completion',
            description = 'Completion Menu',
          },
        },
      },
      inline = {
        adapter = 'llama3',
      },
      cmd = {
        adapter = 'llama3',
      },
    },
    display = {
      diff = {
        -- enabled = true,
        -- close_chat_at = 240, -- Close an open chat buffer if the total columns of your display are less than...
        -- layout = "vertical", -- vertical|horizontal split for default provider
        -- opts = { "internal", "filler", "closeoff", "algorithm:patience", "followwrap", "linematch:120" },
        provider = 'mini_diff', -- default|mini_diff
      },
    },
  },
  keys = {
    {
      '<leader>at',
      '<cmd>CodeCompanionChat Toggle<cr>',
      desc = 'Toggle CodeCompanionChat',
      mode = { 'n', 'v', 'x' },
    },
    {
      '<leader>an',
      '<cmd>CodeCompanionChat<cr>',
      desc = 'New CodeCompanionChat',
      mode = { 'n', 'v', 'x' },
    },
    {
      '<leader>ai',
      '<cmd>CodeCompanion<cr>',
      desc = 'Inline CodeCompanionChat',
      mode = { 'n', 'v', 'x' },
    },
    {
      '<leader>aa',
      '<cmd>CodeCompanionChat Add<cr>',
      desc = 'Add to CodeCompanionChat',
      mode = { 'n', 'v', 'x' },
    },
    {
      '<leader>as',
      '<cmd>CodeCompanionActions<cr>',
      desc = 'Actions CodeCompanionChat',
      mode = { 'n', 'v', 'x' },
    },
  },
  config = true,
}
