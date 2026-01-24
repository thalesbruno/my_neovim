return {
	{
		"catgoose/nvim-colorizer.lua",
		enabled = true,
		event = "BufReadPre",
		config = function()
			require("colorizer").setup({
				filetypes = { "*" },
				user_default_options = {
					names = true, -- "Name" codes like Blue or red
					RGB = true, -- #RGB hex codes
					RGBA = true, -- #RGBA hex codes
					RRGGBB = true, -- #RRGGBB hex codes
					RRGGBBAA = false, -- #RRGGBBAA hex codes
					rgb_fn = true, -- CSS rgb() and rgba() functions
					hsl_fn = true, -- CSS hsl() and hsla() functions
					oklch_fn = true, -- CSS oklch() function - OKLCH support!
					css = false, -- Enable all CSS features (set to false to use individual options)
					css_fn = true, -- Enable all CSS functions (set to false to use individual options)
					mode = "virtualtext", -- Set the display mode (background, foreground, virtualtext)
					tailwind = true, -- Enable tailwind colors
					sass = { enable = false }, -- Enable sass colors
				},
			})

			vim.keymap.set("n", "<leader>co", function()
				vim.cmd("ColorizerToggle")
			end, { desc = "Toggle colorizer" })
		end,
	},
	{
		"brenoprata10/nvim-highlight-colors",
		enabled = false,
		config = function()
			local hc = require("nvim-highlight-colors")
			hc.setup({
				render = "virtual",
				enable_named_colors = true,
				enable_tailwind = true,
				enable_hex = true,
				enable_rgb = true,
				enable_hsl = true,
				enable_hsla = true,
				enable_rgba = true,
			})

			vim.keymap.set("n", "<leader>co", function()
				hc.toggle()
			end, { desc = "Toggle highlight colors" })
		end,
	},
}
