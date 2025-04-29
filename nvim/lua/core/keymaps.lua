-- core/keymaps.lua

local keymap = vim.keymap
local map = keymap.set

-- options for most mappings
local opts = { noremap = true, silent = true }

local function del(mode, lhs)
    pcall(keymap.del, mode, lhs)
end

-- change leader key
vim.g.maplocalleader = ""
vim.g.mapleader = " "

-- insert / append
map("n", "k", "i", opts)
map("n", "K", "I", opts)
map("n", "l", "a", opts)
map("n", "L", "A", opts)

-- movement keys
map({"n", "v", "o"}, "w", "k", opts)
map({"n", "v", "o"}, "a", "h", opts)
map({"n", "v", "o"}, "s", "j", opts)
map({"n", "v", "o"}, "d", "l", opts)
map({"n", "v", "o"}, "W", "gg", opts)
map({"n", "v", "o"}, "S", "G", opts)
map({"n", "v", "o"}, "h", "<Nop>", opts)
map({"n", "v", "o"}, "gg", "<Nop>", opts)
map({"n", "v", "o"}, "G", "<Nop>", opts)

-- motions
map({"n", "v", "o"}, "q", "b", opts)
map({"n", "v", "o"}, "Q", "B", opts)
map({"n", "v", "o"}, "e", "w", opts)
map({"n", "v", "o"}, "E", "W", opts)
map("n", "b", "<Nop>", opts)
map("n", "B", "<Nop>", opts)

-- operator (around)
map({"v", "o"}, "b", "i", opts)
map({"v", "o"}, "t", "a", opts)
map({"v", "o"}, "i", "<Nop>", opts)


-- marking text (visual)
map("v", "b(", "ib", opts)
map("v", "B(", "ab", opts)
map("v", "b{", "iB", opts)
map("v", "B{", "aB", opts)
map("v", "b<", "it", opts)
map("v", "B<", "at", opts)
map("v", "be", "aw", opts)
del("v", "ab")
del("v", "aB")
del("v", "at")
del("v", "aw")
del("x", "<Plug>(MatchitVisualTextObject)")

-- delete
map({"n", "v", "o"}, "x", "d", opts)
map({"n", "v"}, "z", "x", opts)

-- undo/redo
map({"n", "v"}, "u", "u", opts)
map({"n", "v"}, "U", "<C-r>", opts)
map({"n", "v"}, "<C-r>", "<Nop>", opts)

-- cursor movements
map({"n", "v", "o"}, "A", "0", opts)
map({"n", "v", "o"}, "D", "$", opts)
map({"n", "v"}, "i", "<C-y>", opts)
map({"n", "v"}, "m", "<C-e>", opts)
map({"n", "v"}, "M", "zz", opts)
map({"n", "v", "o"}, "gw", "gk", opts)
map({"n", "v", "o"}, "gs", "gw", opts)
map({"n", "v", "o"}, "0", "<Nop>", opts)
map({"n", "v", "o"}, "$", "<Nop>", opts)

-- indents/lines
map("v", "<F4>", "<", opts)
map("v", "<F5>", ">", opts)
map("n", "<F4>", "<<", opts)
map("n", "<F5>", ">>", opts)
map("i", "<F4>", "<C-d>", opts)
map("i", "<F5>", "<C-t>", opts)
map({"n", "v"}, "<F2>", ":m-2<CR>", opts)
map({"n", "v"}, "<F3>", ":m+1<CR>", opts)
map("i", "<F2>", "<C-o>:m-2<CR>", opts)
map("i", "<F3>", "<C-o>:m+1<CR>", opts)

-- find
map({"n", "v"}, "j", ";", opts)
map({"n", "v"}, "J", ",", opts)

-- telescope
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>")
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>")

-- clipboard
map("v", "<leader>y", '"+y', {desc = "yank to clipboard"})
map("n", "<leader>p", '"+p', {desc = "paste from clipboard"})

-- file navigation
map("n", "<leader><Tab>", ':bnext<CR>', {desc = "next buffer"})
map("n", "<leader><S-Tab>", ':bprevious<CR>', {desc = "previous buffer"})

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", {desc = "open and focus tree"})
map("n", "<leader>E", ":NvimTreeFocus<CR>", {desc = "open and focus tree"})

-- lsp
map("n", "<leader>d", vim.diagnostic.open_float, {desc = "get diagnostic on cursor"})
map("n", "<leader>D", function()
    print(vim.inspect(vim.diagnostic.get(0)))
end, { desc = "print all diagnostics in current buffer" })

-- search and replace
map("n", "h", function()
    local search = vim.fn.input("search: ")
    if search == "" then return end
    local replace = vim.fn.input("replace: ")
    if replace == "" then return end
    vim.cmd(string.format("%%s/%s/%s/g", search, replace))
end, {desc = "search and replace"})

map("n", "H", function()
    local search = vim.fn.input("search: ")
    if search == "" then return end
    local replace = vim.fn.input("replace: ")
    if replace == "" then return end
    vim.cmd(string.format("%%s/%s/%s/gc", search, replace))
end, {desc = "search and replace with confirm"})

map("n", "<leader>h", ":nohlsearch<CR>", {desc = "remove highlight"})
