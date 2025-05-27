return {
    {
        "slugbyte/lackluster.nvim",
        lazy = false,
        priority = 1000,
        -- config = function()
        --     local lackluster = require("lackluster")
        --         lackluster.setup({
        --         }
        --     })
        -- end,
        -- init = function()
        --     vim.cmd.colorscheme("lackluster")
        -- end,
    },
    {
        "Verf/deepwhite.nvim",
        priority = 1000,
        init = function()
            vim.cmd.colorscheme("deepwhite")
        end,
    },
}
