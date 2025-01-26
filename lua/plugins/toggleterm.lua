return {
	"akinsho/toggleterm.nvim",
	version = "*",
	-- config = true,
	config = function()
		require("toggleterm").setup({ size = 25 })
		local opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>t", ":ToggleTerm<CR>", opts)
	end,
}
