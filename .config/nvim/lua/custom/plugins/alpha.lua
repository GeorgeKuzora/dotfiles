return {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            "                                                     ",
            "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
            "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
            "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
            "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
            "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
            "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
            "                                                     ",
        }

        -- Set menu
        dashboard.section.buttons.val = {
            dashboard.button("e", "New File", "<cmd>ene<CR>"),
            dashboard.button("SPC e", "Toggle file explorer", "<cmd>Neotree toggle position=left reveal=true<cr>"),
            dashboard.button("SPC ff", "Find File", "<cmd>Telescope find_files<CR>"),
            dashboard.button("SPC fg", "Find Word", "<cmd>Telescope live_grep<CR>"),
            dashboard.button("SPC wx", "Restore Session", "<cmd>SessionRestore<CR>"),
            dashboard.button("q", "Quit NVIM", "<cmd>qa<CR>"),
        }

        dashboard.section.header.opts.hl = "DashboardHeader"
        dashboard.section.footer.opts.hl = "DashboardFooter"

        dashboard.config.layout = {
            { type = "padding", val = vim.fn.max { 2, vim.fn.floor(vim.fn.winheight(0) * 0.2) } },
            dashboard.section.header,
            { type = "padding", val = 5 },
            dashboard.section.buttons,
            { type = "padding", val = 3 },
            dashboard.section.footer,
        }
        dashboard.config.opts.noautocmd = true

        require 'alpha'.setup(dashboard.config)

        -- local startify = require('alpha.themes.startify')
        -- require 'alpha'.setup(startify.config)

        -- -- Disable folding on alpha buffer
        vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
    end
}
