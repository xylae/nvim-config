return {
	"neovim/nvim-lspconfig",
	config = function()
		local capabilities = require("cmp_nvim_lsp").default_capabilities()

		-- Disable snippet support if you don’t want snippet completions
		capabilities.textDocument.completion.completionItem.snippetSupport = false

		-- Use the new vim.lsp.config API (Neovim 0.10+)
		vim.lsp.config["clangd"] = {
			cmd = { "clangd" },
			capabilities = capabilities,
		}

		-- Start or attach clangd automatically to matching buffers
		vim.lsp.start(vim.lsp.config["clangd"])
	end,
}
