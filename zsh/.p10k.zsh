# ============================================
# Powerlevel10k Configuration
# Tokyo Night Theme
# ============================================

# Temporarily change options
'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh -o extended_glob

  # Unset all configuration options
  unset -m '(POWERLEVEL9K_*|DEFAULT_USER)~POWERLEVEL9K_GITSTATUS_DIR'

  # Prompt colors - Tokyo Night Storm
  local tn_bg='#1a1b26'
  local tn_fg='#c0caf5'
  local tn_blue='#7aa2f7'
  local tn_purple='#bb9af7'
  local tn_cyan='#7dcfff'
  local tn_green='#9ece6a'
  local tn_yellow='#e0af68'
  local tn_red='#f7768e'
  local tn_orange='#ff9e64'
  local tn_gray='#565f89'
  local tn_dark='#24283b'

  # Prompt height
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always

  # Left prompt segments
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    os_icon
    dir
    vcs
    newline
    prompt_char
  )

  # Right prompt segments
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status
    command_execution_time
    background_jobs
    node_version
    rust_version
    python_version
    time
  )

  # Segment styling
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=

  # Prompt char
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$tn_blue
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS,VIOWR}_FOREGROUND=$tn_red
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='❯'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='❮'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIOWR_CONTENT_EXPANSION='▶'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=true
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
  typeset -g POWERLEVEL9K_PROMPT_CHAR_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=

  # Directory
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=$tn_blue
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=$tn_gray
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=$tn_blue
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_DIR_SHOW_WRITABLE=v3

  # VCS (Git)
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=$tn_green
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=$tn_yellow
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=$tn_orange
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND=$tn_red
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=$tn_gray
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=''
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='?'

  # Status
  typeset -g POWERLEVEL9K_STATUS_EXTENDED_STATES=true
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=$tn_green
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_OK_PIPE_FOREGROUND=$tn_green
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=$tn_red
  typeset -g POWERLEVEL9K_STATUS_ERROR_SIGNAL_FOREGROUND=$tn_red
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_PIPE_FOREGROUND=$tn_red

  # Command execution time
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=3
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=$tn_yellow
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'

  # Background jobs
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND=$tn_cyan
  typeset -g POWERLEVEL9K_BACKGROUND_JOBS_VERBOSE=false

  # Node version
  typeset -g POWERLEVEL9K_NODE_VERSION_FOREGROUND=$tn_green
  typeset -g POWERLEVEL9K_NODE_VERSION_PROJECT_ONLY=true

  # Rust version
  typeset -g POWERLEVEL9K_RUST_VERSION_FOREGROUND=$tn_orange
  typeset -g POWERLEVEL9K_RUST_VERSION_PROJECT_ONLY=true

  # Python version
  typeset -g POWERLEVEL9K_PYTHON_VERSION_FOREGROUND=$tn_yellow
  typeset -g POWERLEVEL9K_PYTHON_VERSION_PROJECT_ONLY=true

  # Time
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=$tn_gray
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M}'
  typeset -g POWERLEVEL9K_TIME_UPDATE_ON_COMMAND=false

  # OS icon
  typeset -g POWERLEVEL9K_OS_ICON_FOREGROUND=$tn_purple
  typeset -g POWERLEVEL9K_OS_ICON_CONTENT_EXPANSION='󰀵'

  # Transient prompt
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=always
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

  # Hot reload
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  # Define prompt_char
  function prompt_prompt_char() {
    p10k segment -f $1 -t $2
  }
}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
