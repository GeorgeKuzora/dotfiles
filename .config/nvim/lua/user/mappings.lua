-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
-- User leader key
local userleader = "<C-s>"
-- Make file an executable
vim.keymap.set("n", userleader .. "x", "<cmd>!chmod +x %<CR>", { silent = true })
-- Move text up and down
vim.keymap.set("n", "<M-j>", "<Esc>:m .+1<CR>==")
vim.keymap.set("n", "<M-k>", "<Esc>:m .-2<CR>==")
-- Visual --
-- Move text up and down
vim.keymap.set("v", "<M-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<M-k>", ":m '<-2<CR>gv=gv")
-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "<M-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<M-k>", ":move '<-2<CR>gv-gv")
  -- first key is the mode
return {
  n = {
    -- second key is the lefthand side of the map
    -- mappings seen under group name "Buffer"
    ["<leader>bn"] = { "<cmd>tabnew<cr>", desc = "New tab" },
    ["<leader>bD"] = {
      function()
        require("astronvim.utils.status").heirline.buffer_picker(function(bufnr) require("astronvim.utils.buffer").close(bufnr) end)
      end,
      desc = "Pick to close",
    },
    -- tables with the `name` key will be registered with which-key if it's installed
    -- this is useful for naming menus
    ["<leader>b"] = { name = "Buffers" },
    [userleader .. "o"] = { "o<Esc>", desc = "Insert empty line bellow" },
    [userleader .. "O"] = { "O<Esc>", desc = "Insert empty line above" },
    ["J"] = { "mzJ`z", desc = "Join Lines" },
    ["<C-d>"] = { "<C-d>zz", desc = "Scroll half down" },
    ["<C-u>"] = { "<C-u>zz", desc = "Scroll half up" },
    ["n"] = { "nzzzv", desc = "Find next" },
    ["N"] = { "Nzzzv", desc = "Find previous" },
    [userleader .. "d"] = { [["_d]], desc = "Delete without killing" },
    [userleader .. "f"] = { vim.lsp.buf.format, desc = "Format buffer" },
    [userleader .. "k"] = { "<cmd>cnext<CR>zz", desc = "Move next in QuickFix list" },
    [userleader .. "j"] = { "<cmd>cprev<CR>zz", desc = "Move previous in QuickFix list" },
    [userleader .. "K"] = { "<cmd>lnext<CR>zz", desc = "Move to next location" },
    [userleader .. "J"] = { "<cmd>lprev<CR>zz", desc = "Move to previous location" },
    [userleader .. "s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], desc = "Change word under cursor in a buffer" },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
    [userleader .. "u"] = { vim.cmd.UndotreeToggle, desc = "Toggle Undo-tree" },
    ["x"] = { '"_x', desc = "Delete char into void" },
    [userleader .. "g"] = { vim.cmd.Git, desc = "Toggle git" },
    ["<leader>lj"] = { '<cmd>lua vim.lsp.buf.hover()<CR>', desc = "Hover documentation" },
    ["<C-q>"] = false,
    ["<C-s>"] = false,
  },
  v = {
    ["<"] = { "<gv", desc = "Indent left" },
    [">"] = { ">gv", desc = "Indent right" },
    [userleader .. "p"] = { '"_dP', desc = "Paste without killing" },
    [userleader .. "d"] = { [["_d]], desc = "Delete without killing" },
    [userleader .. "g"] = { vim.cmd.Git, desc = "Toggle git" },
  },
  x = {
    ["<"] = { "<gv", desc = "Indent left" },
    [">"] = { ">gv", desc = "Indent right" },
    [userleader .. "p"] = { [["_dP]], desc = "Paste without killing" },
    [userleader .. "d"] = { [["_d]], desc = "Delete without killing" },
    [userleader .. "g"] = { vim.cmd.Git, desc = "Toggle git" },
  },
  i = {
    ["<c-u>"] = { "<c-g>u<c-u>", desc = "Delete character" },
    ["<c-w>"] = { "<c-g>u<c-w>", desc = "Delete word" },
    [userleader .. "s"] = { '<cmd>lua vim.lsp.buf.signature_help()<CR>', desc = "Hover signature" },
    [userleader .. "d"] = { '<cmd>lua vim.lsp.buf.hover()<CR>', desc = "Hover documentation" },
    ["<c-l>"] = { "<c-6>", desc = "Switch input method" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
