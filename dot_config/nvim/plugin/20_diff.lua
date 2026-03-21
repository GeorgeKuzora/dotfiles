local function get_vcs_type()
  local cwd = vim.fn.getcwd()
  local function directory_exists(path)
      local stat = vim.loop.fs_stat(path)
      return stat and stat.type == "directory"
  end

  local current_dir = cwd
  while true do
      local jj_path = current_dir .. "/.jj"
      if directory_exists(jj_path) then
          return "jj"
      end
      local git_path = current_dir .. "/.git"
      if directory_exists(git_path) then
          return "git"
      end
      local parent = vim.fn.fnamemodify(current_dir, ":h")
      if parent == current_dir then
          break
      end
      current_dir = parent
  end
  return "git"
end

vim.pack.add({
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/julienvincent/hunk.nvim",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/clabby/difftastic.nvim",
})

require("hunk").setup()

require("difftastic-nvim").setup({
    vcs = get_vcs_type(),
    download = true, -- Auto-download pre-built binary
    snacks_picker = {
        enabled = true,
    },
})
