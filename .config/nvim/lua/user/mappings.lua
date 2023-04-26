-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
local userleader = "<C-space>"
vim.keymap.set("n", userleader .. "x", "<cmd>!chmod +x %<CR>", { silent = true })
return {
  -- first key is the mode
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
    ["<A-j>"] = { "<Esc>:m .+1<CR>==" },
    ["<A-k>"] = { "<Esc>:m .-2<CR>==" },
    ["J"] = { "mzJ`z" },
    ["<C-d>"] = { "<C-d>zz" },
    ["<C-u>"] = { "<C-u>zz" },
    ["n"] = { "nzzzv" },
    ["N"] = { "Nzzzv" },
    [userleader .. "d"] = { [["_d]], desc = "Delete without killing" },
    [userleader .. "f"] = { vim.lsp.buf.format, desc = "Format buffer" },
    ["<C-k>"] = { "<cmd>cnext<CR>zz" },
    ["<C-j>"] = { "<cmd>cprev<CR>zz" },
    [userleader .. "k"] = { "<cmd>lnext<CR>zz" },
    [userleader .. "j"] = { "<cmd>lprev<CR>zz" },
    [userleader .. "s"] = { [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]] },
    -- quick save
    -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command
  },
  v = {
    ["<"] = { "<gv", desc = "Indent left" },
    [">"] = { ">gv", desc = "Indent right" },
    [userleader .. "p"] = { '"_dP', desc = "Paste without killing" },
    [userleader .. "d"] = { [["_d]], desc = "Delete without killing" },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv" },
  },
  x = {
    ["<"] = { "<gv", desc = "Indent left" },
    [">"] = { ">gv", desc = "Indent right" },
    [userleader .. "p"] = { [["_dP]], desc = "Paste without killing" },
    ["<A-j>"] = { ":m '>+1<CR>gv=gv" },
    ["<A-k>"] = { ":m '<-2<CR>gv=gv" },
  },
  i = {
    ["<c-u>"] = { "<c-g>u<c-u>", desc = "Delete character" },
    ["<c-w>"] = { "<c-g>u<c-w>", desc = "Delete word" },
  },
  t = {
    -- setting a mapping to false will disable it
    -- ["<esc>"] = false,
  },
}
