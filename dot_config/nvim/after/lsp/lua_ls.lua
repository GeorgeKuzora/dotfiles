return {
  settings = {
    Lua = {
      workspace = {
        checkThirdParty = false,
        library = {
          [vim.fn.expand '$VIMRUNTIME/lua'] = true,
          [vim.fn.stdpath 'config' .. '/lua'] = true,
        },
      },
      telemetry = { enable = false },
      hint = { enable = true },
      diagnostics = { disable = { 'missing-fields' }, globals = { 'vim' } },
    },
  },
}
