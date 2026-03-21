vim.pack.add({
  "https://github.com/rafamadriz/friendly-snippets",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = 'v1.10.1',
  }
})

require("blink-cmp").setup({
  keymap = {
    preset = 'super-tab', -- 'default'
    ['<C-u>'] = { 'scroll_documentation_up', 'fallback' },
    ['<C-d>'] = { 'scroll_documentation_down', 'fallback' },
  },
  appearance = {
    use_nvim_cmp_as_default = true,
    nerd_font_variant = 'mono',
  },
  completion = {
    trigger = {
      show_in_snippet = true,
    },
    accept = { auto_brackets = { enabled = false } },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
    },
  },
  sources = {
    default = { 'lsp', 'path', 'snippets', 'buffer', 'omni' },
    providers = {
      cmdline = {
        -- ignores cmdline completions when executing shell commands
        enabled = function()
          return vim.fn.getcmdtype() ~= ':' or not vim.fn.getcmdline():match "^[%%0-9,'<>%-]*!"
        end,
      },
    },
  },
  signature = { enabled = true },
  fuzzy = {
    implementation = "prefer_rust",
    prebuilt_binaries = {
      force_version = nil, -- Let it detect or build locally
    }
  },
})
