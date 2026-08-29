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
  "https://github.com/dlyongemallo/diffview-plus.nvim",
})

vim.cmd("packadd nvim.difftool")

require("diffview").setup({
  enhanced_diff_hl = true,
  use_icons = false,
  view = {
    default = { layout = "diff2_horizontal" },
    merge_tool = { layout = "diff3_mixed" },
  },
})
