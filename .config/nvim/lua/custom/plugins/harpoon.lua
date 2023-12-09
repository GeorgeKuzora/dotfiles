return {
    'ThePrimeagen/harpoon',
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    event = "VeryLazy",
    config = function()
        -- HARPOON
        -- km.set('n', "<c-s>", '<cmd>lua vim.lsp.buf.signature_help()<CR>', { desc = "Hover signature" })
        vim.keymap.set('n', "<leader>y", function() require("harpoon.mark").add_file() end, { desc = "Harpoon add mark" })
        vim.keymap.set('n', "<leader>j", function() require("harpoon.ui").toggle_quick_menu() end,
            { desc = "Toggle Harpoon" })
        vim.keymap.set('n', "]h", function() require("harpoon.ui").nav_next() end, { desc = "Next Harpoon mark" })
        vim.keymap.set('n', "[h", function() require("harpoon.ui").nav_prev() end, { desc = "Previous Harpoon mark" })
        vim.keymap.set('n', "<M-u>", function() require("harpoon.ui").nav_file(1) end, { desc = "Harpoon mark 1" })
        vim.keymap.set('n', "<M-i>", function() require("harpoon.ui").nav_file(2) end, { desc = "Harpoon mark 2" })
        vim.keymap.set('n', "<M-o>", function() require("harpoon.ui").nav_file(3) end, { desc = "Harpoon mark 3" })
        vim.keymap.set('n', "<M-p>", function() require("harpoon.ui").nav_file(4) end, { desc = "Harpoon mark 4" })
    end
}
