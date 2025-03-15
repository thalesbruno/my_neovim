vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set cursorline")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"
-- vim.opt.guicursor = ""
vim.opt.guicursor = "n-v-c-sm:underline,i-ci-ve:blinkwait700-blinkon400-blinkoff250,r-cr-o:underline"



vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Vim select all" })
vim.keymap.set("n", "<leader>cl", ":nohlsearch<CR>", { desc = "Vim clear search" })

vim.keymap.set("n", "<leader>wn", ":vsplit<CR><C-w>l", { desc = "Vim open new window" })
vim.keymap.set("n", "<leader>wx", ":close<CR>", { desc = "Vim close window" })
vim.keymap.set("n", "<leader>w<leader>w", "<c-w><c-w>", { desc = "Vim move through windows" })
vim.keymap.set("n", "<leader>wh", "<c-w>h", { desc = "Vim move to window on the left" })
vim.keymap.set("n", "<leader>wl", "<c-w>l", { desc = "Vim move to window on the right" })
vim.keymap.set("n", "<leader>wj", "<c-w>j", { desc = "Vim move to window below" })
vim.keymap.set("n", "<leader>wk", "<c-w>k", { desc = "Vim move to window above" })

vim.keymap.set({ "n", "v" }, "J", "10j", { desc = "Vim move 10 lines up" })
vim.keymap.set({ "n", "v" }, "K", "10k", { desc = "Vim move 10 lines down" })

vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Vim exit terminal mode" })

vim.keymap.set("n", "<leader>cf", function()
	vim.cmd('let @+ = expand("%:t")')
	vim.cmd('echo "File name copied to clipboard"')
end, { desc = "Vim copy file name to clipboard" })

vim.keymap.set("v", "<leader>c", function()
	vim.cmd('normal! "+y')
	vim.cmd('echo "Selected text copied to clipboard"')
end, { desc = "Vim copy test to clipboard" })

vim.keymap.set("n", "<leader>fx", function()
	local file = vim.fn.expand("%") -- Get the current file path (relative to PWD)
	local project_root = vim.fn.fnamemodify(file, ":h"):match("^(.-/[^/]+/)") -- Detect the first directory inside repo root

	if project_root then
		local relative_path = file:gsub(project_root, "") -- Remove project root from file path
		local cmd = string.format(":!cd %s && eslint_d %s --fix", project_root, relative_path)
		vim.cmd(cmd)
	else
		print("Could not determine project root.")
	end
end, { desc = "Run eslint_d --fix on current file" })
