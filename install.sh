#!/usr/bin/env bash

# ============================================
# Dotfiles Installation Script
# ============================================

set -euo pipefail

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Script directory
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
BACKUP_DIR="$HOME/.dotfiles_backup/$(date +%Y%m%d_%H%M%S)"

# --------------------------------------------
# Helper Functions
# --------------------------------------------

print_header() {
  echo -e "${PURPLE}"
  echo "███╗   ███╗ █████╗ ██████╗ ████████╗██╗███╗   ██╗███████╗"
  echo "████╗ ████║██╔══██╗██╔══██╗╚══██╔══╝██║████╗  ██║██╔════╝"
  echo "██╔████╔██║███████║██████╔╝   ██║   ██║██╔██╗ ██║███████╗"
  echo "██║╚██╔╝██║██╔══██║██╔══██╗   ██║   ██║██║╚██╗██║╚════██║"
  echo "██║ ╚═╝ ██║██║  ██║██║  ██║   ██║   ██║██║ ╚████║███████║"
  echo "╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝╚═╝  ╚═══╝╚══════╝"
  echo -e "${NC}"
  echo -e "${CYAN}Dotfiles Installer${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
}

info() {
  echo -e "${BLUE}ℹ${NC} $1"
}

success() {
  echo -e "${GREEN}✔${NC} $1"
}

warn() {
  echo -e "${YELLOW}⚠${NC} $1"
}

error() {
  echo -e "${RED}✖${NC} $1"
}

print_section() {
  echo ""
  echo -e "${PURPLE}▶ $1${NC}"
  echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
}

# --------------------------------------------
# OS Detection
# --------------------------------------------

detect_os() {
  if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
  elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
  else
    error "Unsupported OS: $OSTYPE"
    exit 1
  fi
  info "Detected OS: $OS"
}

# --------------------------------------------
# Backup
# --------------------------------------------

backup_file() {
  local file="$1"
  if [[ -e "$file" && ! -L "$file" ]]; then
    mkdir -p "$BACKUP_DIR"
    cp -r "$file" "$BACKUP_DIR/"
    info "Backed up: $file"
  fi
}

# --------------------------------------------
# Symlink
# --------------------------------------------

symlink() {
  local src="$1"
  local dst="$2"

  if [[ -L "$dst" ]]; then
    rm "$dst"
    info "Removed existing symlink: $dst"
  fi

  if [[ -e "$dst" ]]; then
    backup_file "$dst"
    rm -rf "$dst"
  fi

  ln -s "$src" "$dst"
  success "Linked: $dst -> $src"
}

# --------------------------------------------
# Homebrew
# --------------------------------------------

install_homebrew() {
  print_section "Installing Homebrew"

  if command -v brew &>/dev/null; then
    success "Homebrew already installed"
    return
  fi

  info "Installing Homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  if [[ "$OS" == "macos" ]]; then
    if [[ -f /opt/homebrew/bin/brew ]]; then
      eval "$(/opt/homebrew/bin/brew shellenv)"
    elif [[ -f /usr/local/bin/brew ]]; then
      eval "$(/usr/local/bin/brew shellenv)"
    fi
  fi

  success "Homebrew installed"
}

# --------------------------------------------
# Dependencies
# --------------------------------------------

install_dependencies() {
  print_section "Installing Dependencies"

  local packages=(
    # Core
    git
    curl
    wget
    neovim
    tmux
    zsh

    # Modern CLI tools
    fzf
    zoxide
    eza
    bat
    ripgrep
    fd
    lazygit
    starship
    btop
    procs

    # Development
    node
    nvm
    yarn
    python@3.11
    pyenv
    rust
    go
    cargo

    # Fonts
    font-jetbrains-mono-nerd-font

    # Additional
    stow
    tree
    jq
    yq
    httpie
    tig
    gh
  )

  info "Installing packages with Homebrew..."
  for package in "${packages[@]}"; do
    if brew list "$package" &>/dev/null; then
      info "$package already installed"
    else
      info "Installing $package..."
      brew install "$package" || warn "Failed to install $package"
    fi
  done

  success "Dependencies installed"
}

# --------------------------------------------
# Oh My Zsh
# --------------------------------------------

install_ohmyzsh() {
  print_section "Installing Oh My Zsh"

  if [[ -d "$HOME/.oh-my-zsh" ]]; then
    success "Oh My Zsh already installed"
  else
    info "Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    success "Oh My Zsh installed"
  fi

  # Install Powerlevel10k theme
  if [[ -d "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k" ]]; then
    success "Powerlevel10k already installed"
  else
    info "Installing Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
    success "Powerlevel10k installed"
  fi

  # Install plugins
  local plugins_dir="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins"

  # zsh-autosuggestions
  if [[ -d "$plugins_dir/zsh-autosuggestions" ]]; then
    success "zsh-autosuggestions already installed"
  else
    info "Installing zsh-autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions "$plugins_dir/zsh-autosuggestions"
    success "zsh-autosuggestions installed"
  fi

  # zsh-syntax-highlighting
  if [[ -d "$plugins_dir/zsh-syntax-highlighting" ]]; then
    success "zsh-syntax-highlighting already installed"
  else
    info "Installing zsh-syntax-highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting "$plugins_dir/zsh-syntax-highlighting"
    success "zsh-syntax-highlighting installed"
  fi
}

# --------------------------------------------
# Tmux Plugin Manager
# --------------------------------------------

install_tpm() {
  print_section "Installing Tmux Plugin Manager"

  if [[ -d "$HOME/.tmux/plugins/tpm" ]]; then
    success "TPM already installed"
  else
    info "Installing TPM..."
    git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"
    success "TPM installed"
  fi
}

# --------------------------------------------
# Node.js (via nvm)
# --------------------------------------------

install_nvm() {
  print_section "Installing NVM (Node Version Manager)"

  if [[ -d "$HOME/.nvm" ]]; then
    success "NVM already installed"
  else
    info "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    export NVM_DIR="$HOME/.nvm"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    success "NVM installed"
  fi

  # Install latest LTS Node
  info "Installing latest LTS Node.js..."
  nvm install --lts
  nvm use --lts
  nvm alias default lts/*
  success "Node.js $(node --version) installed"

  # Install global npm packages
  info "Installing global npm packages..."
  npm install -g typescript ts-node @types/node eslint prettier
  success "Global npm packages installed"
}

# --------------------------------------------
# Rust
# --------------------------------------------

install_rust() {
  print_section "Installing Rust"

  if command -v rustc &>/dev/null; then
    success "Rust already installed: $(rustc --version)"
  else
    info "Installing Rust..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
    source "$HOME/.cargo/env"
    success "Rust installed"
  fi

  # Install rust-analyzer
  if command -v rust-analyzer &>/dev/null; then
    success "rust-analyzer already installed"
  else
    info "Installing rust-analyzer..."
    rustup component add rust-analyzer
    success "rust-analyzer installed"
  fi
}

# --------------------------------------------
# Dotfiles
# --------------------------------------------

install_dotfiles() {
  print_section "Installing Dotfiles"

  # Create config directories
  mkdir -p "$HOME/.config"
  mkdir -p "$HOME/.config/tmux"

  # Neovim
  symlink "$DOTFILES_DIR/nvim" "$HOME/.config/nvim"

  # Tmux
  symlink "$DOTFILES_DIR/tmux/tmux.conf" "$HOME/.config/tmux/tmux.conf"

  # Zsh
  symlink "$DOTFILES_DIR/zsh/.zshrc" "$HOME/.zshrc"
  symlink "$DOTFILES_DIR/zsh/.zprofile" "$HOME/.zprofile"
  # Terminals
  symlink "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
  symlink "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"

  # Starship
  symlink "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"

  # Git
  if [[ -f "$DOTFILES_DIR/.gitconfig" ]]; then
    symlink "$DOTFILES_DIR/.gitconfig" "$HOME/.gitconfig"
  fi

  # EditorConfig
  if [[ -f "$DOTFILES_DIR/.editorconfig" ]]; then
    symlink "$DOTFILES_DIR/.editorconfig" "$HOME/.editorconfig"
  fi

  # Claude Code settings
  if [[ -f "$DOTFILES_DIR/claude/settings.json" ]]; then
    mkdir -p "$HOME/.claude"
    symlink "$DOTFILES_DIR/claude/settings.json" "$HOME/.claude/settings.json"
  fi

  # AI Agents (global)
  if [[ -d "$DOTFILES_DIR/agents" ]]; then
    mkdir -p "$HOME/.claude"
    symlink "$DOTFILES_DIR/agents/rules" "$HOME/.claude/rules"
    symlink "$DOTFILES_DIR/agents/skills" "$HOME/.claude/skills"
    symlink "$DOTFILES_DIR/agents/commands" "$HOME/.claude/commands"
  fi

  # OpenCode plugins
  if [[ -d "$DOTFILES_DIR/.opencode/plugins" ]]; then
    mkdir -p "$HOME/.opencode"
    symlink "$DOTFILES_DIR/.opencode/plugins" "$HOME/.opencode/plugins"
  fi

  # Bin scripts
  if [[ -d "$DOTFILES_DIR/bin" ]]; then
    mkdir -p "$HOME/bin"
    for script in "$DOTFILES_DIR/bin/"*; do
      if [[ -f "$script" ]]; then
        local script_name=$(basename "$script")
        symlink "$script" "$HOME/bin/$script_name"
      fi
    done
  fi

  success "Dotfiles installed"
}

# --------------------------------------------
# Tmux Plugins
# --------------------------------------------

install_tmux_plugins() {
  print_section "Installing Tmux Plugins"

  info "Installing tmux plugins..."
  "$HOME/.tmux/plugins/tpm/bin/install_plugins" || true
  success "Tmux plugins installed"
}

# --------------------------------------------
# Change Shell
# --------------------------------------------

change_shell() {
  print_section "Changing Default Shell"

  local zsh_path
  zsh_path=$(command -v zsh)

  if [[ "$SHELL" == "$zsh_path" ]]; then
    success "Already using Zsh"
    return
  fi

  if grep -q "$zsh_path" /etc/shells; then
    info "Changing shell to Zsh..."
    chsh -s "$zsh_path"
    success "Shell changed to Zsh"
  else
    warn "$zsh_path not in /etc/shells. Adding it..."
    echo "$zsh_path" | sudo tee -a /etc/shells
    chsh -s "$zsh_path"
    success "Shell changed to Zsh"
  fi
}

# --------------------------------------------
# Neovim Bootstrap
# --------------------------------------------

bootstrap_neovim() {
  print_section "Bootstrapping Neovim"

  info "Installing Neovim plugins..."
  nvim --headless -c 'Lazy! sync' -c 'qa' || warn "Neovim bootstrap may need manual completion"
  success "Neovim plugins installed"
}

# --------------------------------------------
# Summary
# --------------------------------------------

print_summary() {
  echo ""
  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo -e "${GREEN}  Dotfiles Installation Complete!${NC}"
  echo -e "${GREEN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
  echo ""
  echo -e "${CYAN}What's installed:${NC}"
  echo "  • Neovim (LazyVim) with Tokyo Night theme"
  echo "  • Tmux with plugins (resurrect, continuum, yank)"
  echo "  • Zsh + Oh My Zsh + Starship (Cyberpunk prompt)"
  echo "  • Modern CLI tools (fzf, zoxide, eza, bat, etc.)"
  echo "  • Development environments (Node, Python, Rust, Go)"
  echo ""
  echo -e "${CYAN}Next steps:${NC}"
  echo "  1. Restart your terminal or run: source ~/.zshrc"
  echo "  2. Start tmux: tmux"
  echo "  3. Open Neovim: nvim"
  echo "  4. Install Tmux plugins: Prefix + I (inside tmux)"
  echo "  5. Configure Powerlevel10k: p10k configure (optional)"
  echo ""
  echo -e "${CYAN}Key bindings:${NC}"
  echo "  • Tmux prefix: Ctrl + a"
  echo "  • Neovim leader: Space"
  echo ""
  echo -e "${CYAN}Backup location:${NC} $BACKUP_DIR"
  echo ""
  echo -e "${YELLOW}Note: Some changes may require a system restart.${NC}"
  echo ""
}

# --------------------------------------------
# Main
# --------------------------------------------

main() {
  print_header
  detect_os

  # Install Homebrew
  install_homebrew

  # Install dependencies
  install_dependencies

  # Install Oh My Zsh
  install_ohmyzsh

  # Install TPM
  install_tpm

  # Install NVM and Node
  install_nvm

  # Install Rust
  install_rust

  # Install dotfiles
  install_dotfiles

  # Install tmux plugins
  install_tmux_plugins

  # Change shell
  change_shell

  # Bootstrap Neovim
  bootstrap_neovim

  # Print summary
  print_summary
}

# Run main function
main "$@"
