# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands
- Format Lua: stylua <file.lua>
- Format JS/TS: prettier <file.js|ts>
- LSP check: Run Neovim with `:checkhealth` or `:LspInfo`
- Sort imports: Use custom keybinding `<leader>si` in Neovim

## Steps for installing prettier-plugin-sql
```bash
# Install in your project directory
npm install -D prettier prettier-plugin-sql

# Create or update .prettierrc
cat > .prettierrc << EOF
{
  "plugins": ["prettier-plugin-sql"],
  "language": "postgresql",
  "keywordCase": "upper"
}
EOF
```

## Code Style Guidelines
- Indentation: 2 spaces
- Naming: Use descriptive names for configurations and functions
- Plugins: Organize in separate files under lua/plugins/
- Config: Keep shared configurations in lua/config/
- Error handling: Use vim.notify for user-facing errors
- Keymaps: Include descriptive comments with `desc` parameter
- Plugin setup: Use return table pattern for lazy.nvim configurations
- LSP configuration: Add new language servers in the mason-lspconfig setup
- Format: Keep code clean with stylua (Lua) and prettier (JS/TS)