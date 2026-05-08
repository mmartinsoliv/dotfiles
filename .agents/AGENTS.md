# Personal Dotfiles - Agent Context

## Project Overview

This repository contains personal dotfiles optimized for macOS development. It provides a complete, modern terminal environment with Neovim, Tmux, and Zsh configurations.

## Tech Stack

- **Neovim**: LazyVim distribution with custom plugins
- **Tmux**: Modern terminal multiplexer with plugins
- **Shell**: Zsh + Oh My Zsh + Powerlevel10k
- **Terminals**: Ghostty & Kitty (Tokyo Night theme)
- **Theme**: Tokyo Night (Storm variant)
- **Languages Supported**: JavaScript, TypeScript, Python, Rust, CSS, HTML, Lua, Go, JSON, YAML, Markdown

## File Organization

```
dotfiles/
├── .agents/          # AI assistant context & rules
├── bin/              # Custom helper scripts
├── ghostty/          # Ghostty terminal config
├── kitty/            # Kitty terminal config
├── nvim/             # Neovim (LazyVim) configuration
│   └── lua/
│       ├── config/   # Core LazyVim config (keymaps, options, autocmds)
│       └── plugins/  # Custom plugin configurations
├── tmux/             # Tmux configuration
├── zsh/              # Zsh shell configuration
├── install.sh        # One-command setup script
└── README.md         # Documentation
```

## Conventions

### Lua (Neovim)
- Use 2 spaces for indentation
- Prefer single quotes for strings
- Use `vim.keymap.set` for keybindings
- Lazy-load plugins when possible
- Group related configurations in separate files under `lua/plugins/`

### Shell (Zsh/Bash)
- Use 2 spaces for indentation
- Always quote variables: `"$var"`
- Use `#!/usr/bin/env bash` for bash scripts
- Use `#!/bin/zsh` for zsh scripts
- Prefer `[[ ]]` over `[ ]` for conditionals
- Functions: `function_name() { ... }`

### Tmux
- Use descriptive keybinding comments
- Group related settings together
- Prefix custom bindings with comments

## Commit Message Conventions

- `feat:` New feature or configuration
- `fix:` Bug fix or correction
- `docs:` Documentation changes
- `refactor:` Code/configuration restructuring
- `chore:` Maintenance tasks, dependency updates
- `theme:` Color or UI adjustments

## Important Notes

- `lazy-lock.json` should be committed to ensure reproducible builds
- `install.sh` should be tested on clean macOS before major changes
- Backups are automatically created by `install.sh` with timestamps
- All configs are symlinked, not copied

## Dependencies

Managed by `install.sh`:
- Homebrew
- Neovim (>= 0.9)
- Tmux (>= 3.2)
- Git
- Node.js (via nvm)
- Rust (optional, for rust-analyzer)
- Nerd Font (JetBrains Mono)
- Modern CLI tools: fzf, zoxide, eza, bat, ripgrep, fd, lazygit

## Testing Checklist

Before committing changes:
- [ ] Run `install.sh` on a test environment
- [ ] Verify Neovim starts without errors (`nvim --headless +q`)
- [ ] Verify Tmux config loads (`tmux source-file ~/.config/tmux/tmux.conf`)
- [ ] Verify Zsh config loads without errors (`zsh -n ~/.zshrc`)
- [ ] Check all symlinks are correct
- [ ] Test keybindings in Neovim and Tmux
- [ ] Verify LSP servers start correctly for supported languages
