-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim with minimal configuration
require("lazy").setup({
	spec = {
		-- Only load essential plugins in VSCode mode
		{
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
				vim.keymap.set({ "n", "v" }, "<leader>/", "gcc", { remap = true })
			end,
		},
	},
	install = {
		colorscheme = { "habamax" },
	},
	checker = { enabled = false },
})

-- VSCode tab management
vim.keymap.set(
	"n",
	"<leader>q",
	"<cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>h",
	"<cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>l",
	"<cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>ff",
	"<cmd>call VSCodeNotify('workbench.action.quickOpenWithModes')<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"n",
	"<leader>fd",
	"<cmd>call VSCodeNotify('editor.action.revealDefinition')<CR>",
	{ noremap = true, silent = true }
)
-- VSCode search functionality
vim.keymap.set(
	"n",
	"<leader>fg",
	"<cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': expand('<cword>') })<CR>",
	{ noremap = true, silent = true }
)
vim.keymap.set(
	"v",
	"<leader>fg",
	"<cmd>call VSCodeNotify('workbench.action.findInFiles', { 'query': getline(\"'<\", \"'>\") })<CR>",
	{ noremap = true, silent = true }
)
-- Search for usages of the symbol under the cursor
vim.keymap.set(
	"n",
	"<leader>fu",
	"<cmd>call VSCodeNotify('editor.action.referenceSearch.trigger')<CR>",
	{ noremap = true, silent = true }
)
