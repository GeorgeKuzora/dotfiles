function AutocmdGroup(name)
  return vim.api.nvim_create_augroup(name, { clear = true })
end

function ExternalToolsConfig(spec)
  local config = {}

  for _, tool in ipairs(spec) do
    if not config[tool.lang] then
      config[tool.lang] = {}
    end
    if vim.fn.executable(tool.path) == 1 then
      table.insert(config[tool.lang], tool.name)
    end
  end
  return config
end

Map = vim.keymap.set

function GetVisualSelection()
  local mode = vim.fn.visualmode()
  if mode == '' then return nil end

  local region = vim.fn.getregion(
    vim.fn.getpos("v"),
    vim.fn.getpos("."),
    { type = mode }
  )

  return table.concat(region, "\n")
end
