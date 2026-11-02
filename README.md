# My neovim setup


<div align="center">
  <img width="1507" alt="Screenshot 2025-02-26 at 15 50 18" src="https://github.com/user-attachments/assets/4c2d4424-7ce2-42db-8995-4d19875f73eb" />
</div>
<img width="1197" alt="Screenshot 2024-12-29 at 00 29 26" src="https://github.com/user-attachments/assets/0a84f61b-3a2b-4803-8fa8-e1805008a467" />

## Install

### Prerequisites

| Tool | Why it is needed |
| --- | --- |
| Neovim >= 0.11 | uses the built-in `vim.lsp.config` API |
| git | lazy.nvim clones every plugin |
| curl, unzip, tar, xz | mason and nvim-treesitter download and unpack tools and parsers |
| C compiler (cc/gcc/clang) | nvim-treesitter compiles each parser locally |
| node >= 18 + npm | 5 of the mason tools are npm packages (ts_ls, graphql, jsonls, biome, prettier) and the JS debugger runs on node |
| ripgrep (`rg`) | telescope live grep (`<leader>fg`); everything else works without it |
| a Nerd Font in your terminal | icons in the file tree, statusline, dashboard; without it they show as boxes |

Rust, Zig and Lua are **not** needed: rust-analyzer, zls, lua-language-server
and stylua come as prebuilt binaries through mason.

#### macOS (Homebrew)

```sh
xcode-select --install   # git, curl, unzip, tar and a C compiler (clang)
brew install neovim node ripgrep
brew install --cask font-jetbrains-mono-nerd-font
```

#### Ubuntu / Debian

The `neovim` package in apt is too old, so take the official release:

```sh
sudo apt update
sudo apt install -y git curl unzip tar xz-utils build-essential ripgrep nodejs npm

# Neovim (use nvim-linux-arm64 on ARM machines)
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.tar.gz
sudo rm -rf /opt/nvim-linux-x86_64
sudo tar -C /opt -xzf nvim-linux-x86_64.tar.gz
sudo ln -sf /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
```

If `node --version` reports less than 18, install a newer one (for example
with [nvm](https://github.com/nvm-sh/nvm) or [NodeSource](https://github.com/nodesource/distributions)).

#### Fedora

```sh
sudo dnf install -y neovim git curl unzip tar xz gcc make ripgrep nodejs npm
```

#### Arch

```sh
sudo pacman -S --needed neovim git curl unzip tar xz base-devel ripgrep nodejs npm
```

#### Nerd Font on Linux

```sh
mkdir -p ~/.local/share/fonts
curl -L https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.tar.xz \
  | tar -xJ -C ~/.local/share/fonts
fc-cache -f
```

Then select "JetBrainsMono Nerd Font" in your terminal's settings (on macOS too).

### Install the config

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
