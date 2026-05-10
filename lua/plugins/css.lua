return {
	{
		"catgoose/nvim-colorizer.lua",
		enabled = true,
		event = "BufReadPre",
		config = function()
		require("colorizer").setup({
			filetypes = { "*" },
			options = {
				parsers = {
					names = { enable = true }, -- "Name" codes like Blue or red
					hex = {
						rgb = true, -- #RGB hex codes
						rgba = true, -- #RGBA hex codes
						rrggbb = true, -- #RRGGBB hex codes
					},
					rgb = { enable = true }, -- CSS rgb() and rgba() functions
					hsl = { enable = true }, -- CSS hsl() and hsla() functions
					oklch = { enable = true }, -- CSS oklch() function
					css = false,
					css_fn = true, -- Enable all CSS functions
					tailwind = { enable = true }, -- Enable tailwind colors
				},
				display = {
					mode = "virtualtext", -- background | foreground | virtualtext
				},
			},
		})

			vim.keymap.set("n", "<leader>co", function()
				vim.cmd("ColorizerToggle")
			end, { desc = "Toggle colorizer" })
		end,
	},
}
