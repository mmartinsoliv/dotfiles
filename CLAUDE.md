# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What This Repo Is

Personal dotfiles for macOS. `install.sh` symlinks every config directory into the right place — it does not copy files. Editing files here edits them live for anyone who has run `install.sh`.

## Installation

```bash
./install.sh          # full setup (Homebrew, symlinks, plugins, Neovim bootstrap)
```

Individual verification steps (run before committing):

```bash
nvim --headless +q                              # Neovim starts without errors
tmux source-file ~/.config/tmux/tmux.conf       # Tmux config is valid
zsh -n zsh/.zshrc                               # Zsh syntax check
```

## Symlink Map

`install.sh` creates these symlinks (source → target):

| Source | Target |
|--------|--------|
| `nvim/` | `~/.config/nvim` |
| `tmux/tmux.conf` | `~/.config/tmux/tmux.conf` |
| `zsh/.zshrc` | `~/.zshrc` |
| `zsh/.zprofile` | `~/.zprofile` |
| `kitty/` | `~/.config/kitty` |
| `ghostty/` | `~/.config/ghostty` |
| `starship/starship.toml` | `~/.config/starship.toml` |
| `claude/settings.json` | `~/.claude/settings.json` |
| `agents/rules` | `~/.claude/rules` |
| `agents/commands` | `~/.claude/commands` |
| `skills/` | `~/.claude/skills` and `~/.agents/skills` |
| `bin/*` | `~/bin/*` |

## Architecture

### Neovim (`nvim/`)
LazyVim distribution. Plugin specs live in `nvim/lua/plugins/` — one file per plugin or closely related group. Core behavior (options, keymaps, autocmds) lives in `nvim/lua/config/`. Custom snippets are in `nvim/lua/snippets/`. `lazy-lock.json` is committed for reproducible builds; never edit it manually.

### Skills (`skills/`)
Each subdirectory is a Claude Code skill (slash command). Skills are symlinked globally to `~/.claude/skills/` and `~/.agents/skills/`. Adding a directory here makes it available as `/skill-name` in any Claude Code session after the symlink is active.

### AI Tooling (`claude/`, `agents/`, `skills/`)
- `claude/settings.json` — global Claude Code settings (model, permissions, hooks, editor mode)
- `agents/rules/` — global agent rules applied to all projects
- `agents/commands/` — custom Claude Code commands
- `bin/ai-notify` — macOS notification script; called by Claude Code's `Stop` and `Notification` hooks

## Coding Conventions

### Lua (Neovim)
- 2-space indent, single quotes, trailing commas in multi-line tables
- Keybindings: `vim.keymap.set('mode', 'lhs', rhs, { desc = 'Description' })`
- Lazy-load all non-essential plugins via `event`, `cmd`, `ft`, or `keys`
- To disable a plugin: set `enabled = false`, do not delete the file

### Shell (Bash/Zsh)
- 2-space indent, `set -euo pipefail` at top, always `local` for function variables
- Quote all variables: `"$var"`
- Shebang: `#!/usr/bin/env bash`
- Use `[[ ]]` not `[ ]` for conditionals

### Git
- Conventional commits: `feat:`, `fix:`, `docs:`, `refactor:`, `chore:`
- First line ≤ 50 characters
- Branches: `main` (stable), `feature/*`, `fix/*`, `experiment/*`

## Hard Rules

- Never hardcode user-specific paths (use `$HOME` or `$DOTFILES_DIR`)
- Never commit API keys or secrets
- Never break existing keybindings without a migration path
- Never use `sudo` in scripts without explicit user consent
- Don't modify `lazy-lock.json` manually
