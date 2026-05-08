# Personal Dotfiles

> A modern, refined terminal environment optimized for macOS development.

![License](https://img.shields.io/badge/license-MIT-blue.svg)
![macOS](https://img.shields.io/badge/macOS-supported-brightgreen.svg)
![Neovim](https://img.shields.io/badge/Neovim-0.9+-green.svg)

## ✨ Features

- **Neovim** with [LazyVim](https://www.lazyvim.org/) distribution
  - Tokyo Night Storm theme
  - Full LSP support for JavaScript, TypeScript, Python, Rust, Go, CSS, HTML, and more
  - Custom code snippets for JS/TS, Python, and Rust
  - Fuzzy file finding with Telescope + fzf-native
  - Beautiful UI with Bufferline, Lualine, and Dashboard
  - Git integration with Gitsigns and Diffview
  - Debugging with DAP
  
- **Tmux** with modern configuration
  - Tokyo Night themed status bar
  - TPM plugin manager
  - Session persistence with resurrect + continuum
  - Vim-style navigation
  - Mouse support
  
- **Zsh + Oh My Zsh**
  - Powerlevel10k prompt with Tokyo Night colors
  - Modern CLI tools: fzf, zoxide, eza, bat, ripgrep, fd, lazygit
  - Comprehensive aliases and functions
  - Syntax highlighting and autosuggestions
  
- **Terminal Configs**
  - Ghostty configuration
  - Kitty configuration
  - Both with Tokyo Night theme and JetBrains Mono Nerd Font

## 📸 Preview

*Screenshots coming soon*

## 🚀 Quick Start

### One-line Install

```bash
git clone https://github.com/mmartinsoliv/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

### Manual Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/mmartinsoliv/dotfiles.git ~/.dotfiles
   cd ~/.dotfiles
   ```

2. **Install dependencies**
   ```bash
   # The install script handles everything, but if you prefer manual:
   brew install neovim tmux zsh fzf zoxide eza bat ripgrep fd lazygit btop
   ```

3. **Create symlinks**
   ```bash
   ln -s ~/.dotfiles/nvim ~/.config/nvim
   ln -s ~/.dotfiles/tmux/tmux.conf ~/.config/tmux/tmux.conf
   ln -s ~/.dotfiles/zsh/.zshrc ~/.zshrc
   ln -s ~/.dotfiles/zsh/.zprofile ~/.zprofile
   ln -s ~/.dotfiles/zsh/.p10k.zsh ~/.p10k.zsh
   ln -s ~/.dotfiles/kitty ~/.config/kitty
   ln -s ~/.dotfiles/ghostty ~/.config/ghostty
   ```

4. **Install Tmux plugins**
   ```bash
   # Inside tmux, press Prefix + I
   ```

5. **Open Neovim and install plugins**
   ```bash
   nvim
   # Lazy.nvim will automatically install plugins on first run
   ```

## 📁 Structure

```
.
├── .agents/           # AI assistant context & rules
├── bin/               # Custom helper scripts
├── ghostty/           # Ghostty terminal config
│   └── config
├── kitty/             # Kitty terminal config
│   └── kitty.conf
├── nvim/              # Neovim configuration (LazyVim)
│   ├── init.lua
│   └── lua/
│       ├── config/    # Core config (options, keymaps, autocmds)
│       └── plugins/   # Plugin configurations
│           ├── colorscheme.lua
│           ├── ui.lua
│           ├── lsp.lua
│           ├── finder.lua
│           ├── snippets.lua
│           └── extras.lua
├── tmux/              # Tmux configuration
│   └── tmux.conf
├── zsh/               # Zsh configuration
│   ├── .zshrc
│   ├── .zprofile
│   └── .p10k.zsh
├── .editorconfig
├── .gitignore
├── install.sh         # Automated installation script
└── README.md
```

## ⌨️ Key Bindings

### Neovim (Leader: `Space`)

| Key | Action |
|-----|--------|
| `<leader>e` | Toggle file explorer (Neo-tree) |
| `<leader>ff` | Find files |
| `<leader>fg` | Live grep |
| `<leader>,` | Switch buffer |
| `<leader>xx` | Toggle diagnostics (Trouble) |
| `<leader>tt` | Toggle terminal |
| `<leader>gd` | Git diffview |
| `gd` | Go to definition |
| `gr` | Go to references |
| `K` | Hover documentation |

### Tmux (Prefix: `Ctrl + a`)

| Key | Action |
|-----|--------|
| `Prefix + \|` | Split vertically |
| `Prefix + -` | Split horizontally |
| `Prefix + h/j/k/l` | Navigate panes |
| `Prefix + H/J/K/L` | Resize panes |
| `Prefix + c` | New window |
| `Prefix + n/p` | Next/previous window |
| `Prefix + z` | Zoom pane |
| `Prefix + r` | Reload config |

### Custom Snippets

| Language | Trigger | Description |
|----------|---------|-------------|
| JS/TS | `log` | console.log |
| JS/TS | `rfc` | React functional component |
| JS/TS | `useState` | React useState hook |
| Python | `def` | Function definition |
| Python | `class` | Class definition |
| Rust | `fn` | Function definition |
| Rust | `struct` | Struct definition |
| All | `date` | Current date |

## 🎨 Theme

This dotfiles uses the [Tokyo Night](https://github.com/folke/tokyonight.nvim) color scheme across all components:

- **Neovim**: Tokyo Night Storm
- **Tmux**: Custom Tokyo Night status bar
- **Kitty/Ghostty**: Tokyo Night color palette
- **Zsh/P10k**: Tokyo Night inspired prompt colors

## 🔧 Customization

### Adding Custom Snippets

Create new snippet files in `nvim/lua/snippets/`:

```lua
-- nvim/lua/snippets/mylanguage.lua
local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s('trigger', {
    t('expanded text'),
    i(1, 'placeholder'),
  }),
}
```

### Custom Aliases

Add to `~/.zshrc.local` (not tracked by git):

```bash
alias myalias='mycommand'
```

## 🛠️ Requirements

- macOS (tested on Sonoma)
- [Homebrew](https://brew.sh/)
- [Git](https://git-scm.com/)
- Internet connection for initial setup

## 📦 Included Tools

| Tool | Purpose |
|------|---------|
| [Neovim](https://neovim.io/) | Editor |
| [Tmux](https://github.com/tmux/tmux) | Terminal multiplexer |
| [Zsh](https://www.zsh.org/) | Shell |
| [Oh My Zsh](https://ohmyz.sh/) | Zsh framework |
| [Powerlevel10k](https://github.com/romkatv/powerlevel10k) | Prompt theme |
| [fzf](https://github.com/junegunn/fzf) | Fuzzy finder |
| [zoxide](https://github.com/ajeetdsouza/zoxide) | Smart cd |
| [eza](https://github.com/eza-community/eza) | Modern ls |
| [bat](https://github.com/sharkdp/bat) | Syntax-highlighting cat |
| [ripgrep](https://github.com/BurntSushi/ripgrep) | Fast grep |
| [fd](https://github.com/sharkdp/fd) | Fast find |
| [lazygit](https://github.com/jesseduffield/lazygit) | Terminal UI for git |
| [btop](https://github.com/aristocratos/btop) | System monitor |

## 📜 License

MIT License - see [LICENSE](LICENSE) file for details.

## 🙏 Credits

- Inspired by [vmarcosp/dotfiles](https://github.com/vmarcosp/dotfiles)
- [LazyVim](https://www.lazyvim.org/) for the excellent Neovim distribution
- [Tokyo Night](https://github.com/folke/tokyonight.nvim) theme by folke

---

<p align="center">
  Made with ❤️ by <a href="https://github.com/mmartinsoliv">mmartinsoliv</a>
</p>
