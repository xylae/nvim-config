return {
    "numToStr/Comment.nvim",
    config = function()
        require("Comment").setup({
            toggler = {
                line = "<leader>g",
                block = "<leader>G",
            },
            opleader = {
                line = "<leader>b",
                block = "<leader>B",
            },
            mappings = {
                basic = true,
                extra = false,
            },
        })
    end,
}
