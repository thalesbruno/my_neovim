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

vim.keymap.set('n', '<leader>cf', function()
  vim.cmd('let @+ = expand("%:t")')
  vim.cmd('echo "File name copied to clipboard"')
end, opts)

