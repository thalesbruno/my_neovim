# My neovim setup


<div align="center">
  <img width="1507" alt="Screenshot 2025-02-26 at 15 50 18" src="https://github.com/user-attachments/assets/4c2d4424-7ce2-42db-8995-4d19875f73eb" />
</div>
<img width="1197" alt="Screenshot 2024-12-29 at 00 29 26" src="https://github.com/user-attachments/assets/0a84f61b-3a2b-4803-8fa8-e1805008a467" />

## Install

Requirements: Neovim >= 0.11, git, curl, unzip, tar, a C compiler, node + npm,
and a [Nerd Font](https://www.nerdfonts.com/) in your terminal. ripgrep is
needed for live grep; fd is optional.

```sh
curl -fsSL https://raw.githubusercontent.com/thalesbruno/my_neovim/main/install.sh | bash
```

or clone it yourself and run the script from the clone:

```sh
git clone https://github.com/thalesbruno/my_neovim.git ~/.config/nvim
~/.config/nvim/install.sh
```

The script backs up any existing `~/.config/nvim`, installs plugins at the
versions pinned in `lazy-lock.json`, then installs treesitter parsers and all
language servers, formatters and debug adapters through mason. Nothing is
installed outside Neovim's own data directory.

### Machine-specific settings

Copy `lua/config/local.example.lua` to `lua/config/local.lua` (gitignored).
It loads before everything else. For example, to have `<leader>ut` also switch
the terminal/OS theme:

```lua
vim.g.theme_switch_cmd = { "fish", "-c", "theme %s" } -- %s = latte | mocha
```

## roadmap

- [x] neovim
- [x] telescope
- [x] neotree
- [x] tree-sitter
- [x] lualine
- [x] bufferline
- [x] catppuccin
- [x] mason
- [x] mason-lspconfig
- [x] nvim-lspconfig
- [x] none-ls
- [x] none-ls-extras
- [x] alpha
- [x] nvim-autopairs
- [x] git-signs 
- [x] diffview
- [x] nvim-comments
- [x] autocomplete
- [x] vim-lazygit
- [x] toggleterm
- [x] rest-vim 
- [x] tree-sitter-context 
- [x] nui
- [x] debugger
- [x] avante
- [x] copilot
- [x] conform
- [x] nvim-highlight-colors
