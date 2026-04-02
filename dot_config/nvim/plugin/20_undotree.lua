vim.cmd("packadd nvim.undotree")
Map("n", "<leader>U", require("undotree").open, { desc = "Undotree" })
