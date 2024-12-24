return {
  'saghen/blink.cmp',
  lazy = false, -- lazy loading handled internally
  dependencies = { 
    'rafamadriz/friendly-snippets',
  },
  version = 'v0.*',
  opts = {
    keymap = { preset = 'super-tab' },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'mono'
    },
    completion = {
      trigger = {
        show_in_snippet = false,
      },
      accept = { auto_brackets = { enabled = false }, },
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },
}
