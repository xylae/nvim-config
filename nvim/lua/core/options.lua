-- core/options.lua

local opt = vim.opt 

-- line numbers
opt.number = true 		            -- show current line number
opt.relativenumber = true 	        -- show relative number

-- tabs and indentation
opt.tabstop = 4			            -- a tab is 4 spaces 
opt.shiftwidth = 4		            -- indent size when auto-indenting
opt.expandtab = true		        -- convert tabs to spaces
opt.smartindent = true		        -- auto-indent based on syntax/context

-- search
opt.ignorecase = true		        -- ignore case when searching ...
opt.smartcase = true		        -- ... unless there is capital letter in the query

-- UI
opt.cursorline = true		        -- highlight current line
opt.termguicolors = true	        -- enable 24-bit RGB color in the terminal
opt.signcolumn = "yes"		        -- always show the sign column (prevents text shifting)
opt.scrolloff = 8		            -- keep 8 lines above/below the cursor when scrolling
opt.wrap = true			            -- wrap long lines

-- file behavior
opt.swapfile = false		        -- disable swap files
opt.backup = false		            -- disable backup files
opt.undofile = true		            -- enable undo history even after closing file

-- clipboard
opt.clipboard = "unnamedplus"	    -- use system clipboard
vim.g.clipboard = {
    name = 'win32yank',
    copy = {
        ["+"] = "win32yank -i --crlf",
        ["*"] = "win32yank -i --crlf",
    },
    paste = {
        ["+"] = "win32yank -o --lf",
        ["*"] = "win32yank -o --lf",
    },
    cache_enabled = 1,
}

-- mouse
opt.mouse = "a"			            -- enable mouse support

-- disable auto-inserting comments on enter
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt.formatoptions:remove({"r", "o"})
    end,
})
