#!/usr/bin/env bash
# Install this Neovim config on a new machine (macOS or Linux).
#
#   curl -fsSL https://raw.githubusercontent.com/thalesbruno/my_neovim/main/install.sh | bash
#   # or, from a clone:  ./install.sh
#
# Env overrides:
#   NVIM_CONFIG_REPO  git URL to clone (default: the https URL below)
#   NVIM_CONFIG_DIR   target dir (default: ${XDG_CONFIG_HOME:-$HOME/.config}/nvim)
set -euo pipefail

REPO="${NVIM_CONFIG_REPO:-https://github.com/thalesbruno/my_neovim.git}"
TARGET="${NVIM_CONFIG_DIR:-${XDG_CONFIG_HOME:-$HOME/.config}/nvim}"

say() { printf '\033[1;34m==>\033[0m %s\n' "$*"; }
warn() { printf '\033[1;33mwarn:\033[0m %s\n' "$*" >&2; }
die() { printf '\033[1;31merror:\033[0m %s\n' "$*" >&2; exit 1; }
has() { command -v "$1" >/dev/null 2>&1; }

# --- prerequisites ---------------------------------------------------------
say "Checking prerequisites"

has nvim || die "neovim is not installed (need >= 0.11)
see the Prerequisites section of https://github.com/thalesbruno/my_neovim#prerequisites"
nvim --headless -c 'if !has("nvim-0.11") | cquit | endif' -c 'qa' \
  || die "neovim >= 0.11 is required (found: $(nvim --version | head -1))"

missing_required=()
for cmd in git curl unzip tar; do has "$cmd" || missing_required+=("$cmd"); done
# GNU tar needs the xz binary for .tar.xz; macOS tar handles it natively
[ "$(uname -s)" = Darwin ] || has xz || missing_required+=("xz")
has cc || has gcc || has clang || missing_required+=("a C compiler (cc/gcc/clang)")
if has node && has npm; then
  node_major="$(node -p 'process.versions.node.split(".")[0]' 2>/dev/null || echo 0)"
  [ "$node_major" -ge 18 ] || missing_required+=("node >= 18 (found $(node --version))")
else
  missing_required+=("node + npm")
fi
[ ${#missing_required[@]} -eq 0 ] || die "missing: ${missing_required[*]}
see the Prerequisites section of https://github.com/thalesbruno/my_neovim#prerequisites"

has rg || warn "ripgrep (rg) not found: telescope live grep (<leader>fg) will not work"
warn "make sure your terminal uses a Nerd Font, or icons will render as boxes"

# --- clone -----------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]:-$0}")" 2>/dev/null && pwd || true)"
if [ -n "$SCRIPT_DIR" ] && [ "$SCRIPT_DIR" = "$(cd "$TARGET" 2>/dev/null && pwd)" ]; then
  say "Running from $TARGET, skipping clone"
else
  if [ -e "$TARGET" ]; then
    backup="$TARGET.bak.$(date +%Y%m%d%H%M%S)"
    say "Backing up existing $TARGET to $backup"
    mv "$TARGET" "$backup"
  fi
  say "Cloning $REPO into $TARGET"
  mkdir -p "$(dirname "$TARGET")"
  git clone --depth 1 "$REPO" "$TARGET"
fi

# --- plugins, parsers and tools ---------------------------------------------
say "Installing plugins at the versions pinned in lazy-lock.json"
nvim --headless "+Lazy! restore" +qa

say "Installing treesitter parsers"
nvim --headless "+TSUpdateSync" +qa || warn "treesitter install reported errors; run :TSUpdate inside nvim"

say "Installing language servers, formatters and debug adapters (mason)"
nvim --headless "+MasonToolsInstallSync" +qa || warn "mason install reported errors; check :Mason inside nvim"

cat <<EOF

Done. Start nvim and run :checkhealth if anything looks off.
Machine-specific settings go in $TARGET/lua/config/local.lua
(see lua/config/local.example.lua); that file is gitignored.
EOF
