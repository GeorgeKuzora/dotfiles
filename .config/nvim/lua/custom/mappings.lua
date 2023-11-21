-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
local km = vim.keymap
local userleader = "<C- >"

-- NORMAL MODE
km.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
km.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
km.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
km.set('n', "J", "mzJ`z", { desc = "Join Lines" })
km.set('n', "<C-d>", "<C-d>zz", { desc = "Scroll half down" })
km.set('n', "<C-u>", "<C-u>zz", { desc = "Scroll half up" })
km.set('n', "n", "nzzzv", { desc = "Find next" })
km.set('n', "N", "Nzzzv", { desc = "Find previous" })
km.set('n', "<leader>d", [["_d]], { desc = "Delete without killing" })
km.set('n', "x", '"_x', { desc = "Delete char into void" })
km.set('n', "<leader>*", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Change word under cursor in a buffer" })
-- Insert live without insert mode
km.set('n', "<leader>o", "o<Esc>k", { desc = "Insert empty line bellow" })
km.set('n', "<leader>O", "O<Esc>j", { desc = "Insert empty line above" })
-- Make file an executable
km.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
-- Move text up and down
km.set("n", "<M-j>", "<Esc>:m .+1<CR>==")
km.set("n", "<M-k>", "<Esc>:m .-2<CR>==")
-- Better windows navigation
-- km.set('n', "<C-h>", "<C-w>h")
-- km.set('n', "<C-k>", "<C-w>k")
-- km.set('n', "<C-j>", "<C-w>j")
-- km.set('n', "<C-l>", "<C-w>l")
km.set('n', ']b', ':bnext<CR>', { desc = "Next buffer" })
km.set('n', '[b', ':bprevious<CR>, { desc = "Previous buffer" }')
-- escape highlight search
km.set('n', '<C-c>', ':noh<return><esc>')
-- km.set('n', '<esc><esc>', ':noh<return><esc>')
-- Resizing windows
km.set('n', '<M-Up>', ':resize -2<CR>')
km.set('n', '<M-Down>', ':resize +2<CR>')
km.set('n', '<M-Left>', ':vertical resize -2<CR>')
km.set('n', '<M-Right>', ':vertical resize +2<CR>')
-- VISUAL MODE
km.set('v', "<", "<gv", { desc = "Indent left" })
km.set('v', ">", ">gv", { desc = "Indent right" })
km.set('v', "<leader>p", [["_dP]], { desc = "Paste without killing" })
km.set('v', "<leader>d", [["_d]], { desc = "Delete without killing" })
-- Move text up and down
km.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
km.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
-- km.set("v", "<M-j>", ":m .+1<CR>==")
-- km.set("v", "<M-k>", ":m .-2<CR>==")

-- VISUALBLOCK MODE
km.set('x', "<", "<gv", { desc = "Indent left" })
km.set('x', ">", ">gv", { desc = "Indent right" })
km.set('x', "<leader>p", [["_dP]], { desc = "Paste without killing" })
km.set('x', "<leader>d", [["_d]], { desc = "Delete without killing" })
-- Move text up and down
km.set("x", "<M-j>", ":move '>+1<CR>gv-gv")
km.set("x", "<M-k>", ":move '<-2<CR>gv-gv")


-- INSERT MODE
km.set('i', "<c-u>", "<c-g>u<c-u>", { desc = "Delete character" })
km.set('i', "<c-w>", "<c-g>u<c-w>", { desc = "Delete word" })
km.set('i', "<c-s>", '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "Hover signature" })
km.set('i', "<c-d>", '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = "Hover documentation" })
km.set('i', "<c-'>", "<c-6>", { desc = "Switch input method" })


-- COMPLEX KEYMAPS
-- Diagnostic keymaps
km.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to [previous] [D]iagnostic message' })
km.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to [next] [D]iagnostic message' })
km.set('n', '<leader>qe', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
km.set('n', '<leader>ql', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- QuickFix list
km.set('n', "<leader>qf", "<cmd>copen<CR>", { desc = "Open [Q]uick[F]ix list" })
km.set('n', "]q", "<cmd>cnext<CR>zz", { desc = "Move next in [Q]uickFix list" })
km.set('n', "[q", "<cmd>cprev<CR>zz", { desc = "Move previous in [Q]uickFix list" })
km.set('n', "]l", "<cmd>lnext<CR>zz", { desc = "Move to next [L]ocation" })
km.set('n', "[l", "<cmd>lprev<CR>zz", { desc = "Move to previous [L]ocation" })
-- Undo-tree
km.set('n', "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle [U]ndo-tree" })

-- Buffers
km.set('n', "<leader>bn", vim.cmd.enew, { desc = "[N]ew [b]uffer" })
km.set('n', "<leader>bd",vim.cmd.bdelete, { desc = "[D]elete [b]uffer" })
-- Explorer
km.set("n", "<leader>e", "<cmd>Neotree toggle position=left reveal=true<cr>", { desc = "Toggle Explorer" })
km.set("n", "<leader>bl", "<cmd>Neotree toggle source=buffers position=left reveal=true<cr>", { desc = "[B]uffers [L]ist" })

-- TELESCOPE
-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles', silent = true })
vim.keymap.set('n', '<leader>fF',
  function() require("telescope.builtin").find_files { hidden = true, no_ignore = true } end,
  { desc = '[F]earch All [F]iles' })
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', "<leader>fG",
  function()
    require("telescope.builtin").live_grep { additional_args = function(args)
      return vim.list_extend(args,
        { "--hidden", "--no-ignore" })
    end, }
  end, { desc = "Find words in all files", })
vim.keymap.set('n', '<leader>fd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set('n', "<leader>f<CR>", function() require("telescope.builtin").resume() end,
  { desc = "Resume previous search" })
vim.keymap.set('n', "<leader>f'", function() require("telescope.builtin").marks() end, { desc = "Find marks" })
vim.keymap.set('n', "<leader>fC", function() require("telescope.builtin").commands() end, { desc = "Find commands" })
vim.keymap.set('n', "<leader>fk", function() require("telescope.builtin").keymaps() end, { desc = "Find keymaps" })
vim.keymap.set('n', "<leader>fm", function() require("telescope.builtin").man_pages() end, { desc = "Find man" })
vim.keymap.set('n', "<leader>fo", function() require("telescope.builtin").oldfiles() end, { desc = "Find history" })
vim.keymap.set('n', "<leader>fr", function() require("telescope.builtin").registers() end, { desc = "Find registers" })
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
local wk = require("which-key")
-- Git status
km.set('n', '<leader>gg', vim.cmd.Git, { desc = "Git fugitive status" })
-- As an example, we will create the following mappings:
--  * <leader>ff find files
--  * <leader>fr show recent files
--  * <leader>fb Foobar
-- we'll document:
--  * <leader>fn new file
--  * <leader>fe edit file
-- and hide <leader>1
--
-- HARPOON
-- km.set('n', "<c-s>", '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "Hover signature" })
km.set('n', "<leader>y", function() require("harpoon.mark").add_file()  end, { desc = "Harpoon add mark" })
km.set('n', "<leader>h", function() require("harpoon.ui").toggle_quick_menu() end, { desc = "Toggle Harpoon" })
km.set('n', "]h", function() require("harpoon.ui").nav_next() end, { desc = "Next Harpoon mark" })
km.set('n', "[h", function() require("harpoon.ui").nav_prev() end, { desc = "Previous Harpoon mark" })
km.set('n', "<M-u>", function() require("harpoon.ui").nav_file(1) end, { desc = "Harpoon mark 1" })
km.set('n', "<M-i>", function() require("harpoon.ui").nav_file(2) end, { desc = "Harpoon mark 2" })
km.set('n', "<M-o>", function() require("harpoon.ui").nav_file(3) end, { desc = "Harpoon mark 3" })
km.set('n', "<M-p>", function() require("harpoon.ui").nav_file(4) end, { desc = "Harpoon mark 4" })
--
-- LUASNIP
local ls = require 'luasnip'
km.set({"i", "s"}, "<c-j>", function()
  if ls.expand_or_jumpable() then
    ls.expand_or_jump()
  end
end, {silent = true})

km.set({"i", "s"}, "<c-k>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, {silent = true})

km.set({"i", "s"}, "<c-l>", function()
	if ls.choice_active() then
		ls.change_choice(1)
	end
end, {silent = true})

km.set("n", "<leader>m", "<cmd>source ~/.config/nvim/lua/custom/plugins/luasnip.lua<CR>", { desc = "Source Luasnip file" })

-- WINSHIFT
local ws = require 'winshift'
km.set("n", "<c-w>m",  "<cmd>WinShift<CR>", { desc = "Start window move mode" })
km.set("n", "<c-w>X",   "<cmd>WinShift swap<CR>", { desc = "Start window swap mode" })

-- UFO FOLDING
km.set('n', 'zR', require('ufo').openAllFolds)
km.set('n', 'zM', require('ufo').closeAllFolds)
km.set('n', 'zr', require('ufo').openFoldsExceptKinds)
km.set('n', 'zm', require('ufo').closeFoldsWith) -- closeAllFolds == closeFoldsWith(0)
km.set('n', 'zq', function()
    local winid = require('ufo').peekFoldedLinesUnderCursor()
    if not winid then
        -- choose one of coc.nvim and nvim lsp
        vim.lsp.buf.hover()
    end
    end, { desc = "[Q]uick view fold"})


wk.register({
  b = {
    name = "[B]uffers",
  },
  l = {
    name = "[L]SP",
  },
  g = {
    name = "[G]it",
  },
  q = {
    name = "[Q]uickFix & Diagnostics",
  },
  s = {
    name = "[S]earch",
  },
  w = {
    name = "[W]orkspaces",
  },
}, { prefix = "<leader>" })
