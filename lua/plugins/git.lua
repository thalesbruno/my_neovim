return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns: preview change hunk" })
			vim.keymap.set(
				"n",
				"<leader>gb",
				":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "Gitsigns: blame line" }
			)
			vim.keymap.set("n", "<leader>gB", ":Gitsigns blame<CR>", { desc = "Gitsigns: blame whole file" })
		end,
	},
	{
		"sindrets/diffview.nvim",
		config = function()
			vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>", { desc = "Git diffview: open file diff view" })
			-- vim.keymap.set("n", "<leader>gq", ":DiffviewClose<CR>", { desc = "Git diffview: close git diff view" })
			vim.keymap.set("n", "q", ":DiffviewClose<CR>", { desc = "Git diffview: close git diff view" })
			vim.keymap.set(
				"n",
				"<leader>gh",
				":DiffviewFileHistory % --no-merges<CR>",
				{ desc = "Git diffview: view file history" }
			)
		end,
	},
}
