return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {"c", "lua", "vim"},
            highlight = {
                enable = true,
                disabled = {},
            },
        })
    end,
}
