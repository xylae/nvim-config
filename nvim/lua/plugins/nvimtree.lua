local function my_on_attach(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
        return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- delete mappings
    local function del(key)
        vim.keymap.del("n", key, { buffer = bufnr })
    end
    
    -- custom mappings
    local function map(key, api, desc)
        vim.keymap.set("n", key, api, opts(desc))
    end

    del("s")
    del("a")
    del("d")
    del("D")
    del("P")
    del("E")
    del("W")
    del("R")
    del("[e")
    del("]e")

    map("x", api.fs.remove, "delete")
    map("X", api.fs.trash, "trash")
    map("<F2>", api.node.navigate.parent, "parent directory")
    map("q", api.tree.collapse_all, "collapse")
    map("e", api.tree.expand_all, "expand")
    map("<F5>", api.tree.reload, "refresh")
    map("n", api.fs.create, "new file or directory")
    map("S", api.node.navigate.sibling.last, "last sibling")
    map("W", api.node.navigate.sibling.first, "first sibling")
    map("[d", api.node.navigate.diagnostics.prev, "previous diagnostic")
    map("]d", api.node.navigate.diagnostics.next, "next diagnostic")

    -- commands
    map("<leader>e", ":NvimTreeToggle<CR>", "open and focus tree")

end

return {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup({
            on_attach = my_on_attach,
            view = {
                width = 45,
                side = "right",
            },
            renderer = {
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                },
            },
            git = {
                enable = true,
            },
            update_focused_file = {
                enable = true,
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
            },
    })
  end
}
