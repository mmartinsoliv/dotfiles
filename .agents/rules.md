# Coding Rules & Standards

## General Principles

1. **Minimal Changes**: Make the smallest possible change to achieve the goal
2. **Consistency**: Follow existing patterns in the codebase
3. **Documentation**: Update docs when changing behavior
4. **Testing**: Verify changes work before committing

## Neovim Configuration Rules

### Lua Style
- Indent: 2 spaces (no tabs)
- Max line length: 100 characters
- Use single quotes for strings: `'string'`
- Trailing commas in multi-line tables
- Space after commas and around operators

### Keybindings
- Use `vim.keymap.set` not `vim.api.nvim_set_keymap`
- Format: `vim.keymap.set('mode', 'lhs', rhs, { desc = 'Description' })`
- Group related keybindings with comments
- Leader key: `<Space>`
- Local leader: `<Space>l`

### Plugin Configuration
- Lazy-load all non-essential plugins
- Use `event`, `cmd`, `ft`, or `keys` for lazy-loading
- Keep plugin specs in `lua/plugins/` directory
- One plugin per file (or closely related plugins)
- Add `enabled = false` to disable, don't delete files

### LSP Configuration
- Use `nvim-lspconfig` for server setup
- Format on save enabled
- Use `null-ls` or `conform.nvim` for formatting
- Diagnostic signs: `Error`, `Warn`, `Info`, `Hint`

## Shell Script Rules

### Style
- Indent: 2 spaces
- Quote all variables: `"$var"`
- Use `local` for function variables
- Exit on error: `set -euo pipefail`

### Functions
- Use lowercase with underscores: `function_name()`
- Add brief comment before function
- Return 0 for success, 1 for failure

### User Interaction
- Always ask before destructive operations
- Provide clear progress messages
- Color code output: green for success, red for errors, yellow for warnings

## Tmux Configuration Rules

### Bindings
- Comment each binding with its purpose
- Use `-n` for prefix-less bindings sparingly
- Keep window/pane navigation consistent with Vim

### Settings
- Group by category: general, display, bindings, plugins
- Use descriptive comments for non-obvious settings

## Git Conventions

### Commits
- Use conventional commits format
- Keep first line under 50 characters
- Add body for complex changes
- Reference issues when applicable

### Branches
- `main`: production-ready configs
- `feature/*`: new features or plugins
- `fix/*`: bug fixes
- `experiment/*`: experimental changes

## Forbidden Practices

1. Never commit secrets or API keys
2. Never hardcode user-specific paths
3. Never break existing keybindings without migration path
4. Never remove plugins without deprecation period
5. Never commit broken configurations
6. Don't modify `lazy-lock.json` manually
7. Don't use `sudo` in scripts without explicit user consent

## Testing Requirements

Before any PR or commit:
1. Run `install.sh` in a clean environment
2. Verify all symlinks are correct
3. Test Neovim startup: `nvim --headless +q`
4. Test Tmux config: `tmux source-file ~/.config/tmux/tmux.conf`
5. Test Zsh config: `zsh -n ~/.zshrc`
6. Verify all custom functions work
7. Check for syntax errors in all config files
