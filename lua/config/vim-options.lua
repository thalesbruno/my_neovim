vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set cursorline")

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opts = { noremap = true, silent = true }
vim.keymap.set('n', '<leader>a', 'ggVG', opts)
vim.keymap.set('n', '<leader>cs', ':nohlsearch<CR>', opts)
vim.keymap.set('n', '<leader>n', ':vsplit<CR><C-w>l', opts)
vim.keymap.set('n', '<leader>ct', ':close<CR>', opts)
vim.keymap.set('n', '<leader>l', '<C-w>l', opts)
vim.keymap.set('n', '<leader>h', '<C-w>h', opts)
vim.keymap.set('n', '<leader>j', '<C-w>j', opts)
vim.keymap.set('n', '<leader>k', '<C-w>k', opts)
vim.keymap.set('n', 'J', '10j', opts)
vim.keymap.set('n', 'K', '10k', opts)
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', opts)

vim.keymap.set('n', '<leader>cf', function()
  vim.cmd('let @+ = expand("%:t")')
  vim.cmd('echo "File name copied to clipboard"')
end, opts)

