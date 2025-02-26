return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()

			vim.keymap.set(
				"n",
				"<leader>gb",
				":Gitsigns toggle_current_line_blame<CR>",
				{ desc = "Gitsigns: blame line" }
			)
			vim.keymap.set("n", "<leader>gB", ":Gitsigns blame<CR>", { desc = "Gitsigns: blame whole file" })
			vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>", { desc = "Gitsigns: preview change hunk" })
			vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Gitsigns: stage/unstage hunk" })
			vim.keymap.set("n", "<leader>gS", ":Gitsigns stage_buffer<CR>", { desc = "Gitsigns: stage/unstage file" })
			vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Gitsigns: reset hunk" })
			vim.keymap.set("n", "<leader>gR", ":Gitsigns reset_buffer<CR>", { desc = "Gitsigns: reset the entire file" })
			vim.keymap.set("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "Gitsigns: go to next hunk" })
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
