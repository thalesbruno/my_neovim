vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set cursorline")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<leader>a", "ggVG", { desc = "Vim select all" })
vim.keymap.set("n", "<leader>cl", ":nohlsearch<CR>", { desc = "Vim clear search" })
vim.keymap.set("n", "<leader>n", ":vsplit<CR><C-w>l", { desc = "Vim open new tab" })
vim.keymap.set("n", "<leader>ct", ":close<CR>", { desc = "Vim close tab" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Vim move through tabs" })
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Vim move through tabs" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Vim move through tabs" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Vim move through tabs" })
vim.keymap.set("n", "J", "10j", { desc = "Vim move 10 lines up" })
vim.keymap.set("n", "K", "10k", { desc = "Vim move 10 lines down" })
vim.api.nvim_set_keymap("t", "<Esc>", "<C-\\><C-n>", { desc = "Vim exit terminal mode" })

vim.keymap.set("n", "<leader>cf", function()
  vim.cmd('let @+ = expand("%:t")')
  vim.cmd('echo "File name copied to clipboard"')
end, { desc = "Vim copy file name to clipboard" })

vim.keymap.set("v", "<leader>c", function()
  vim.cmd('normal! "+y')
  vim.cmd('echo "Selected text copied to clipboard"')
end, { desc = "Vim copy test to clipboard" })
