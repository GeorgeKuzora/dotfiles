return {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    opts = {
        icons = { group = vim.g.icons_enabled and "" or "+", separator = "" },
        disable = { filetypes = { "TelescopePrompt" } },
    },
    config = function()
        local wk = require("which-key")
        wk.register({
            b = {
                name = "[B]uffers", _ = 'which_key_ignore'
            },
            l = {
                name = "[L]SP", _ = 'which_key_ignore'
            },
            f = {
                name = "[F]ind", _ = 'which_key_ignore'
            },
            g = {
                name = "[G]it", _ = 'which_key_ignore'
            },
            s = {
                name = "[S]earch", _ = 'which_key_ignore'
            },
            w = {
                name = "[W]orkspaces", _ = 'which_key_ignore'
            },
            h = {
                name = "Git [H]unk", _ = 'which_key_ignore'
            },
            n = {
                name = "Swap [N]ext", _ = 'which_key_ignore'
            },
            p = {
                name = "Swap [P]revious", _ = 'which_key_ignore'
            },

            c = {
                name = "QuickFix", _ = 'which_key_ignore'
            },

        }, { prefix = "<leader>" })
        -- register which-key VISUAL mode
        -- required for visual <leader>hs (hunk stage) to work
        wk.register({
            ['<leader>'] = { name = 'VISUAL <leader>' },
            ['<leader>h'] = { 'Git [H]unk' },
        }, { mode = 'v' })
    end
}
