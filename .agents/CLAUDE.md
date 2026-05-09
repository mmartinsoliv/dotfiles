# Personal Dotfiles - Agent Context

## Project Overview

This repository contains personal dotfiles optimized for macOS development. It provides a complete, modern terminal environment with Neovim, Tmux, Zsh, and AI tooling configurations.

## Tech Stack

- **Neovim**: LazyVim distribution with custom plugins (including Avante for AI coding)
- **Tmux**: Modern terminal multiplexer with plugins
- **Shell**: Zsh + Oh My Zsh + Starship
- **Terminals**: Ghostty & Kitty (Tokyo Night theme)
- **Theme**: Tokyo Night (Storm variant)
- **AI Tools**: Claude Code, OpenCode, Avante (Kimi)
- **Languages Supported**: JavaScript, TypeScript, Python, Rust, CSS, HTML, Lua, Go, JSON, YAML, Markdown

## File Organization

```
dotfiles/
├── .agents/          # AI assistant context & rules (project-specific)
├── agents/           # Global AI tooling (rules, skills, commands)
├── bin/              # Custom helper scripts (ai-notify, tmux-sessionizer)
├── claude/           # Claude Code global settings
├── ghostty/          # Ghostty terminal config
├── kitty/            # Kitty terminal config
├── nvim/             # Neovim (LazyVim) configuration
│   └── lua/
│       ├── config/   # Core LazyVim config
│       └── plugins/  # Custom plugin configurations
├── .opencode/        # OpenCode plugins
├── tmux/             # Tmux configuration
├── zsh/              # Zsh shell configuration
├── install.sh        # One-command setup script
└── README.md         # Documentation
```

## AI Tooling

### Claude Code
- Settings: `claude/settings.json` → `~/.claude/settings.json`
- Model: opus (default)
- Notifications: Enabled via `bin/ai-notify`
- Aliases: `claudio` (opus), `claude` (sonnet), `claudin` (haiku)

### OpenCode
- Plugins: `.opencode/plugins/` → `~/.opencode/plugins/`
- Notification plugin triggers on session idle

### Avante (Neovim)
- Provider: Kimi (Moonshot AI)
- Launch: `avante` alias opens Neovim in AI mode

### Global Agents
- `agents/rules/` — Global rules for all projects
- `agents/skills/` — Reusable AI capabilities
- `agents/commands/` — Custom AI commands

## Conventions

### Lua (Neovim)
- Use 2 spaces for indentation
- Prefer single quotes for strings
- Use `vim.keymap.set` for keybindings
- Lazy-load plugins when possible

### Shell (Zsh/Bash)
- Use 2 spaces for indentation
- Always quote variables: `"$var"`
- Use `#!/usr/bin/env bash` for bash scripts
- Prefer `[[ ]]` over `[ ]` for conditionals

### Git
- Use conventional commits format
- `feat:` New feature
- `fix:` Bug fix
- `docs:` Documentation
- `refactor:` Restructuring
- `chore:` Maintenance

## Important Notes

- `lazy-lock.json` should be committed for reproducible builds
- `install.sh` creates symlinks, not copies
- Backups are automatically created with timestamps
- AI notification system requires macOS osascript

## Dependencies

Managed by `install.sh`:
- Homebrew
- Neovim (>= 0.9)
- Tmux (>= 3.2)
- Git
- Node.js (via nvm)
- Rust (optional)
- Nerd Font (JetBrains Mono)
- Modern CLI tools: fzf, zoxide, eza, bat, ripgrep, fd, lazygit