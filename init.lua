-- Load basic options and keymaps first
require("config.vim-options")

-- Only load lazy.nvim (and subsequently plugins) if not running in VS Code
if not vim.g.vscode then
  require("config.lazy")
else
  -- VS Code specific configurations and keybindings
  require("config.vscode")
end

-- Add any other configurations that should run in both environments below
