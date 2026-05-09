# ============================================
# Zsh Configuration
# ============================================

# --------------------------------------------
# Oh My Zsh
# --------------------------------------------

# Path to Oh My Zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme
ZSH_THEME=""

# Plugins
plugins=(
  git
  z
  fzf
  zsh-autosuggestions
  zsh-syntax-highlighting
  nvm
  docker
  docker-compose
  terraform
  golang
  rust
  npm
  yarn
  node
  python
  pip
  brew
  macos
  colored-man-pages
  command-not-found
  extract
  copypath
  copyfile
  copybuffer
  dirhistory
  history
  sudo
  web-search
  encode64
  urltools
)

# Source Oh My Zsh
source $ZSH/oh-my-zsh.sh

# --------------------------------------------
# Environment Variables
# --------------------------------------------

# Editor
export EDITOR='nvim'
export VISUAL='nvim'

# Terminal
export TERMINAL='kitty'

# Language
export LANG='en_US.UTF-8'
export LC_ALL='en_US.UTF-8'

# Paths
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# Go
export GOPATH="$HOME/go"
export PATH="$GOPATH/bin:$PATH"

# Python
export PATH="$HOME/.pyenv/shims:$PATH"

# Node
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# FZF
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border --preview "bat --color=always --style=numbers --line-range=:500 {}"'
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'

# Bat
export BAT_THEME='Dracula'

# Eza
export EZA_COLORS='da=1;34:di=1;36:ex=1;32:fi=0:ln=1;35:or=1;31:pi=1;33:so=1;32:bd=1;33:cd=1;33:su=0:sg=0:tw=0:ow=0'

# Zoxide
export _ZO_ECHO=1

# --------------------------------------------
# Aliases
# --------------------------------------------

# General
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'
alias -='cd -'

# File operations
alias ls='eza --icons --group-directories-first'
alias l='eza --icons --group-directories-first -lah'
alias la='eza --icons --group-directories-first -a'
alias ll='eza --icons --group-directories-first -l'
alias lla='eza --icons --group-directories-first -la'
alias lt='eza --icons --tree --level=2'
alias lta='eza --icons --tree --level=2 -a'
alias ltl='eza --icons --tree --level=3'

# Cat alternatives
alias cat='bat --paging=never'
alias c='bat --paging=never'

# Find alternatives
alias f='fd'
alias find='fd'

# Grep alternatives
alias grep='rg'
alias g='rg'

# Vim
alias v='nvim'
alias vi='nvim'
alias vim='nvim'
alias sv='sudo nvim'

# Tmux
alias tm='tmux'
alias tma='tmux attach'
alias tmat='tmux attach -t'
alias tmls='tmux ls'
alias tmn='tmux new -s'
alias tmk='tmux kill-session -t'

# Git
alias g='git'
alias gs='git status'
alias ga='git add'
alias gaa='git add --all'
alias gc='git commit'
alias gcm='git commit -m'
alias gca='git commit --amend'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbd='git branch -d'
alias gbl='git branch -a'
alias gd='git diff'
alias gds='git diff --staged'
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias gp='git push'
alias gpf='git push --force-with-lease'
alias gpl='git pull'
alias gf='git fetch'
alias gfa='git fetch --all'
alias gst='git stash'
alias gsta='git stash apply'
alias gsp='git stash pop'
alias gsd='git stash drop'
alias grb='git rebase'
alias grbi='git rebase -i'
alias grbc='git rebase --continue'
alias grba='git rebase --abort'
alias grm='git remote'
alias grmv='git remote -v'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'

# Docker
alias d='docker'
alias dc='docker-compose'
alias dps='docker ps'
alias dpa='docker ps -a'
alias di='docker images'
alias dr='docker run'
alias dex='docker exec -it'
alias dst='docker stop'
alias drm='docker rm'
alias drmi='docker rmi'
alias dl='docker logs'
alias dlf='docker logs -f'

# Kubernetes
alias k='kubectl'
alias kg='kubectl get'
alias kd='kubectl describe'
alias kgp='kubectl get pods'
alias kgs='kubectl get svc'
alias kgd='kubectl get deployments'
alias kl='kubectl logs'
alias klf='kubectl logs -f'
alias kx='kubectl exec -it'
alias ka='kubectl apply -f'

# System
alias top='btm'
alias htop='btm'
alias df='df -h'
alias du='du -h'
alias free='free -h'
alias ps='procs'

# Network
alias ports='netstat -tulanp'
alias ip='ipconfig getifaddr en0'
alias localip='ipconfig getifaddr en0'
alias publicip='curl -s ifconfig.me'

# macOS
alias flushdns='sudo dscacheutil -flushcache; sudo killall -HUP mDNSResponder'
alias showhidden='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
alias hidehidden='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

# Development
alias serve='python3 -m http.server'
alias r='cargo run'
alias b='cargo build'
alias t='cargo test'
alias y='yarn'
alias ys='yarn start'
alias yd='yarn dev'
alias yb='yarn build'
alias yi='yarn install'
alias ni='npm install'
alias nrd='npm run dev'
alias nrs='npm run start'
alias nrb='npm run build'

# Lazygit
alias lg='lazygit'

# --------------------------------------------
# Functions
# --------------------------------------------

# Create directory and cd into it
function mkcd() {
  mkdir -p "$1" && cd "$_"
}

# Fuzzy kill process
function fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ -n "$pid" ]; then
    echo "$pid" | xargs kill -9
  fi
}

# Fuzzy checkout git branch
function fbr() {
  local branches branch
  branches=$(git for-each-ref --count=30 --sort=-committerdate refs/heads/ --format="%(refname:short)") &&
  branch=$(echo "$branches" | fzf -d $((2 + $(wc -l <<< "$branches"))) +m) &&
  git checkout "$branch"
}

# Fuzzy git log browser
function fco() {
  git log --oneline --decorate --graph --all | fzf --ansi --no-sort --reverse --tiebreak=index | sed 's/^[*| \\/]*//' | awk '{print $1}' | xargs -I {} git show {}
}

# Fuzzy find files and open in nvim
function fv() {
  local files
  IFS=$'\n' files=($(fzf --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && nvim "${files[@]}"
}

# Extract any archive
function extract() {
  if [ -f "$1" ]; then
    case "$1" in
      *.tar.bz2)   tar xjf "$1"    ;;
      *.tar.gz)    tar xzf "$1"    ;;
      *.bz2)       bunzip2 "$1"    ;;
      *.rar)       unrar x "$1"    ;;
      *.gz)        gunzip "$1"     ;;
      *.tar)       tar xf "$1"     ;;
      *.tbz2)      tar xjf "$1"    ;;
      *.tgz)       tar xzf "$1"    ;;
      *.zip)       unzip "$1"      ;;
      *.Z)         uncompress "$1" ;;
      *.7z)        7z x "$1"       ;;
      *.deb)       ar x "$1"       ;;
      *.tar.xz)    tar xf "$1"     ;;
      *.tar.zst)   unzstd "$1"     ;;
      *)           echo "'\$1' cannot be extracted via extract()" ;;
    esac
  else
    echo "'\$1' is not a valid file"
  fi
}

# Get colors in manual pages
function man() {
  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
    man "$@"
}

# Weather
function weather() {
  local city="${1:-London}"
  curl -s "wttr.in/${city}?format=3"
}

# Copy with progress
function cpv() {
  rsync -ah --info=progress2 "$@"
}

# --------------------------------------------
# Modern CLI Tools Integration
# --------------------------------------------

# Zoxide (smart cd)
eval "$(zoxide init zsh)"
alias cd='z'

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Autojump fallback
# [ -f /usr/local/etc/profile.d/autojump.sh ] && source /usr/local/etc/profile.d/autojump.sh

# Pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

# SDKMAN
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$SDKMAN_DIR/bin/sdkman-init.sh" ]] && source "$SDKMAN_DIR/bin/sdkman-init.sh"

# --------------------------------------------
# Completion
# --------------------------------------------

# Load completions
autoload -Uz compinit && compinit

# Case insensitive completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Colorful completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# Menu selection
zstyle ':completion:*' menu select

# Group completions
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%B%d%b'

# --------------------------------------------
# History
# --------------------------------------------

HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history

# Share history between sessions
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt HIST_VERIFY

# --------------------------------------------
# Key Bindings
# --------------------------------------------

# Vim mode
bindkey -v

# Reduce delay for vi mode
export KEYTIMEOUT=1

# Better history search
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Edit command in editor
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# --------------------------------------------
# Misc
# --------------------------------------------

# Disable Ctrl-S/Ctrl-Q
stty stop undef
stty start undef

# Enable colors
export CLICOLOR=1
export LSCOLORS=ExFxBxDxCxegedabagacad

# Less options
export LESS='-R --use-color -Dd+r$Du+b$'

# Man pages with bat
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# GPG
export GPG_TTY=$(tty)

# Load local config if exists
[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local

# --------------------------------------------
# AI Tools Aliases
# --------------------------------------------

# Claude Code aliases with cost tracking
function claudio() {
  ~/bin/claude-cost-tracker start opus
  claude --model opus "$@"
  local exit_code=$?
  ~/bin/claude-cost-tracker stop
  return $exit_code
}

function claude() {
  ~/bin/claude-cost-tracker start sonnet
  command claude --model sonnet "$@"
  local exit_code=$?
  ~/bin/claude-cost-tracker stop
  return $exit_code
}

function claudin() {
  ~/bin/claude-cost-tracker start haiku
  claude --model haiku "$@"
  local exit_code=$?
  ~/bin/claude-cost-tracker stop
  return $exit_code
}

# Quick cost check
alias claude-cost='~/bin/claude-cost-tracker total'
alias claude-status='~/bin/claude-cost-tracker status'

# Avante (Neovim AI)
alias avante='NVIM_AVANTE_MODE=1 nvim -c "lua vim.defer_fn(function() require(\"avante.api\").zen_mode() end, 100)"'

# OpenCode
export PATH="$HOME/.opencode/bin:$PATH"

# --------------------------------------------
# Utility Functions
# --------------------------------------------

# Create directory and file in one command
function mktouch() {
  mkdir -p $(dirname "$1") && touch "$1"
}

# Remove all Neovim swap files
function clean-swap() {
  rm -rf ~/.local/state/nvim/swap/**/*.swp
}

# Delete all git branches except main
function clean-branches() {
  git branch | grep -v 'main' | xargs git branch -D
}

# Kill processes on specified ports
function kill-ports() {
  for port in "$@"; do
    lsof -ti:$port | xargs kill -9 2>/dev/null
  done
}

# Quick git add, commit with *, and push
function commit-sync() {
  git add . && git commit -m "*" && git push
}

# Commit changelog with proper prefix
function commit-changelog() {
  prefix=$([ -n "$1" ] && echo "docs($1):" || echo "docs:")
  git commit -m "$prefix updated CHANGELOG.md"
}

# --------------------------------------------
# Starship Prompt
# --------------------------------------------

eval "$(starship init zsh)"
