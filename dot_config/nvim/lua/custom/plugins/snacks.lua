local lsp_config = {
  jump = { reuse_win = false },
}

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  opts = {
    words = {},
    picker = {
      jump = { reuse_win = false },
    },
    scope = {},
    statuscolumn = {},
    lazygit = {},
    rename = {},
    dashboard = {},
    indent = {
      indent = {
        priority = 1,
        enabled = false, -- enable indent guide,
        char = '┊',
        only_scope = false, -- only show indent guides of the scope,
        only_current = true, -- only show indent guides in the current window,
        hl = 'SnacksIndent', ---@type string|string[] hl groups for indent guide,
      },
      scope = {
        enabled = true, -- enable highlighting the current scope
        priority = 200,
        char = '┊',
        underline = false, -- underline the start of the scope
        only_current = true, -- only show scope in the current window
        hl = 'SnacksIndentScope',
      },
    },
    input = {
      win = {
        relative = "cursor",
        row = -3,
        col = 0,
        width = 20,
      }
    },
  },
  keys = {
    -- Git
    { '<leader>gg', function() Snacks.lazygit.open() end, desc = 'LazyGit', },
    { "<leader>gB", function() Snacks.picker.git_branches() end, desc = "Git Branches" },
    { "<leader>gf", function() Snacks.picker.git_log_file() end, desc = "Git Log File" },
    { "<leader>gl", function() Snacks.picker.git_log_line() end, desc = "Git Log Line" },
    { "<leader>gL", function() Snacks.picker.git_log() end, desc = "Git Log" },
    { "<leader>gs", function() Snacks.picker.git_status() end, desc = "Git Status" },
    { "<leader>gS", function() Snacks.picker.git_stash() end, desc = "Git Stash" },
    { "<leader>gd", function() Snacks.picker.git_diff() end, desc = "Git Diff (Hunks)" },
    { "<leader>gb", function() Snacks.git.blame_line() end, desc = "Git blame line" },
    { "<leader>gw", function() Snacks.gitbrowse() end, desc = "Git Browse", mode = { "n", "v" } },
    -- Grep
    { "g/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "g?", function() Snacks.picker.grep_word() end, desc = "Visual selection or word", mode = { "n", "x" } },
    { "gb", function() Snacks.picker.grep_buffers() end, desc = "Grep Open Buffers" },
    { "<leader>/", function() Snacks.picker.lines() end, desc = "Buffer Lines" },
    -- Find Files
    { "<leader><space>", function() Snacks.picker.smart() end, desc = "Smart Find Files" },
    { "<leader>fo", function() Snacks.picker.buffers() end, desc = "Find Opened Buffers" },
    { "<leader>ff", function() Snacks.picker.files() end, desc = "Find Files" },
    { "<leader>fF", function() Snacks.picker.files({ hidden = true, ignored = true }) end, desc = "Find Files" },
    { "<leader>fg", function() Snacks.picker.git_files() end, desc = "Find Git Files" },
    -- Find Diagnostics
    { "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, desc = "Buffer Diagnostics" },
    { "<leader>fD", function() Snacks.picker.diagnostics() end, desc = "Diagnostics" },
    -- Find History
    { '<leader>f/', function() Snacks.picker.search_history() end, desc = "Search History" },
    { "<leader>fc", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>fn", function() Snacks.picker.notifications() end, desc = "Notification History" },
    { "<leader>fu", function() Snacks.picker.undo() end, desc = "Undo History" },
    -- Find Locations
    { "<leader>fj", function() Snacks.picker.jumps() end, desc = "Jumps" },
    { "<leader>fm", function() Snacks.picker.marks() end, desc = "Marks" },
    { "<leader>fq", function() Snacks.picker.qflist() end, desc = "Quickfix List" },
    { "<leader>fl", function() Snacks.picker.loclist() end, desc = "Location List" },
    -- Find Nvim
    { "<leader><CR>", function() Snacks.picker.resume() end, desc = "Resume Find" },
    { "<leader>fk", function() Snacks.picker.keymaps() end, desc = "Keymaps" },
    { "<leader>fh", function() Snacks.picker.help() end, desc = "Help Pages" },
    { "<leader>fi", function() Snacks.picker.cliphist() end, desc = "Clipboard" },
    { "z,", function() Snacks.picker.spelling() end, desc = "Spelling" },
    { "<leader>fp", function() Snacks.picker.projects() end, desc = "Projects" },
    { "<leader>fr", function() Snacks.picker.recent() end, desc = "Recent" },
    { '<leader>f"', function() Snacks.picker.registers() end, desc = "Registers" },
    { "<leader>fa", function() Snacks.picker.autocmds() end, desc = "Autocmds" },
    { "<leader>fC", function() Snacks.picker.commands() end, desc = "Commands" },
    { "<leader>fx", function() Snacks.picker.lsp_config() end, desc = "Lsp Config" },
    -- LSP
    { "gd", function() Snacks.picker.lsp_definitions(lsp_config) end, desc = "Goto Definition" },
    { "gD", function() Snacks.picker.lsp_declarations() end, desc = "Goto Declaration" },
    { "grr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
    { "gri", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
    { "grt", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto Type Definition" },
    { "gai", function() Snacks.picker.lsp_incoming_calls() end, desc = "C[a]lls Incoming" },
    { "gao", function() Snacks.picker.lsp_outgoing_calls() end, desc = "C[a]lls Outgoing" },
    { "go", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "gs", function() Snacks.picker.lsp_symbols() end, desc = "LSP Symbols" },
    { "gO", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    { "gS", function() Snacks.picker.lsp_workspace_symbols() end, desc = "LSP Workspace Symbols" },
    -- Scope
    { '<leader>;', function() Snacks.scope.jump() end, desc = 'Go to start of current scope', mode = { 'n', 'v' } },
    -- Words
    { ']w', function() Snacks.words.jump(1, true) end, desc = 'Next word', mode = { 'n', 'o', 'x' } },
    { '[w', function() Snacks.words.jump(-1, true) end, desc = 'Previous word', mode = { 'n', 'o', 'x' } },
  },
}
