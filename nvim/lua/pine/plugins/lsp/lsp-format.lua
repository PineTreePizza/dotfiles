return {
	"lukas-reineke/lsp-format.nvim",
	config = function()
		require("lsp-format").setup({})
		local on_attach = function(client, bufnr)
			require("lsp-format").on_attach(client, bufnr)
		end
		require("lspconfig").dockerls.setup({ on_attach = on_attach })
		require("lspconfig").html.setup({ on_attach = on_attach })
		require("lspconfig").jsonls.setup({ on_attach = on_attach })
		require("lspconfig").jedi_language_server.setup({ on_attach = on_attach })
		require("lspconfig").sqlls.setup({ on_attach = on_attach })
		require("lspconfig").tsserver.setup({ on_attach = on_attach })
		require("lspconfig").gopls.setup({ on_attach = on_attach })
		require("lspconfig").lua_ls.setup({ on_attach = on_attach })
		require("lspconfig").clangd.setup({ on_attach = on_attach })
		require("lspconfig").cssls.setup({ on_attach = on_attach })
		require("lspconfig").cmake.setup({ on_attach = on_attach })
		require("lspconfig").bashls.setup({ on_attach = on_attach })
		require("lspconfig").arduino_language_server.setup({ on_attach = on_attach })
	end,
}
