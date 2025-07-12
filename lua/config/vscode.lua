print("VS Code detected, loading VS Code specific settings.")
local status_ok, vscode = pcall(require, 'vscode')
if not status_ok then
  print("Error loading vscode module for keybindings.")
  return
end

-- Define VS Code specific keybindings here
vim.keymap.set('n', '<leader>fg', function()
  vscode.action('workbench.action.findInFiles')
end, { desc = "VSCode: Find in Files" })

vim.keymap.set('n', '<leader>ff', function()
  vscode.action('workbench.action.quickOpen')
end, { desc = "VSCode: Quick Open" })

vim.keymap.set('n', '<leader>e', function()
  vscode.action('workbench.view.explorer')
end, { desc = "VSCode: Show explorer" })

vim.keymap.set('n', '<leader>l', function()
  vscode.action('workbench.action.nextEditor')
end, { desc = "VSCode: next editor" })

vim.keymap.set('n', '<leader>h', function()
  vscode.action('workbench.action.previousEditor')
end, { desc = "VSCode: previous editor" })

vim.keymap.set({ 'n', 'v' }, '<leader>/', function()
  vscode.action('editor.action.commentLine')
end, { desc = "VSCode: toggle comment" })

vim.keymap.set('n', '<leader>fd', function()
  vscode.action('editor.action.revealDefinition')
end, { desc = "VSCode: go to definition" })

vim.keymap.set('n', '<leader>q', function()
  vscode.action('workbench.action.closeActiveEditor')
end, { desc = "VSCode: close active editor" })

-- for non-vim tabs
vim.keymap.set('n', '<c-w>q', function()
  vscode.action('workbench.action.closeActiveEditor')
end, { desc = "VSCode: close active editor" })

vim.keymap.set('n', '<leader>et', function()
  vscode.action('workbench.action.toggleSidebarVisibility')
end, { desc = "VSCode: toggle primary side bar" })

vim.keymap.set('n', '<c-w>a', function()
  vscode.action('workbench.action.toggleAuxiliaryBar')
end, { desc = "VSCode: toggle secondary side bar" })

vim.keymap.set('n', '<leader>aa', function()
  vscode.action('workbench.panel.chat')
end, { desc = "VSCode: toggle copilot chat" })

vim.keymap.set('n', '<c-w>h', function()
  vscode.action('workbench.action.navigateLeft')
end, { desc = "VSCode: navigate to the left panel" })

vim.keymap.set('n', '<c-w>l', function()
  vscode.action('workbench.action.navigateRight')
end, { desc = "VSCode: navigate to the right panel" })

vim.keymap.set('n', '<leader>e', function()
  vscode.action('workbench.view.explorer')
end, { desc = "VSCode: show explorer" })

vim.keymap.set('n', '<leader>fc', function()
  vscode.action('references-view.findReferences')
end, { desc = "VSCode: Find References (Symbol)" })

-- vim.keymap.set('n', '<leader>fu', function()
--   vscode.action('')
-- end, { desc = "VSCode: Find Occurrences (Word)" })

vim.keymap.set('n', '<leader>x', function()
  vscode.action('workbench.action.showCommands')
end, { desc = "VSCode: show commands" })

vim.keymap.set('n', '<leader>=', function()
  vscode.action('editor.action.formatDocument')
end, { desc = "VSCode: show commands" })

vim.keymap.set('n', '<leader>ca', function()
  vscode.action('editor.action.quickFix')
end, { desc = "VSCode: show commands" })

vim.keymap.set('n', '<leader>i', function()
  vscode.action('editor.action.showDefinitionPreviewHover')
end, { desc = "VSCode: show info" })

vim.keymap.set('n', '<leader>wn', function()
  vscode.action('workbench.action.splitEditorRight')
end, { desc = "VSCode: split editor right" })

vim.keymap.set('n', '<leader>r', function()
  vscode.action('editor.action.rename')
end, { desc = "VSCode: rename symbol" })
