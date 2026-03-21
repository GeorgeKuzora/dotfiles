vim.pack.add({
  "https://github.com/dtormoen/neural-open.nvim",
  "https://github.com/folke/snacks.nvim",
})

Snacks.setup({
  words = {},
  picker = {
    jump = { reuse_win = false },
  },
  scope = {},
  statuscolumn = {},
  lazygit = {},
  rename = {},
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
})

-- Git
Map("n", "<leader>gg", function() Snacks.lazygit.open() end, { desc = "LazyGit" })
Map("n", "<leader>gB", function() Snacks.picker.git_branches() end, { desc = "Git Branches" })
Map("n", "<leader>gf", function() Snacks.picker.git_log_file() end, { desc = "Git Log File" })
Map("n", "<leader>gl", function() Snacks.picker.git_log_line() end, { desc = "Git Log Line" })
Map("n", "<leader>gL", function() Snacks.picker.git_log() end, { desc = "Git Log" })
Map("n", "<leader>g/", function() Snacks.picker.git_grep() end, { desc = "Git Grep" })
Map("n", "<leader>gs", function() Snacks.picker.git_status() end, { desc = "Git Status" })
Map("n", "<leader>gS", function() Snacks.picker.git_stash() end, { desc = "Git Stash" })
Map("n", "<leader>gd", function() Snacks.picker.git_diff() end, { desc = "Git Diff (Hunks)" })
Map("n", "<leader>gb", function() Snacks.git.blame_line() end, { desc = "Git blame line" })
Map({ "n", "v" }, "<leader>gw", function() Snacks.gitbrowse() end, { desc = "Git Browse" })

-- Grep
Map("n", "g/", function() Snacks.picker.grep() end, { desc = "Grep" })
Map({ "n", "x" }, "g?", function() Snacks.picker.grep_word() end, { desc = "Visual selection or word" })
Map("n", "gb", function() Snacks.picker.grep_buffers() end, { desc = "Grep Open Buffers" })
Map("n", "<leader>/", function() Snacks.picker.lines() end, { desc = "Buffer Lines" })

-- Find Files
Map("n", "<leader>fs", function() Snacks.picker.smart() end, { desc = "Smart Find Files" })
Map("n", "<leader>,", function() Snacks.picker.buffers() end, { desc = "Find Opened Buffers" })
Map("n", "<leader>ff", function() Snacks.picker.files() end, { desc = "Find Files" })
Map("n", "<leader>fF", function() Snacks.picker.files({ hidden = true, ignored = true }) end, { desc = "Find Files" })
Map("n", "<leader>fg", function() Snacks.picker.git_files() end, { desc = "Find Git Files" })

-- Find Diagnostics
Map("n", "<leader>fd", function() Snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics" })
Map("n", "<leader>fD", function() Snacks.picker.diagnostics() end, { desc = "Diagnostics" })

-- Find History
Map("n", "<leader>f/", function() Snacks.picker.search_history() end, { desc = "Search History" })
Map("n", "<leader>:", function() Snacks.picker.command_history() end, { desc = "Command History" })
Map("n", "<leader>fn", function() Snacks.picker.notifications() end, { desc = "Notification History" })
Map("n", "<leader>fu", function() Snacks.picker.undo() end, { desc = "Undo History" })

-- Find Locations
Map("n", "<leader>fj", function() Snacks.picker.jumps() end, { desc = "Jumps" })
Map("n", "<leader>fm", function() Snacks.picker.marks() end, { desc = "Marks" })
Map("n", "<leader>fq", function() Snacks.picker.qflist() end, { desc = "Quickfix List" })
Map("n", "<leader>fl", function() Snacks.picker.loclist() end, { desc = "Location List" })

-- Find Nvim
Map("n", "<leader><CR>", function() Snacks.picker.resume() end, { desc = "Resume Find" })
Map("n", "<leader>fk", function() Snacks.picker.keymaps() end, { desc = "Keymaps" })
Map("n", "<leader>fh", function() Snacks.picker.help() end, { desc = "Help Pages" })
Map("n", "<leader>fM", function() Snacks.picker.man() end, { desc = "Man Pages" })
Map("n", "<leader>fy", function() Snacks.picker.cliphist() end, { desc = "Clipboard" })
Map("n", "z,", function() Snacks.picker.spelling() end, { desc = "Spelling" })
Map("n", "<leader>fp", function() Snacks.picker.projects() end, { desc = "Projects" })
Map("n", "<leader>fz", function() Snacks.picker.zoxide() end, { desc = "Zoxide" })
Map("n", "<leader>fr", function() Snacks.picker.recent() end, { desc = "Recent" })
Map("n", '<leader>"', function() Snacks.picker.registers() end, { desc = "Registers" })
Map("n", "<leader>fa", function() Snacks.picker.autocmds() end, { desc = "Autocmds" })
Map("n", "<leader>fc", function() Snacks.picker.commands() end, { desc = "Commands" })
Map("n", "<leader>fx", function() Snacks.picker.lsp_config() end, { desc = "Lsp Config" })
Map("n", "<leader>ft", function() Snacks.picker.tags() end, { desc = "Tags" })
Map("n", "<leader>fT", function() Snacks.picker.treesitter() end, { desc = "Treesitter" })

-- LSP
Map("n", "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Goto Definition" })
Map("n", "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Goto Declaration" })
Map("n", "grr", function() Snacks.picker.lsp_references() end, { nowait = true, desc = "References" })
Map("n", "gri", function() Snacks.picker.lsp_implementations() end, { desc = "Goto Implementation" })
Map("n", "grt", function() Snacks.picker.lsp_type_definitions() end, { desc = "Goto Type Definition" })
Map("n", "gai", function() Snacks.picker.lsp_incoming_calls() end, { desc = "C[a]lls Incoming" })
Map("n", "gao", function() Snacks.picker.lsp_outgoing_calls() end, { desc = "C[a]lls Outgoing" })
Map("n", "go", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
Map("n", "gs", function() Snacks.picker.lsp_symbols() end, { desc = "LSP Symbols" })
Map("n", "gO", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })
Map("n", "gS", function() Snacks.picker.lsp_workspace_symbols() end, { desc = "LSP Workspace Symbols" })

-- Scope
Map({ "n", "v" }, "<leader>;", function() Snacks.scope.jump() end, { desc = "Go to start of current scope" })

-- Words
Map({ "n", "o", "x" }, "]w", function() Snacks.words.jump(1, true) end, { desc = "Next word" })
Map({ "n", "o", "x" }, "[w", function() Snacks.words.jump(-1, true) end, { desc = "Previous word" })

-- Neural
Map("n", "<leader><leader>", "<Plug>(NeuralOpen)", { desc = "Neural Open Files" })
