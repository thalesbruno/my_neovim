return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("bufferline").setup({
				options = {
					offsets = {
						{
							filetype = "neo-tree",
							text = "File Explorer",
							highlight = "Directory",
							separator = true,
						},
					},
				},
			})
			vim.opt.termguicolors = true
      local opts = { noremap = true, silent = true }
      vim.keymap.set('n', '<leader><Tab>', ':BufferLineCycleNext<CR>', opts)
      vim.keymap.set('n', '<leader><S-Tab>', ':BufferLineCyclePrev<CR>', opts)
      -- TODO: add close others?
      -- TODO: add close to the right/left?
		end,
	},
	{
		"famiu/bufdelete.nvim",
		config = function()
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>q", ":Bdelete<CR>", opts)
		end,
	},
}
