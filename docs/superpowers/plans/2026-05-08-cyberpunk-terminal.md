# Cyberpunk Terminal Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Substituir o visual atual (Tokyo Night + Powerlevel10k) por uma estética Cyberpunk 2077 com Starship e prompt hacker multi-linha.

**Architecture:** Starship substituí o Powerlevel10k como engine de prompt; o `starship/starship.toml` fica no dotfiles e é symlinked para `~/.config/starship.toml`. O `kitty.conf` recebe a paleta Cyberpunk 2077 (bg `#0a0a0a`, yellow `#fcee0a`, cyan `#00cfff`, red `#ff2f6e`). O `.zshrc` remove p10k e inicializa Starship.

**Tech Stack:** Starship (Rust), Kitty, Zsh + Oh My Zsh, JetBrainsMono Nerd Font (mantida)

---

### Task 1: Instalar Starship

**Files:**
- Sem alteração de arquivo nesta etapa

- [ ] **Step 1: Instalar via Homebrew**

```bash
brew install starship
```

- [ ] **Step 2: Verificar instalação**

```bash
starship --version
```

Expected: `starship 1.x.x`

- [ ] **Step 3: Criar diretório starship no dotfiles**

```bash
mkdir -p /Users/matheus.martins/Documents/personal/dotfiles/starship
```

---

### Task 2: Criar starship/starship.toml

**Files:**
- Create: `starship/starship.toml`

- [ ] **Step 1: Criar o arquivo com o prompt hacker multi-linha**

Conteúdo completo de `starship/starship.toml`:

```toml
"$schema" = 'https://starship.rs/config-schema.json'

add_newline = true

format = """
$time$cmd_duration
[┌─\\[](fg:#555555)$username$hostname[\\]─\\[](fg:#555555)$directory[\\]](fg:#555555)
[├─](fg:#555555)$git_branch$git_status$nodejs$rust$golang$python$docker_context
[└─](fg:#555555)$character
"""

[username]
show_always = true
format = "[$user](bold fg:#fcee0a)"

[hostname]
ssh_only = false
trim_at = "."
format = "[@](fg:#555555)[$hostname](fg:#00cfff)"

[directory]
format = "[$path](fg:#fcee0a)[$read_only](fg:#ff2f6e)"
truncation_length = 3
truncate_to_repo = true
read_only = " 󰌾"

[character]
success_symbol = "[❯](bold fg:#00cfff)"
error_symbol = "[❯](bold fg:#ff2f6e)"
vimcmd_symbol = "[❯](bold fg:#fcee0a)"

[git_branch]
format = "[\\[ $branch](fg:#ff2f6e)"
symbol = ""
truncation_length = 25

[git_status]
format = "[$all_status$ahead_behind\\]](fg:#ff2f6e)"
conflicted = "✖"
ahead = "↑${count}"
behind = "↓${count}"
diverged = "⇕"
untracked = ""
stashed = "≡"
modified = "✗${count}"
staged = "✔${count}"
renamed = "»"
deleted = "✘${count}"

[nodejs]
format = "[─\\[ $version\\]](fg:#00cfff)"
symbol = " "
detect_files = ["package.json", ".node-version", ".nvmrc"]

[rust]
format = "[─\\[ $version\\]](fg:#00cfff)"
symbol = ""

[golang]
format = "[─\\[ $version\\]](fg:#00cfff)"
symbol = ""

[python]
format = "[─\\[ $version\\]](fg:#00cfff)"
symbol = " "

[docker_context]
format = "[─\\[  $context\\]](fg:#00cfff)"
symbol = ""
only_with_files = true

[time]
disabled = false
format = "[$time](fg:#555555)"
time_format = "%H:%M:%S"

[cmd_duration]
min_time = 2_000
format = "[  took $duration](fg:#fcee0a)"

[line_break]
disabled = true
```

- [ ] **Step 2: Criar symlink para ~/.config/starship.toml**

```bash
mkdir -p ~/.config
ln -sf /Users/matheus.martins/Documents/personal/dotfiles/starship/starship.toml ~/.config/starship.toml
```

- [ ] **Step 3: Verificar que o symlink está correto**

```bash
ls -la ~/.config/starship.toml
```

Expected: `~/.config/starship.toml -> .../dotfiles/starship/starship.toml`

- [ ] **Step 4: Commit**

```bash
git add starship/starship.toml
git commit -m "feat: add starship hacker cyberpunk prompt config"
```

---

### Task 3: Atualizar kitty/kitty.conf

**Files:**
- Modify: `kitty/kitty.conf` (seção de cores, cursor e tabs)

- [ ] **Step 1: Substituir cursor colors**

Em `kitty/kitty.conf`, localizar e substituir:
```
cursor #c0caf5
cursor_text_color #1a1b26
```
Por:
```
cursor #fcee0a
cursor_text_color #0a0a0a
```

- [ ] **Step 2: Substituir toda a seção de cores**

Localizar o bloco completo (linhas 99–143):
```
# --------------------------------------------
# Colors (Tokyo Night Storm)
# --------------------------------------------

foreground #c0caf5
background #1a1b26
background_opacity 1.0
background_image none
dynamic_background_opacity no

# Selection
selection_foreground none
selection_background #283457

# Color scheme
# Black
color0  #15161e
color8  #414868

# Red
color1  #f7768e
color9  #f7768e

# Green
color2  #9ece6a
color10 #9ece6a

# Yellow
color3  #e0af68
color11 #e0af68

# Blue
color4  #7aa2f7
color12 #7aa2f7

# Magenta
color5  #bb9af7
color13 #bb9af7

# Cyan
color6  #7dcfff
color14 #7dcfff

# White
color7  #a9b1d6
color15 #c0caf5

# URL
url_color #73daca
url_style curly
```

Substituir por:
```
# --------------------------------------------
# Colors (Cyberpunk 2077)
# --------------------------------------------

foreground #e0e0e0
background #0a0a0a
background_opacity 1.0
background_image none
dynamic_background_opacity no

# Selection
selection_foreground none
selection_background #1a1a1a

# Color scheme
# Black
color0  #0a0a0a
color8  #1a1a1a

# Red
color1  #ff2f6e
color9  #ff2f6e

# Green
color2  #00ff88
color10 #00ff88

# Yellow
color3  #fcee0a
color11 #fcee0a

# Blue
color4  #00cfff
color12 #00cfff

# Magenta
color5  #ff007a
color13 #ff007a

# Cyan
color6  #00cfff
color14 #7fdfff

# White
color7  #e0e0e0
color15 #ffffff

# URL
url_color #00cfff
url_style curly
```

- [ ] **Step 3: Substituir tab colors**

Localizar (seção Tabs, após `tab_powerline_style slanted`):
```
active_tab_foreground   #1a1b26
active_tab_background   #7aa2f7
active_tab_font_style   bold
inactive_tab_foreground #a9b1d6
inactive_tab_background #24283b
inactive_tab_font_style normal
tab_bar_background #1a1b26
```

Substituir por:
```
active_tab_foreground   #0a0a0a
active_tab_background   #fcee0a
active_tab_font_style   bold
inactive_tab_foreground #555555
inactive_tab_background #1a1a1a
inactive_tab_font_style normal
tab_bar_background #0a0a0a
```

- [ ] **Step 4: Substituir border colors**

Localizar (seção Window Layout):
```
active_border_color #7aa2f7
inactive_border_color #414868
bell_border_color #e0af68
```

Substituir por:
```
active_border_color #00cfff
inactive_border_color #1a1a1a
bell_border_color #fcee0a
```

- [ ] **Step 5: Recarregar Kitty para verificar**

No Kitty, pressionar `ctrl+shift+f5` (reload config) ou abrir nova janela.
Verificar: fundo preto puro, cursore amarelo, tabs com tema cyberpunk.

- [ ] **Step 6: Commit**

```bash
git add kitty/kitty.conf
git commit -m "feat: apply cyberpunk 2077 color palette to kitty"
```

---

### Task 4: Atualizar zsh/.zshrc

**Files:**
- Modify: `zsh/.zshrc`

- [ ] **Step 1: Trocar ZSH_THEME**

Localizar (linha 13):
```
ZSH_THEME="powerlevel10k/powerlevel10k"
```

Substituir por:
```
ZSH_THEME=""
```

- [ ] **Step 2: Remover bloco Powerlevel10k Configuration**

Localizar e remover o bloco inteiro (linhas 54–62):
```
# --------------------------------------------
# Powerlevel10k Configuration
# --------------------------------------------

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load Powerlevel10k config
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
```

- [ ] **Step 3: Atualizar BAT_THEME**

Localizar (linha 102):
```
export BAT_THEME='tokyonight_storm'
```

Substituir por:
```
export BAT_THEME='Dracula'
```

- [ ] **Step 4: Adicionar inicialização do Starship ao final do arquivo**

Localizar a última linha do arquivo:
```
[[ ! -f ~/.zshrc.local ]] || source ~/.zshrc.local
```

Adicionar após ela:
```

# --------------------------------------------
# Starship Prompt
# --------------------------------------------

eval "$(starship init zsh)"
```

- [ ] **Step 5: Recarregar e verificar**

```bash
source ~/.zshrc
```

Verificar: prompt hacker multi-linha aparece com cores cyberpunk. Se der erro, verificar que `starship` está no PATH com `which starship`.

- [ ] **Step 6: Commit**

```bash
git add zsh/.zshrc
git commit -m "feat: replace powerlevel10k with starship in zshrc"
```

---

### Task 5: Atualizar install.sh

**Files:**
- Modify: `install.sh`

- [ ] **Step 1: Adicionar starship à lista de packages**

Localizar o array `packages` em `install_dependencies()`. Após `lazygit`:
```
    lazygit
```

Adicionar:
```
    lazygit
    starship
```

- [ ] **Step 2: Adicionar symlink do starship.toml em install_dotfiles()**

Localizar em `install_dotfiles()`:
```
  # Terminals
  symlink "$DOTFILES_DIR/kitty" "$HOME/.config/kitty"
  symlink "$DOTFILES_DIR/ghostty" "$HOME/.config/ghostty"
```

Adicionar após:
```
  # Starship
  symlink "$DOTFILES_DIR/starship/starship.toml" "$HOME/.config/starship.toml"
```

- [ ] **Step 3: Atualizar print_summary()**

Localizar:
```
  echo "  • Zsh + Oh My Zsh + Powerlevel10k"
```

Substituir por:
```
  echo "  • Zsh + Oh My Zsh + Starship (Cyberpunk prompt)"
```

- [ ] **Step 4: Remover symlink do p10k em install_dotfiles()**

Localizar e remover a linha:
```
  symlink "$DOTFILES_DIR/zsh/.p10k.zsh" "$HOME/.p10k.zsh"
```

O `~/.p10k.zsh` não precisa mais de symlink (p10k não é mais carregado).

- [ ] **Step 5: Commit**

```bash
git add install.sh
git commit -m "feat: add starship to install script, remove p10k symlink"
```

---

### Task 6: Verificação final e limpeza

**Files:**
- Sem alterações de código

- [ ] **Step 1: Abrir nova sessão de terminal e verificar prompt completo**

Abrir nova aba/janela no Kitty. Verificar:
- Fundo preto `#0a0a0a` ✓
- Prompt 3 linhas: `┌─[user@host]─[dir]` / `├─[branch]` / `└─❯` ✓
- Cursor amarelo ✓
- Tabs com tema cyberpunk ✓

- [ ] **Step 2: Verificar comportamento em diretório git**

```bash
cd ~/Documents/personal/dotfiles
```

Verificar: linha `├─[ main]` aparece com branch em vermelho.

- [ ] **Step 3: Verificar runtime detection**

```bash
cd /tmp && mkdir test-node && cd test-node && echo '{}' > package.json
```

Verificar: linha 2 mostra `─[ v20.x]` em cyan.

```bash
cd ~ && rm -rf /tmp/test-node
```

- [ ] **Step 4: Verificar duração de comando longo**

```bash
sleep 3
```

Verificar: próximo prompt mostra `  took 3s` em amarelo antes da linha `┌─`.

- [ ] **Step 5: Verificar cat/bat com Dracula theme**

```bash
cat ~/.zshrc
```

Verificar: syntax highlighting com tema Dracula.

- [ ] **Step 6: Commit final**

```bash
git add -A
git status
git commit -m "chore: cyberpunk terminal setup complete"
```
