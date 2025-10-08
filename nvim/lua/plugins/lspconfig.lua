return {
	"neovim/nvim-lspconfig",
	config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        capabilities.textDocument.completion.completionItem.snippetSupport = false

        vim.lsp.config('clangd', {
          cmd = { 'clangd' },
          capabilities = capabilities,
        })

        vim.lsp.enable('clangd')
	end,
}
