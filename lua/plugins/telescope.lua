return {
	{
		"nvim-telescope/telescope.nvim",
		-- tag = "0.1.8",
		branch = "master",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-live-grep-args.nvim",
				-- This will not install any breaking changes.
				-- For major updates, this must be adjusted manually.
				version = "^1.0.0",
			},
		},
		config = function()
			local builtin = require("telescope.builtin")
			local telescope = require("telescope")
			local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")

			telescope.load_extension("live_grep_args")

			vim.keymap.set(
				"n",
				"<leader>fu",
				live_grep_args_shortcuts.grep_word_under_cursor,
				{ desc = "Telescope grep word under cursor with args " }
			)
			vim.keymap.set("n", "<leader>ff", function()
				builtin.find_files({ hidden = true })
			end, { desc = "Telescope find files" })
			-- vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set(
				"n",
				"<leader>fg",
				":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
				{ desc = "Telescope live grep with args" }
			)
			vim.keymap.set("n", "<leader>fh", builtin.oldfiles, { desc = "Telescope previously open files" })
			-- vim.keymap.set("n", "<leader>fu", builtin.grep_string, { desc = "Telescope grep string under cursor" })
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
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope List open buffers" })
			vim.keymap.set("n", "<leader>fd", builtin.lsp_definitions, {
				desc = "Telescope Goto the definition of the word under the cursor, if there's only one, otherwise show all options in Telescope",
			})

			-- git pickers
			vim.keymap.set(
				{ "n", "v" },
				"<leader>gsh",
				builtin.git_bcommits_range,
				{ desc = "Telescope git - open commits for selected range" }
			)
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
