vim.cmd("packadd cfilter")
vim.cmd("packadd nvim.difftool")
vim.cmd("packadd nvim.undotree")
Map("n", "<leader>U", require("undotree").open, { desc = "Undotree" })
