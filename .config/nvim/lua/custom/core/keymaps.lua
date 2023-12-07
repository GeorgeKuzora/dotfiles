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
km.set('n', "<leader>bd", vim.cmd.bdelete, { desc = "[D]elete [b]uffer" })
-- Explorer
km.set("n", "<leader>e", "<cmd>Neotree toggle position=left reveal=true<cr>", { desc = "Toggle Explorer" })
km.set("n", "<leader>bl", "<cmd>Neotree toggle source=buffers position=left reveal=true<cr>",
  { desc = "[B]uffers [L]ist" })

-- Windows size management
km.set('n', "<M-=>", "<C-w>+")
km.set('n', "<M-->", "<C-w>-")
km.set('n', "<M-,>", "<C-w><")
km.set('n', "<M-.>", "<C-w>>")


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





-- AERIAL
km.set("n", "<leader>a", "<cmd>AerialToggle<CR>")


