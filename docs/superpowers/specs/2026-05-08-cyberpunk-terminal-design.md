# Cyberpunk Terminal Design

## Business Context

O usuário não estava satisfeito com o visual atual do terminal (Kitty + Zsh + Powerlevel10k em Tokyo Night Storm). A meta é substituir por uma estética Neon/Cyberpunk 2077 com um prompt estilo hacker multi-linha, mantendo toda a funcionalidade existente do `.zshrc`.

## Arch Decisions

### Starship em vez de Powerlevel10k
Powerlevel10k requer um `.p10k.zsh` gerado com 1000+ linhas de difícil manutenção. Starship usa um `starship.toml` legível e versionável, escrito em Rust (rápido no cold start), e suporta o estilo multi-linha hacker com a mesma riqueza de informação. Escolhido por legibilidade e portabilidade.

### Paleta Cyberpunk 2077
- Background: `#0a0a0a` (preto quase puro)
- Yellow (acento primário): `#fcee0a`
- Cyan (acento secundário): `#00cfff`
- Red (erros/warnings): `#ff2f6e`
- Foreground: `#e0e0e0`
- Muted/comentários: `#555555`
- Surface: `#1a1a1a`

### Fonte mantida: JetBrainsMono Nerd Font
Já instalada, suporta todos os glyphs necessários para o prompt (├─, └─, ❯, ícones Nerd Font). Não há necessidade de trocar.

### Novo arquivo `starship/starship.toml` no dotfiles
O arquivo vive em `starship/starship.toml` e é symlinked para `~/.config/starship.toml` via `install.sh`, seguindo o mesmo padrão dos outros arquivos do repositório.

## Technical Contract

### Arquivos modificados

#### `kitty/kitty.conf`
Substituir a seção de cores `# Colors (Tokyo Night Storm)` inteira pela paleta Cyberpunk 2077:
- `background #0a0a0a`
- `foreground #e0e0e0`
- `cursor #fcee0a`
- `cursor_text_color #0a0a0a`
- 16 cores ANSI mapeadas para a nova paleta
- Tabs: `active_tab_background #fcee0a`, `active_tab_foreground #0a0a0a`
- `inactive_tab_background #1a1a1a`, `inactive_tab_foreground #555555`
- `tab_bar_background #0a0a0a`
- `active_border_color #00cfff`, `inactive_border_color #1a1a1a`

#### `starship/starship.toml` (novo arquivo)
Prompt hacker multi-linha com os seguintes módulos:
```
Line 1: ┌─[username@hostname]─[directory]
Line 2: ├─[git_branch·git_status]─[language_runtime] (condicionais, omitida se sem git/runtime)
Line 3: └─❯  (símbolo de input)
```
- Horário exibido antes da linha 1 (módulo `time`, muted)
- Duração do último comando exibida antes da linha 1 quando > 2s
- Cores: diretório/usuário em `#fcee0a`, hostname/runtime em `#00cfff`, git branch em `#ff2f6e`, conectores `┌─`/`├─`/`└─` em `#555555`
- `add_newline = true`
- Módulos de runtime habilitados: `nodejs`, `rust`, `golang`, `python`, `docker_context`

#### `zsh/.zshrc`
- Remover: `ZSH_THEME="powerlevel10k/powerlevel10k"`
- Remover: bloco `# Powerlevel10k Configuration` (instant prompt + `source ~/.p10k.zsh`)
- Adicionar ao final: `eval "$(starship init zsh)"`
- `BAT_THEME` atualizar de `tokyonight_storm` para `Dracula` (tema escuro compatível com paleta cyberpunk, verificar nome exato com `bat --list-themes` durante implementação)

#### `install.sh`
- Adicionar checagem/instalação de Starship: `brew install starship`
- Adicionar symlink: `~/.config/starship.toml` → `starship/starship.toml`

### Pré-requisitos
- Starship instalado via `brew install starship`
- `~/.config/` deve existir (geralmente já existe)

### O que NÃO muda
- Todos os plugins do Oh My Zsh permanecem
- Todos os aliases e funções do `.zshrc`
- A fonte JetBrainsMono Nerd Font
- `font_size`, `scrollback_lines`, keybindings e demais configs do `kitty.conf`
- O arquivo `~/.p10k.zsh` existente (não deletar, apenas não carregar mais)
