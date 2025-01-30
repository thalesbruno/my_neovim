return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls", "ts_ls", "zls", "graphql", "jsonls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.ts_ls.setup({})

			vim.keymap.set(
				"n",
				"<leader>i",
				vim.lsp.buf.hover,
				{ desc = "LSP: Displays hover information about the symbol under the cursor" }
			)
			vim.keymap.set(
				"n",
				"<leader>r",
				vim.lsp.buf.rename,
				{ desc = "LSP: renames all references to the symbol under the cursor" }
			)
			vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP: code action" })
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "LSP: diagnostic on float window" })
    end,
	},
}
