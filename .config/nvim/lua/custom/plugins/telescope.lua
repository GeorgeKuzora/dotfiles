return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'folke/todo-comments.nvim',
    -- 'debugloop/telescope-undo.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      build = 'make',
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
  },
  opts = {
    extensions = {
      undo = {
        side_by_side = true,
        layout_strategy = "vertical",
        layout_config = {
          preview_height = 0.8,
        },
      },
    },
  },
  config = function()
    local actions = require 'telescope.actions'
    local telescope = require 'telescope'
    local lsp_config = {
      fname_width = 45,
      path_display = {
        shorten = { len = 1, exclude = { -2, -1 } }
      },
      layout_config = {
        horizontal = { prompt_position = 'top', preview_width = 0.40 },
        preview_cutoff = 120,
      },
    }
    telescope.setup {
      defaults = {
        git_worktrees = vim.g.git_worktrees,
        path_display = { 'truncate' },
        sorting_strategy = 'ascending',
        layout_config = {
          horizontal = { prompt_position = 'top', preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.97,
          height = 0.90,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
            ['<M-n>'] = actions.cycle_history_next,
            ['<M-p>'] = actions.cycle_history_prev,
            ['<C-n>'] = actions.move_selection_next,
            ['<C-p>'] = actions.move_selection_previous,
            ['<C-j>'] = actions.move_selection_next,
            ['<C-k>'] = actions.move_selection_previous,
            ['<ESC>'] = actions.close,
            ['<C-c>'] = actions.close,
            ['<C-q>'] = actions.send_to_qflist,
            ['<M-q>'] = actions.send_selected_to_qflist,
          },
          n = {
            ['<C-q>'] = actions.send_to_qflist,
            ['<M-q>'] = actions.send_selected_to_qflist,
            q = actions.close,
            ['<ESC>'] = actions.close,
          },
        },
      },
      pickers = {
        lsp_references = lsp_config,
        lsp_dynamic_workspace_symbols = lsp_config,
      },
    }

    pcall(telescope.load_extension, 'telescope-fzf-native.nvim', 'fzf', 'undo')

    local builtin = require 'telescope.builtin'

    -- Custom live_grep function to search in git root
    local function live_grep_git_root()
      local git_root = FindGitRoot()
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

    local function find_WORD()
      local word = vim.fn.expand '<cWORD>'
      builtin.grep_string { search = word }
    end

    vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

    -- KEYMAPS
    -- vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = 'Find recently opened files' })
    -- vim.keymap.set('n', '<leader><space>', function ()
    --   require('telescope.builtin').buffers{sort_mru = true, sort_lastused = true}
    -- end,
    --   { desc = 'Find existing buffers' })
    -- vim.keymap.set('n', '<leader>/', function()
    --   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    --     winblend = 10,
    --     previewer = false,
    --   })
    -- end, { desc = 'Fuzzily search in current buffer' })

    -- vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = 'Find files', silent = true })
    -- vim.keymap.set('n', '<leader>fF', function()
    --   require('telescope.builtin').find_files { hidden = true, no_ignore = true }
    -- end, { desc = 'Find all files' })
    -- vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = 'Find help' })
    -- vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = 'Find diagnostics' })
    -- vim.keymap.set('n', '<leader>f<CR>', function()
    --   require('telescope.builtin').resume()
    -- end, { desc = 'Resume previous search' })
    -- vim.keymap.set('n', '<leader><CR>', function()
    --   require('telescope.builtin').resume()
    -- end, { desc = 'Resume previous search' })
    -- vim.keymap.set('n', "<leader>f'", function()
    --   require('telescope.builtin').marks()
    -- end, { desc = 'Find marks' })
    -- vim.keymap.set('n', '<leader>fC', function()
    --   require('telescope.builtin').commands()
    -- end, { desc = 'Find commands' })
    -- vim.keymap.set('n', '<leader>fk', function()
    --   require('telescope.builtin').keymaps()
    -- end, { desc = 'Find keymaps' })
    -- vim.keymap.set('n', '<leader>fm', function()
    --   require('telescope.builtin').man_pages()
    -- end, { desc = 'Find man' })
    -- vim.keymap.set('n', '<leader>fi', function()
    --   require('telescope.builtin').oldfiles()
    -- end, { desc = 'Find history' })
    -- vim.keymap.set('n', '<leader>fr', function()
    --   require('telescope.builtin').registers()
    -- end, { desc = 'Find registers' })
    -- vim.keymap.set('n', '<leader>fT', function()
    --   require('telescope.builtin').colorscheme { enable_preview = true }
    -- end, { desc = 'Find themes' })
    -- vim.keymap.set('n', '<leader>ls', function()
    --   require('telescope.builtin').lsp_document_symbols()
    -- end, { desc = 'Find current buffer symbols' })
    -- vim.keymap.set('n', '<leader>fs', function()
    --   require('telescope.builtin').lsp_document_symbols()
    -- end, { desc = 'Find current buffer symbols' })
    -- vim.keymap.set(
    --   'n',
    --   '<leader>fv',
    --   require('telescope.builtin').builtin,
    --   { desc = 'Find Telescope builtins' }
    -- )
    -- vim.keymap.set(
    --   'n',
    --   '<leader>fj',
    --   require('telescope.builtin').jumplist,
    --   { desc = 'Find in jump list' }
    -- )
    -- vim.keymap.set(
    --   'n', '<leader>ft', '<cmd>TodoTelescope<cr>', { desc = 'Find TODO comments' }
    -- )
    --
    -- vim.keymap.set(
    --   'n',
    --   '<leader>fg',
    --   require('telescope.builtin').git_files,
    --   { desc = 'Find files in Git' }
    -- )
    -- vim.keymap.set('n', '<leader>gb', function()
    --   require('telescope.builtin').git_branches { use_file_path = true }
    -- end, { desc = 'Find Git branches' })
    -- vim.keymap.set('n', '<leader>gc', function()
    --   require('telescope.builtin').git_commits { use_file_path = true }
    -- end, { desc = 'Find Git commits (repository)' })
    -- vim.keymap.set('n', '<leader>gC', function()
    --   require('telescope.builtin').git_bcommits { use_file_path = true }
    -- end, { desc = 'Find Git commits (current file)' })
    -- vim.keymap.set('n', '<leader>gs', function()
    --   require('telescope.builtin').git_status { use_file_path = true }
    -- end, { desc = 'Find changes in Git status' })
    --
    -- vim.keymap.set('n', '<leader>u', function()
    --   require("telescope").extensions.undo.undo()
    -- end, { desc = 'Toggle undo-tree' })
    -- -- Search
    -- vim.keymap.set(
    --   'n',
    --   '<leader>so',
    --   telescope_live_grep_open_files,
    --   { desc = 'Search in open files' }
    -- )
    -- vim.keymap.set(
    --   'n',
    --   '<leader>sw',
    --   require('telescope.builtin').grep_string,
    --   { desc = 'Search current word' }
    -- )
    -- vim.keymap.set(
    --   'n', '<leader>sW', find_WORD, { desc = 'Search current WORD' })
    -- vim.keymap.set(
    --   'n',
    --   '<leader>sf',
    --   require('telescope.builtin').live_grep,
    --   { desc = 'Search in files' }
    -- )
    -- vim.keymap.set('n', '<leader>sF', function()
    --   require('telescope.builtin').live_grep {
    --     additional_args = function()
    --       return  { '--hidden', '--no-ignore' }
    --     end,
    --   }
    -- end, { desc = 'Search in all files' })
    -- vim.keymap.set(
    --   'n', '<leader>sg', ':LiveGrepGitRoot<cr>', { desc = 'Search in Git files' }
    -- )
  end,
}
