return {
	"neovim/nvim-lspconfig",
	config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        capabilities.textDocument.completion.completionItem.snippetSupport = false

        vim.lsp.config('clangd', {
          cmd = { 'clangd' },
          capabilities = capabilities,
          root_markers = { ".clangd", "compile_flags.txt", "compile_commands.json" },
          filetypes = { 'c' },
        })

        vim.lsp.enable('clangd')
	end,
}
