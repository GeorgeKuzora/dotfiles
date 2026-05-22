vim.pack.add({ 'https://github.com/dmtrKovalenko/fff.nvim' })

vim.api.nvim_create_autocmd('PackChanged', {
  callback = function(ev)
    local name, kind = ev.data.spec.name, ev.data.kind
    if name == 'fff.nvim' and (kind == 'install' or kind == 'update') then
      if not ev.data.active then vim.cmd.packadd('fff.nvim') end
      require('fff.download').download_or_build_binary()
    end
  end,
})

vim.g.fff = {
  lazy_sync = true,
}

require('fff').setup({
  prompt = ' ',
  layout = {
    prompt_position = 'top',   -- or 'bottom'
  },
  logging = {
    enabled = false,
  },
})

vim.keymap.set('n', '<leader><leader>', function() require('fff').find_files() end, { desc = 'FFFind files' })
vim.keymap.set('n', 'g/', function() require('fff').live_grep() end, { desc = 'FFF Live Grep' })
vim.keymap.set('n', 'g?', function() require('fff').live_grep({ query = vim.fn.expand("<cword>") }) end, { desc = 'FFF Live Grep' })

Map('x', 'g?', function()
  local query = GetVisualSelection()
  require('fff').live_grep({ query = query })
end, { desc = 'FFF Live Grep (visual selection)' })

Map('x', 'g/', function()
  local query = GetVisualSelection()
  require('fff').live_grep({ query = query })
end, { desc = 'FFF Live Grep (visual selection)' })
