# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this is

Personal dotfiles for macOS, managed with GNU Stow. Each top-level directory is a stow "package" whose contents mirror `$HOME` (e.g. `fish/.config/fish/...` → `~/.config/fish/...`). There is no build step; changes take effect by re-stowing or are picked up live by the target app (fish, nvim, etc.).

## Setup / install

```bash
fish INSTALL.fish        # stows every top-level package dir into $HOME
brew bundle install --global --file=homebrew/.Brewfile
```

`INSTALL.fish` just runs `stow <dir>` for every directory in the repo root, so adding a new package is as simple as creating a new top-level dir shaped like the `$HOME` path it targets.

## Package layout

- `fish/` — fish shell config (`.config/fish/`): `config.fish` is the entrypoint; `conf.d/*.fish` load automatically at startup (ordered by filename prefix, e.g. `zzzz_00_env.fish` before `zzzz_99_*.fish`); `functions/*.fish` are lazy-loaded fish functions (one function per file, filename == function name); `completions/*.fish` are per-command completions. The `brew` function wraps `command brew` and auto-syncs `~/.Brewfile` (via the shared `__brew_bundle_dump` helper) after `install`/`uninstall`/`upgrade`/`tap`/etc.; `brewsync` calls that same helper directly for a manual re-sync.
- `nvim/` — Neovim config using lazy.nvim. `init.lua` requires `config`, which (`lua/config/init.lua`) loads settings/keymaps/autocmds then `all-plugins.lua`, which bootstraps lazy.nvim and imports every module under `lua/config/plugins/`. Plugin specs are grouped by concern (`edit.lua`, `syntax.lua`, `system.lua`, `ui.lua`); one-off setup functions live under `lua/config/setupfn/`. `lazy-lock.json` pins plugin versions — treat it like a lockfile. `python3_host_prog` (`init.lua`) points at `pynvim-python`, installed via `uv tool install pynvim` — no project-local venv needed. LSP servers are declared in `setupfn/lspsetup.lua`'s `servers` table and wired up via native `vim.lsp.config()`/`vim.lsp.enable()` (not `mason-lspconfig`'s old `handlers` API — that's gone upstream); completion is `blink.cmp`, not `nvim-cmp`. `nvim-treesitter` tracks the `main` branch (the rewritten API, not the old `nvim-treesitter.configs` module) and needs the `tree-sitter` CLI (`brew "tree-sitter-cli"`) on PATH to compile parsers.
- `mise/` — `.config/mise/config.toml` pins global tool versions (node, kubectl, deno) via mise.
- `homebrew/` — `.Brewfile` is the single source of truth for installed formulae/casks; install/update with `brew bundle`.
- `wezterm/`, `starship/`, `ripgrep/`, `editorconfig/` — single-file configs for their respective tools.
- `scripts/.bin/` — personal scripts/binaries added to `PATH`.

## Conventions

- Indentation follows the root `.editorconfig`: tabs width 4 by default, 2-space for `md/js/ts/lua/jsx/tsx/conf/yaml/yml/toml`, hard tabs for `Makefile`/`.go`/`gitconfig`.
- This repo predates the current macOS-only setup (see README.md) — check before assuming an old config path is still in use.
- No linter, formatter, or test suite is configured for this repo; validate fish changes with `fish -n <file>` (syntax check) or by sourcing, and validate nvim lua changes by launching `nvim` and checking `:checkhealth` / `:Lazy`.
