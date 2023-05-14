-- local userleader = "<C-space>"
return {
  -- You can also add new plugins here as well:
  -- Add plugins, the lazy syntax
  -- "andweeb/presence.nvim",
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "BufRead",
  --   config = function()
  --     require("lsp_signature").setup()
  --   end,
  -- },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
        require("nvim-surround").setup({
            -- Configuration here, or leave empty to use defaults
        })
    end
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    event = "BufRead",
  },
  {
    "mbbill/undotree",
    event = "VeryLazy",
    -- mappings = {
    --   n = {
    --   [userleader .. "u"] = { "<cmd>UndotreeToggle<CR>", desc = "Toggle Undo-tree" },
    --   },
    -- },
  },
  -- "tpope/vim-fugitive",
  'christoomey/vim-tmux-navigator',
  {"catppuccin/nvim", name = "catppuccin"},
  { 'rose-pine/neovim', name = 'rose-pine' },
  "shaunsingh/nord.nvim",
  "loctvl842/monokai-pro.nvim",
  "rebelot/kanagawa.nvim",

}
