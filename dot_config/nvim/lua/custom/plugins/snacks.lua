return {
  {
    'folke/snacks.nvim',
    dependencies = {
      'folke/todo-comments.nvim',
    },
    priority = 1000,
    lazy = false,
    opts = {
      statuscolumn = { enabled = true },
      lazygit = { enabled = true },
      rename = { enabled = true },
      indent = {
        indent = {
          priority = 1,
          enabled = true, -- enable indent guide,
          char = '┊',
          only_scope = false, -- only show indent guides of the scope,
          only_current = false, -- only show indent guides in the current window,
          hl = 'SnacksIndent', ---@type string|string[] hl groups for indent guide,
        },
        animate = {
          enabled = vim.fn.has 'nvim-0.10' == 1,
          style = 'out',
          easing = 'linear',
          duration = {
            step = 20, -- ms per step
            total = 500, -- maximum duration
          },
        },
        scope = {
          enabled = true, -- enable highlighting the current scope
          priority = 200,
          char = '┊',
          underline = false, -- underline the start of the scope
          only_current = false, -- only show scope in the current window
          hl = 'SnacksIndentScope',
        },
      },
      picker = {},
      explorer = {},
      dashboard = {},
      toggle = {},
      scope = {},
    },
    keys = {
      { '<leader>gg', function() Snacks.lazygit.open() end, desc = 'LazyGit', },
      { 'gs', function() Snacks.scope.jump() end, desc = 'Go to start of current scope', mode = { 'n', 'v' } },
      { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
      -- Pickers
      -- git
      { "<leader>gb", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
      { "<leader>gl", function() Snacks.picker.git_log() end, desc = "Git Log" },
      { "<leader>gL", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
      { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
      { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
      { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
      { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
      -- Grep
      { "<leader>fB", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
      { "<leader>fg", function() Snacks.picker.grep() end, desc = "Grep" },
      { "<leader>fw", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
      -- Find
      { "<leader>/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
      { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
      { "z,", function() Snacks.picker.spelling() end, desc = "Spelling" },
      { "<leader>fi", function() Snacks.picker.cliphist() end, desc = "Clipboard" },
      { "<leader>fb", function() Snacks.picker.buffers() end, desc = "Buffers" },
      { "<leader>fn", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
      { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
      { "<leader>fF", function() Snacks.picker.files({ hidden = true, ignored = true }) end, desc = "Find Files" },
      { "<leader>fG", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
      { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
      { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
      { '<leader>f"', function() Snacks.picker.registers() end, desc = "Registers" },
      { '<leader>f/', function() Snacks.picker.search_history() end, desc = "Search History" },
      { "<leader>fa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
      { "<leader>fc", function() Snacks.picker.command_history() end, desc = "Command History" },
      { "<leader>fC", function() Snacks.picker.commands() end, desc = "Commands" },
      { "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
      { "<leader>fD", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
      { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
      { "<leader>fj", function() Snacks.picker.jumps() end, desc = "Jumps" },
      { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
      { "<leader>fl", function() Snacks.picker.loclist() end, desc = "Location List" },
      { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
      { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
      { "<leader><CR>", function() Snacks.picker.resume() end, desc = "Resume Find" },
      { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo History" },
      { "<leader>fx", function() Snacks.picker.lsp_config() end, desc = "Lsp Config" },
      -- { "<leader>fn", function() Snacks.picker.notifications() end, desc = "Notification History" },
      -- { "<leader>fH", function() Snacks.picker.highlights() end, desc = "Highlights" },
      -- { "<leader>fi", function() Snacks.picker.icons() end, desc = "Icons" },
      -- { "<leader>fp", function() Snacks.picker.lazy() end, desc = "Search for Plugin Spec" },
      -- { "<leader>uC", function() Snacks.picker.colorschemes() end, desc = "Colorschemes" },
      -- { "<leader>fM", function() Snacks.picker.man() end, desc = "Man Pages" },
      -- LSP
      { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition" },
      { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
      { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
      { "gri", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
      { "grt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto Type Definition" },
      { "go", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
      { "gO", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    },
  },
}
