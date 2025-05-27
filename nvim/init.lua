-- load core settings
vim.g.loaded_matchit = 1

require("core.options")
require("core.keymaps")

-- bootstrap plugin manager
require("core.lazy")

-- light mode
vim.o.background = "light"
