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
				ensure_installed = { "lua_ls", "ts_ls", "graphql", "jsonls", "zls" },
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.graphql.setup({})
			lspconfig.jsonls.setup({})
			lspconfig.zls.setup({
				cmd = { vim.fn.expand("~/Codes/zig/zls/zig-out/bin/zls") },
			})

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
	{
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>xx",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
			{
				"<leader>xX",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Buffer Diagnostics (Trouble)",
			},
			{
				"<leader>xs",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Symbols (Trouble)",
			},
			{
				"<leader>xl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "LSP Definitions / references / ... (Trouble)",
			},
			{
				"<leader>xL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Location List (Trouble)",
			},
			{
				"<leader>xQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Quickfix List (Trouble)",
			},
		},
	},
}
