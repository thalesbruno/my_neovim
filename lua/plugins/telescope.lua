return {
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.8",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ hidden = true })
			end, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fh", builtin.oldfiles, { desc = "Telescope previously open files" })
			vim.keymap.set("n", "<leader>f?", builtin.keymaps, { desc = "Telescope keymappings" })
			vim.keymap.set(
				"n",
				"<leader>fr",
				builtin.lsp_references,
				{ desc = "Telescope Lists LSP references for word under the cursor" }
			)
			vim.keymap.set(
				"n",
				"<leader>fc",
				builtin.lsp_incoming_calls,
				{ desc = "Telescope Lists LSP incoming calls for word under the cursor" }
			)
			vim.keymap.set(
				"n",
				"<leader>fs",
				builtin.current_buffer_fuzzy_find,
				{ desc = "Telescope Live fuzzy search inside of the currently open buffer" }
			)
			vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {
				desc = "Telescope Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope",
			})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
