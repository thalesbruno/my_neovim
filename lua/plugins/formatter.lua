return {
	{
		"stevearc/conform.nvim",
		opts = {},
		config = function()
			local conform = require("conform")
			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					-- Conform will run the first available formatter
					javascript = { "biome", "prettier", "eslint_d", "prettierd", stop_after_first = true },
					javascriptreact = { "biome", "prettier", "eslint_d", "prettierd", stop_after_first = true },
					typescript = { "biome", "prettier", "eslint_d", "prettierd", stop_after_first = true },
					typescriptreact = { "biome", "prettier", "eslint_d", "prettierd", stop_after_first = true },
				},
				format_on_save = {
					-- These options will be passed to conform.format()
					timeout_ms = 500,
					lsp_format = "fallback",
				},
			})

			-- Map <leader>= to use conform.format instead of LSP formatter
			-- This ensures consistent formatting with format_on_save
			vim.keymap.set({ "n", "v" }, "<leader>=", function()
				conform.format({ async = true, lsp_fallback = true })
			end, { desc = "Format buffer with conform (Biome for JS/TS)" })
		end,
	},
}
