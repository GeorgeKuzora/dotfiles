return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  -- cmd = "Telescope",
  config = function()
    local actions = require "telescope.actions"
    local telescope = require "telescope"
    telescope.setup({
      defaults = {
        git_worktrees = vim.g.git_worktrees,
        path_display = { "truncate" },
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<ESC>"] = actions.close,
            ["<C-c>"] = actions.close,
          },
          n = {
            q = actions.close,
            ["<ESC>"] = actions.close,
          },
        },
      },
    })

    pcall(telescope.load_extension, "telescope-fzf-native.nvim", 'fzf')

    local function find_git_root()
      -- Use the current buffer's path as the starting point for the git search
      local current_file = vim.api.nvim_buf_get_name(0)
      local current_dir
      local cwd = vim.fn.getcwd()
      -- If the buffer is not associated with a file, return nil
      if current_file == '' then
        current_dir = cwd
      else
        -- Extract the directory from the current file's path
        current_dir = vim.fn.fnamemodify(current_file, ':h')
      end

      -- Find the Git root directory from the current file's path
      local git_root = vim.fn.systemlist('git -C ' .. vim.fn.escape(current_dir, ' ') .. ' rev-parse --show-toplevel')
      [1]
      if vim.v.shell_error ~= 0 then
        print 'Not a git repository. Searching on current working directory'
        return cwd
      end
      return git_root
    end

    -- Custom live_grep function to search in git root
    local function live_grep_git_root()
      local git_root = find_git_root()
      if git_root then
        require('telescope.builtin').live_grep {
          search_dirs = { git_root },
        }
      end
    end


    local function telescope_live_grep_open_files()
      require('telescope.builtin').live_grep {
        grep_open_files = true,
        prompt_title = 'Live Grep in Open Files',
      }
    end

    vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

    -- KEYMAPS
    vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
    vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
    vim.keymap.set('n', '<leader>/', function()
      require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false,
      })
    end, { desc = '[/] Fuzzily search in current buffer' })

    vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files,
      { desc = '[F]ind [F]iles', silent = true })
    vim.keymap.set('n', '<leader>fF',
      function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
      { desc = '[F]ind All [F]iles' })
    vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[F]ind [H]elp' })
    vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[F]ind current [W]ord' })
    vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[F]ind by [G]rep' })
    vim.keymap.set('n', "<leader>fG",
      function()
        require("telescope.builtin").live_grep { additional_args = function(args)
          return vim.list_extend(args,
            { "--hidden", "--no-ignore" })
        end, }
      end, { desc = "Find words in all files", })
    vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[F]ind [D]iagnostics' })
    vim.keymap.set('n', "<leader>f<CR>", function() require("telescope.builtin").resume() end,
      { desc = "Resume previous search" })
    vim.keymap.set('n', "<leader>f'", function() require("telescope.builtin").marks() end, { desc = "Find marks" })
    vim.keymap.set('n', "<leader>fC", function() require("telescope.builtin").commands() end, { desc = "Find commands" })
    vim.keymap.set('n', "<leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "Find keymaps" })
    vim.keymap.set('n', "<leader>fm", function() require("telescope.builtin").man_pages() end, { desc = "Find man" })
    vim.keymap.set('n', "<leader>fo", function() require("telescope.builtin").oldfiles() end, { desc = "Find history" })
    vim.keymap.set('n', "<leader>fr", function() require("telescope.builtin").registers() end,
      { desc = "Find registers" })
    vim.keymap.set('n', "<leader>ft", function() require("telescope.builtin").colorscheme { enable_preview = true } end,
      { desc = "Find themes" })
    vim.keymap.set('n', "<leader>ls",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      { desc = "Find symbols", })
    vim.keymap.set('n', "<leader>fs",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      { desc = "Find symbols", })
    vim.keymap.set('n', '<leader>fo', telescope_live_grep_open_files, { desc = '[F]ind [/] in Open Files' })
    vim.keymap.set('n', '<leader>fv', require('telescope.builtin').builtin, { desc = '[F]ind [S]elect Telescope' })
    -- vim.keymap.set('n', "<leader>f/", function() require("telescope.builtin").current_buffer_fuzzy_find() end,
    --   { desc = "Find words in current buffer" })

    vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
    vim.keymap.set('n', "<leader>gb", function() require("telescope.builtin").git_branches { use_file_path = true } end,
      { desc = "Git branches" })
    vim.keymap.set('n', "<leader>gc", function() require("telescope.builtin").git_commits { use_file_path = true } end,
      { desc = "Git commits (repository)", })
    vim.keymap.set('n', "<leader>gC", function() require("telescope.builtin").git_bcommits { use_file_path = true } end,
      { desc = "Git commits (current file)", })
    vim.keymap.set('n', "<leader>gt", function() require("telescope.builtin").git_status { use_file_path = true } end,
      { desc = "Git status" })
    vim.keymap.set('n', '<leader>gG', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
  end,
}
