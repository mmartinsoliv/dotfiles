-- ============================================
-- Colorscheme: Cyberpunk 2077
-- ============================================
-- Custom colorscheme matching Kitty terminal cyberpunk theme
-- Based on: #0a0a0a background with neon accents

local M = {}

-- Core palette from Kitty config
local colors = {
  -- Backgrounds
  bg = '#0a0a0a',
  bg_dark = '#0a0a0a',
  bg_highlight = '#1a1a1a',
  bg_visual = '#1a1a1a',
  bg_popup = '#1a1a1a',
  bg_statusline = '#1a1a1a',

  -- Foregrounds
  fg = '#e0e0e0',
  fg_dark = '#555555',
  fg_gutter = '#555555',

  -- Neon accents (from Kitty)
  yellow = '#fcee0a',
  green = '#00ff88',
  cyan = '#00cfff',
  blue = '#00cfff',
  magenta = '#ff007a',
  red = '#ff2f6e',
  orange = '#ff7b00',

  -- Additional tones
  dark_red = '#ff2f6e',
  dark_yellow = '#fcee0a',
  dark_green = '#00ff88',
  dark_cyan = '#00cfff',
  dark_blue = '#00cfff',
  dark_magenta = '#ff007a',

  -- UI elements
  border = '#00cfff',
  selection = '#1a1a1a',
  comment = '#555555',
}

function M.setup()
  -- Reset colors
  vim.cmd('highlight clear')
  if vim.fn.exists('syntax_on') then
    vim.cmd('syntax reset')
  end

  vim.o.termguicolors = true
  vim.g.colors_name = 'cyberpunk'

  local hl = vim.api.nvim_set_hl

  -- Editor
  hl(0, 'Normal', { fg = colors.fg, bg = colors.bg })
  hl(0, 'NormalFloat', { fg = colors.fg, bg = colors.bg_popup })
  hl(0, 'FloatBorder', { fg = colors.border, bg = colors.bg_popup })
  hl(0, 'ColorColumn', { bg = colors.bg_highlight })
  hl(0, 'Conceal', { fg = colors.fg_dark })
  hl(0, 'Cursor', { fg = colors.bg, bg = colors.yellow })
  hl(0, 'CursorIM', { fg = colors.bg, bg = colors.yellow })
  hl(0, 'CursorColumn', { bg = colors.bg_highlight })
  hl(0, 'CursorLine', { bg = colors.bg_highlight })
  hl(0, 'Directory', { fg = colors.cyan })
  hl(0, 'DiffAdd', { bg = '#003300', fg = colors.green })
  hl(0, 'DiffChange', { bg = '#001a33', fg = colors.cyan })
  hl(0, 'DiffDelete', { bg = '#330000', fg = colors.red })
  hl(0, 'DiffText', { bg = '#004466', fg = colors.cyan })
  hl(0, 'EndOfBuffer', { fg = colors.bg })
  hl(0, 'ErrorMsg', { fg = colors.red })
  hl(0, 'VertSplit', { fg = colors.bg_highlight })
  hl(0, 'Folded', { fg = colors.fg_dark, bg = colors.bg_highlight })
  hl(0, 'FoldColumn', { fg = colors.fg_dark })
  hl(0, 'SignColumn', { fg = colors.fg_dark, bg = colors.bg })
  hl(0, 'SignColumnSB', { fg = colors.fg_dark, bg = colors.bg_dark })
  hl(0, 'Substitute', { bg = colors.red, fg = colors.bg })
  hl(0, 'LineNr', { fg = colors.fg_gutter })
  hl(0, 'CursorLineNr', { fg = colors.yellow })
  hl(0, 'MatchParen', { fg = colors.yellow, bg = colors.bg_highlight })
  hl(0, 'ModeMsg', { fg = colors.fg_dark })
  hl(0, 'MsgArea', { fg = colors.fg })
  hl(0, 'MoreMsg', { fg = colors.cyan })
  hl(0, 'NonText', { fg = colors.fg_dark })
  hl(0, 'NormalNC', { fg = colors.fg, bg = colors.bg })
  hl(0, 'Pmenu', { fg = colors.fg, bg = colors.bg_popup })
  hl(0, 'PmenuSel', { fg = colors.bg, bg = colors.cyan })
  hl(0, 'PmenuSbar', { bg = colors.bg_highlight })
  hl(0, 'PmenuThumb', { bg = colors.fg_gutter })
  hl(0, 'Question', { fg = colors.cyan })
  hl(0, 'QuickFixLine', { bg = colors.bg_highlight })
  hl(0, 'Search', { bg = colors.yellow, fg = colors.bg })
  hl(0, 'IncSearch', { bg = colors.orange, fg = colors.bg })
  hl(0, 'CurSearch', { bg = colors.orange, fg = colors.bg })
  hl(0, 'SpecialKey', { fg = colors.fg_dark })
  hl(0, 'SpellBad', { sp = colors.red, undercurl = true })
  hl(0, 'SpellCap', { sp = colors.yellow, undercurl = true })
  hl(0, 'SpellLocal', { sp = colors.cyan, undercurl = true })
  hl(0, 'SpellRare', { sp = colors.magenta, undercurl = true })
  hl(0, 'StatusLine', { fg = colors.fg, bg = colors.bg_statusline })
  hl(0, 'StatusLineNC', { fg = colors.fg_dark, bg = colors.bg_statusline })
  hl(0, 'TabLine', { fg = colors.fg_dark, bg = colors.bg_statusline })
  hl(0, 'TabLineFill', { bg = colors.bg_statusline })
  hl(0, 'TabLineSel', { fg = colors.yellow, bg = colors.bg })
  hl(0, 'Title', { fg = colors.cyan })
  hl(0, 'Visual', { bg = colors.bg_visual })
  hl(0, 'VisualNOS', { bg = colors.bg_visual })
  hl(0, 'WarningMsg', { fg = colors.yellow })
  hl(0, 'Whitespace', { fg = colors.fg_gutter })
  hl(0, 'WildMenu', { fg = colors.bg, bg = colors.cyan })
  hl(0, 'WinBar', { fg = colors.fg, bg = colors.bg })
  hl(0, 'WinBarNC', { fg = colors.fg_dark, bg = colors.bg })
  hl(0, 'WinSeparator', { fg = colors.bg_highlight })

  -- Syntax
  hl(0, 'Comment', { fg = colors.comment, italic = true })
  hl(0, 'Constant', { fg = colors.yellow })
  hl(0, 'String', { fg = colors.green })
  hl(0, 'Character', { fg = colors.green })
  hl(0, 'Number', { fg = colors.yellow })
  hl(0, 'Boolean', { fg = colors.yellow })
  hl(0, 'Float', { fg = colors.yellow })
  hl(0, 'Identifier', { fg = colors.fg })
  hl(0, 'Function', { fg = colors.cyan, bold = true })
  hl(0, 'Method', { fg = colors.cyan, bold = true })
  hl(0, 'Statement', { fg = colors.red, italic = true })
  hl(0, 'Conditional', { fg = colors.red, italic = true })
  hl(0, 'Repeat', { fg = colors.red, italic = true })
  hl(0, 'Label', { fg = colors.yellow })
  hl(0, 'Operator', { fg = colors.yellow })
  hl(0, 'Keyword', { fg = colors.red, italic = true })
  hl(0, 'Exception', { fg = colors.red })
  hl(0, 'PreProc', { fg = colors.magenta })
  hl(0, 'Include', { fg = colors.magenta })
  hl(0, 'Define', { fg = colors.magenta })
  hl(0, 'Macro', { fg = colors.magenta })
  hl(0, 'PreCondit', { fg = colors.magenta })
  hl(0, 'Type', { fg = colors.magenta })
  hl(0, 'StorageClass', { fg = colors.magenta })
  hl(0, 'Structure', { fg = colors.magenta })
  hl(0, 'Typedef', { fg = colors.magenta })
  hl(0, 'Special', { fg = colors.cyan })
  hl(0, 'SpecialChar', { fg = colors.yellow })
  hl(0, 'Tag', { fg = colors.cyan })
  hl(0, 'Delimiter', { fg = colors.fg })
  hl(0, 'SpecialComment', { fg = colors.comment, italic = true })
  hl(0, 'Debug', { fg = colors.yellow })
  hl(0, 'Underlined', { underline = true })
  hl(0, 'Ignore', { fg = colors.fg_dark })
  hl(0, 'Error', { fg = colors.red })
  hl(0, 'Todo', { fg = colors.yellow, bg = colors.bg_highlight, bold = true })

  -- LSP
  hl(0, 'DiagnosticError', { fg = colors.red })
  hl(0, 'DiagnosticWarn', { fg = colors.yellow })
  hl(0, 'DiagnosticInfo', { fg = colors.cyan })
  hl(0, 'DiagnosticHint', { fg = colors.magenta })
  hl(0, 'DiagnosticUnderlineError', { sp = colors.red, undercurl = true })
  hl(0, 'DiagnosticUnderlineWarn', { sp = colors.yellow, undercurl = true })
  hl(0, 'DiagnosticUnderlineInfo', { sp = colors.cyan, undercurl = true })
  hl(0, 'DiagnosticUnderlineHint', { sp = colors.magenta, undercurl = true })
  hl(0, 'LspReferenceText', { bg = colors.bg_highlight })
  hl(0, 'LspReferenceRead', { bg = colors.bg_highlight })
  hl(0, 'LspReferenceWrite', { bg = colors.bg_highlight })
  hl(0, 'LspSignatureActiveParameter', { bg = colors.bg_highlight })

  -- Treesitter
  hl(0, '@variable', { fg = colors.fg })
  hl(0, '@variable.builtin', { fg = colors.red })
  hl(0, '@variable.parameter', { fg = colors.yellow })
  hl(0, '@variable.member', { fg = colors.fg })
  hl(0, '@constant', { fg = colors.yellow })
  hl(0, '@constant.builtin', { fg = colors.yellow })
  hl(0, '@constant.macro', { fg = colors.magenta })
  hl(0, '@module', { fg = colors.cyan })
  hl(0, '@label', { fg = colors.yellow })
  hl(0, '@string', { fg = colors.green })
  hl(0, '@string.documentation', { fg = colors.green })
  hl(0, '@string.regexp', { fg = colors.yellow })
  hl(0, '@string.escape', { fg = colors.yellow })
  hl(0, '@string.special', { fg = colors.yellow })
  hl(0, '@character', { fg = colors.green })
  hl(0, '@character.special', { fg = colors.yellow })
  hl(0, '@boolean', { fg = colors.yellow })
  hl(0, '@number', { fg = colors.yellow })
  hl(0, '@number.float', { fg = colors.yellow })
  hl(0, '@type', { fg = colors.magenta })
  hl(0, '@type.builtin', { fg = colors.magenta })
  hl(0, '@type.definition', { fg = colors.magenta })
  hl(0, '@attribute', { fg = colors.yellow })
  hl(0, '@property', { fg = colors.fg })
  hl(0, '@function', { fg = colors.cyan, bold = true })
  hl(0, '@function.builtin', { fg = colors.cyan, bold = true })
  hl(0, '@function.call', { fg = colors.cyan, bold = true })
  hl(0, '@function.macro', { fg = colors.magenta })
  hl(0, '@function.method', { fg = colors.cyan, bold = true })
  hl(0, '@function.method.call', { fg = colors.cyan, bold = true })
  hl(0, '@constructor', { fg = colors.magenta })
  hl(0, '@operator', { fg = colors.yellow })
  hl(0, '@keyword', { fg = colors.red, italic = true })
  hl(0, '@keyword.coroutine', { fg = colors.red, italic = true })
  hl(0, '@keyword.function', { fg = colors.red, italic = true })
  hl(0, '@keyword.operator', { fg = colors.red, italic = true })
  hl(0, '@keyword.import', { fg = colors.magenta })
  hl(0, '@keyword.type', { fg = colors.magenta })
  hl(0, '@keyword.modifier', { fg = colors.red, italic = true })
  hl(0, '@keyword.repeat', { fg = colors.red, italic = true })
  hl(0, '@keyword.return', { fg = colors.red, italic = true })
  hl(0, '@keyword.debug', { fg = colors.yellow })
  hl(0, '@keyword.exception', { fg = colors.red })
  hl(0, '@conditional', { fg = colors.red, italic = true })
  hl(0, '@conditional.ternary', { fg = colors.red, italic = true })
  hl(0, '@repeat', { fg = colors.red, italic = true })
  hl(0, '@debug', { fg = colors.yellow })
  hl(0, '@exception', { fg = colors.red })
  hl(0, '@include', { fg = colors.magenta })
  hl(0, '@comment', { fg = colors.comment, italic = true })
  hl(0, '@comment.documentation', { fg = colors.comment, italic = true })
  hl(0, '@punctuation.delimiter', { fg = colors.fg })
  hl(0, '@punctuation.bracket', { fg = colors.fg })
  hl(0, '@punctuation.special', { fg = colors.cyan })
  hl(0, '@tag', { fg = colors.cyan })
  hl(0, '@tag.attribute', { fg = colors.yellow })
  hl(0, '@tag.delimiter', { fg = colors.fg })

  -- Git
  hl(0, 'GitSignsAdd', { fg = colors.green })
  hl(0, 'GitSignsChange', { fg = colors.cyan })
  hl(0, 'GitSignsDelete', { fg = colors.red })
  hl(0, 'GitSignsAddInline', { fg = colors.bg, bg = colors.green })
  hl(0, 'GitSignsChangeInline', { fg = colors.bg, bg = colors.cyan })
  hl(0, 'GitSignsDeleteInline', { fg = colors.bg, bg = colors.red })

  -- Telescope
  hl(0, 'TelescopeBorder', { fg = colors.border, bg = colors.bg_popup })
  hl(0, 'TelescopePromptBorder', { fg = colors.border, bg = colors.bg_popup })
  hl(0, 'TelescopeResultsBorder', { fg = colors.border, bg = colors.bg_popup })
  hl(0, 'TelescopePreviewBorder', { fg = colors.border, bg = colors.bg_popup })
  hl(0, 'TelescopeNormal', { fg = colors.fg, bg = colors.bg_popup })
  hl(0, 'TelescopePromptNormal', { fg = colors.fg, bg = colors.bg_popup })
  hl(0, 'TelescopeSelection', { bg = colors.bg_highlight })
  hl(0, 'TelescopeSelectionCaret', { fg = colors.yellow })
  hl(0, 'TelescopeMatching', { fg = colors.yellow, bold = true })
  hl(0, 'TelescopePromptPrefix', { fg = colors.yellow })
  hl(0, 'TelescopePromptCounter', { fg = colors.fg_dark })

  -- Neo-tree
  hl(0, 'NeoTreeDirectoryIcon', { fg = colors.cyan })
  hl(0, 'NeoTreeDirectoryName', { fg = colors.cyan })
  hl(0, 'NeoTreeFileName', { fg = colors.fg })
  hl(0, 'NeoTreeFileNameOpened', { fg = colors.yellow })
  hl(0, 'NeoTreeFloatBorder', { fg = colors.border, bg = colors.bg_popup })
  hl(0, 'NeoTreeGitAdded', { fg = colors.green })
  hl(0, 'NeoTreeGitConflict', { fg = colors.red })
  hl(0, 'NeoTreeGitDeleted', { fg = colors.red })
  hl(0, 'NeoTreeGitIgnored', { fg = colors.fg_dark })
  hl(0, 'NeoTreeGitModified', { fg = colors.cyan })
  hl(0, 'NeoTreeGitUnstaged', { fg = colors.red })
  hl(0, 'NeoTreeGitUntracked', { fg = colors.green })
  hl(0, 'NeoTreeGitStaged', { fg = colors.green })
  hl(0, 'NeoTreeIndentMarker', { fg = colors.fg_dark })
  hl(0, 'NeoTreeNormal', { fg = colors.fg, bg = colors.bg_dark })
  hl(0, 'NeoTreeNormalNC', { fg = colors.fg, bg = colors.bg_dark })
  hl(0, 'NeoTreeRootName', { fg = colors.cyan, bold = true })
  hl(0, 'NeoTreeSymbolicLinkTarget', { fg = colors.magenta })
  hl(0, 'NeoTreeTitleBar', { fg = colors.fg, bg = colors.bg_highlight })

  -- Which-key
  hl(0, 'WhichKey', { fg = colors.cyan })
  hl(0, 'WhichKeyGroup', { fg = colors.magenta })
  hl(0, 'WhichKeySeparator', { fg = colors.fg_dark })
  hl(0, 'WhichKeyDesc', { fg = colors.fg })
  hl(0, 'WhichKeyFloat', { bg = colors.bg_popup })
  hl(0, 'WhichKeyBorder', { fg = colors.border })
  hl(0, 'WhichKeyValue', { fg = colors.fg_dark })

  -- Notify
  hl(0, 'NotifyBackground', { bg = colors.bg_popup })
  hl(0, 'NotifyERRORBorder', { fg = colors.red })
  hl(0, 'NotifyWARNBorder', { fg = colors.yellow })
  hl(0, 'NotifyINFOBorder', { fg = colors.cyan })
  hl(0, 'NotifyDEBUGBorder', { fg = colors.fg_dark })
  hl(0, 'NotifyTRACEBorder', { fg = colors.magenta })
  hl(0, 'NotifyERRORIcon', { fg = colors.red })
  hl(0, 'NotifyWARNIcon', { fg = colors.yellow })
  hl(0, 'NotifyINFOIcon', { fg = colors.cyan })
  hl(0, 'NotifyDEBUGIcon', { fg = colors.fg_dark })
  hl(0, 'NotifyTRACEIcon', { fg = colors.magenta })
  hl(0, 'NotifyERRORTitle', { fg = colors.red })
  hl(0, 'NotifyWARNTitle', { fg = colors.yellow })
  hl(0, 'NotifyINFOTitle', { fg = colors.cyan })
  hl(0, 'NotifyDEBUGTitle', { fg = colors.fg_dark })
  hl(0, 'NotifyTRACETitle', { fg = colors.magenta })
  hl(0, 'NotifyERRORBody', { fg = colors.fg })
  hl(0, 'NotifyWARNBody', { fg = colors.fg })
  hl(0, 'NotifyINFOBody', { fg = colors.fg })
  hl(0, 'NotifyDEBUGBody', { fg = colors.fg })
  hl(0, 'NotifyTRACEBody', { fg = colors.fg })

  -- Alpha / Dashboard
  hl(0, 'AlphaHeader', { fg = colors.cyan })
  hl(0, 'AlphaHeaderLabel', { fg = colors.yellow })
  hl(0, 'AlphaButtons', { fg = colors.cyan })
  hl(0, 'AlphaShortcut', { fg = colors.yellow })
  hl(0, 'AlphaFooter', { fg = colors.fg_dark })

  -- Bufferline
  hl(0, 'BufferLineIndicatorSelected', { fg = colors.yellow })
  hl(0, 'BufferLineFill', { bg = colors.bg_statusline })
  hl(0, 'BufferLineBackground', { fg = colors.fg_dark, bg = colors.bg_statusline })
  hl(0, 'BufferLineBufferVisible', { fg = colors.fg_dark, bg = colors.bg_statusline })
  hl(0, 'BufferLineBufferSelected', { fg = colors.fg, bg = colors.bg, bold = true })
  hl(0, 'BufferLineTab', { fg = colors.fg_dark, bg = colors.bg_statusline })
  hl(0, 'BufferLineTabSelected', { fg = colors.yellow, bg = colors.bg })
  hl(0, 'BufferLineTabClose', { fg = colors.red })
  hl(0, 'BufferLineDiagnostic', { fg = colors.fg_dark })
  hl(0, 'BufferLineDiagnosticVisible', { fg = colors.fg_dark })
  hl(0, 'BufferLineDiagnosticSelected', { fg = colors.fg })
  hl(0, 'BufferLineError', { fg = colors.red })
  hl(0, 'BufferLineErrorVisible', { fg = colors.red })
  hl(0, 'BufferLineErrorSelected', { fg = colors.red })
  hl(0, 'BufferLineErrorDiagnostic', { fg = colors.red })
  hl(0, 'BufferLineErrorDiagnosticVisible', { fg = colors.red })
  hl(0, 'BufferLineErrorDiagnosticSelected', { fg = colors.red })
  hl(0, 'BufferLineWarning', { fg = colors.yellow })
  hl(0, 'BufferLineWarningVisible', { fg = colors.yellow })
  hl(0, 'BufferLineWarningSelected', { fg = colors.yellow })
  hl(0, 'BufferLineWarningDiagnostic', { fg = colors.yellow })
  hl(0, 'BufferLineWarningDiagnosticVisible', { fg = colors.yellow })
  hl(0, 'BufferLineWarningDiagnosticSelected', { fg = colors.yellow })
  hl(0, 'BufferLineInfo', { fg = colors.cyan })
  hl(0, 'BufferLineInfoVisible', { fg = colors.cyan })
  hl(0, 'BufferLineInfoSelected', { fg = colors.cyan })
  hl(0, 'BufferLineInfoDiagnostic', { fg = colors.cyan })
  hl(0, 'BufferLineInfoDiagnosticVisible', { fg = colors.cyan })
  hl(0, 'BufferLineInfoDiagnosticSelected', { fg = colors.cyan })
  hl(0, 'BufferLineHint', { fg = colors.magenta })
  hl(0, 'BufferLineHintVisible', { fg = colors.magenta })
  hl(0, 'BufferLineHintSelected', { fg = colors.magenta })
  hl(0, 'BufferLineHintDiagnostic', { fg = colors.magenta })
  hl(0, 'BufferLineHintDiagnosticVisible', { fg = colors.magenta })
  hl(0, 'BufferLineHintDiagnosticSelected', { fg = colors.magenta })
  hl(0, 'BufferLineModified', { fg = colors.yellow })
  hl(0, 'BufferLineModifiedVisible', { fg = colors.yellow })
  hl(0, 'BufferLineModifiedSelected', { fg = colors.yellow })
  hl(0, 'BufferLineDuplicate', { fg = colors.fg_dark })
  hl(0, 'BufferLineDuplicateVisible', { fg = colors.fg_dark })
  hl(0, 'BufferLineDuplicateSelected', { fg = colors.fg_dark })
  hl(0, 'BufferLineSeparator', { fg = colors.bg_statusline, bg = colors.bg_statusline })
  hl(0, 'BufferLineSeparatorVisible', { fg = colors.bg_statusline, bg = colors.bg_statusline })
  hl(0, 'BufferLineSeparatorSelected', { fg = colors.bg_statusline, bg = colors.bg_statusline })
  hl(0, 'BufferLineOffsetSeparator', { fg = colors.bg_statusline, bg = colors.bg_statusline })
  hl(0, 'BufferLinePick', { fg = colors.red, bold = true, italic = true })
  hl(0, 'BufferLinePickVisible', { fg = colors.red, bold = true, italic = true })
  hl(0, 'BufferLinePickSelected', { fg = colors.red, bold = true, italic = true })
  hl(0, 'BufferLineCloseButton', { fg = colors.fg_dark })
  hl(0, 'BufferLineCloseButtonVisible', { fg = colors.fg_dark })
  hl(0, 'BufferLineCloseButtonSelected', { fg = colors.fg })
  hl(0, 'BufferLineNumbers', { fg = colors.fg_dark })
  hl(0, 'BufferLineNumbersVisible', { fg = colors.fg_dark })
  hl(0, 'BufferLineNumbersSelected', { fg = colors.fg })

  -- CMP
  hl(0, 'CmpItemAbbr', { fg = colors.fg })
  hl(0, 'CmpItemAbbrDeprecated', { fg = colors.fg_dark, strikethrough = true })
  hl(0, 'CmpItemAbbrMatch', { fg = colors.yellow, bold = true })
  hl(0, 'CmpItemAbbrMatchFuzzy', { fg = colors.yellow, bold = true })
  hl(0, 'CmpItemKind', { fg = colors.cyan })
  hl(0, 'CmpItemMenu', { fg = colors.fg_dark })

  -- Gitsigns
  hl(0, 'GitSignsAdd', { fg = colors.green })
  hl(0, 'GitSignsChange', { fg = colors.cyan })
  hl(0, 'GitSignsDelete', { fg = colors.red })
  hl(0, 'GitSignsAddNr', { fg = colors.green })
  hl(0, 'GitSignsChangeNr', { fg = colors.cyan })
  hl(0, 'GitSignsDeleteNr', { fg = colors.red })
  hl(0, 'GitSignsAddLn', { bg = '#003300' })
  hl(0, 'GitSignsChangeLn', { bg = '#001a33' })
  hl(0, 'GitSignsDeleteLn', { bg = '#330000' })
  hl(0, 'GitSignsAddPreview', { bg = '#003300' })
  hl(0, 'GitSignsDeletePreview', { bg = '#330000' })
  hl(0, 'GitSignsCurrentLineBlame', { fg = colors.fg_dark })
  hl(0, 'GitSignsAddInline', { fg = colors.bg, bg = colors.green })
  hl(0, 'GitSignsChangeInline', { fg = colors.bg, bg = colors.cyan })
  hl(0, 'GitSignsDeleteInline', { fg = colors.bg, bg = colors.red })

  -- Lazy
  hl(0, 'LazyButton', { bg = colors.bg_highlight })
  hl(0, 'LazyButtonActive', { fg = colors.bg, bg = colors.cyan })
  hl(0, 'LazyComment', { fg = colors.comment })
  hl(0, 'LazyCommit', { fg = colors.yellow })
  hl(0, 'LazyCommitIssue', { fg = colors.red })
  hl(0, 'LazyCommitScope', { fg = colors.cyan })
  hl(0, 'LazyCommitType', { fg = colors.magenta })
  hl(0, 'LazyDir', { fg = colors.cyan })
  hl(0, 'LazyH1', { fg = colors.bg, bg = colors.cyan })
  hl(0, 'LazyH2', { fg = colors.cyan, bold = true })
  hl(0, 'LazyProp', { fg = colors.fg_dark })
  hl(0, 'LazyReasonCmd', { fg = colors.cyan })
  hl(0, 'LazyReasonEvent', { fg = colors.cyan })
  hl(0, 'LazyReasonFt', { fg = colors.cyan })
  hl(0, 'LazyReasonImport', { fg = colors.cyan })
  hl(0, 'LazyReasonKeys', { fg = colors.yellow })
  hl(0, 'LazyReasonPlugin', { fg = colors.cyan })
  hl(0, 'LazyReasonRuntime', { fg = colors.cyan })
  hl(0, 'LazyReasonSource', { fg = colors.cyan })
  hl(0, 'LazyReasonStart', { fg = colors.green })
  hl(0, 'LazySpecial', { fg = colors.yellow })
  hl(0, 'LazyTaskError', { fg = colors.red })
  hl(0, 'LazyTaskOutput', { fg = colors.fg })
  hl(0, 'LazyUrl', { fg = colors.cyan })
  hl(0, 'LazyValue', { fg = colors.yellow })
  hl(0, 'LazyProgressDone', { fg = colors.green })
  hl(0, 'LazyProgressTodo', { fg = colors.fg_dark })

  -- Mason
  hl(0, 'MasonHighlight', { fg = colors.cyan })
  hl(0, 'MasonHighlightBlock', { fg = colors.bg, bg = colors.cyan })
  hl(0, 'MasonHighlightBlockBold', { fg = colors.bg, bg = colors.cyan, bold = true })
  hl(0, 'MasonHighlightSecondary', { fg = colors.yellow })
  hl(0, 'MasonHighlightBlockSecondary', { fg = colors.bg, bg = colors.yellow })
  hl(0, 'MasonHighlightBlockBoldSecondary', { fg = colors.bg, bg = colors.yellow, bold = true })
  hl(0, 'MasonMuted', { fg = colors.fg_dark })
  hl(0, 'MasonMutedBlock', { fg = colors.fg_dark, bg = colors.bg_highlight })
  hl(0, 'MasonMutedBlockBold', { fg = colors.fg_dark, bg = colors.bg_highlight, bold = true })
  hl(0, 'MasonHeader', { fg = colors.bg, bg = colors.cyan })
  hl(0, 'MasonHeaderSecondary', { fg = colors.bg, bg = colors.yellow })

  -- Illuminate
  hl(0, 'IlluminatedWordText', { bg = colors.bg_highlight })
  hl(0, 'IlluminatedWordRead', { bg = colors.bg_highlight })
  hl(0, 'IlluminatedWordWrite', { bg = colors.bg_highlight })

  -- Indent-blankline
  hl(0, 'IndentBlanklineChar', { fg = colors.bg_highlight })
  hl(0, 'IndentBlanklineContextChar', { fg = colors.fg_dark })
  hl(0, 'IndentBlanklineContextStart', { sp = colors.fg_dark, underline = true })
  hl(0, 'IblIndent', { fg = colors.bg_highlight })
  hl(0, 'IblScope', { fg = colors.cyan })

  -- Noice
  hl(0, 'NoiceCompletionItemKindDefault', { fg = colors.fg })
  hl(0, 'NoiceCompletionItemKindKeyword', { fg = colors.red })
  hl(0, 'NoiceCompletionItemKindVariable', { fg = colors.fg })
  hl(0, 'NoiceCompletionItemKindConstant', { fg = colors.yellow })
  hl(0, 'NoiceCompletionItemKindReference', { fg = colors.fg })
  hl(0, 'NoiceCompletionItemKindValue', { fg = colors.yellow })
  hl(0, 'NoiceCompletionItemKindFunction', { fg = colors.cyan })
  hl(0, 'NoiceCompletionItemKindMethod', { fg = colors.cyan })
  hl(0, 'NoiceCompletionItemKindConstructor', { fg = colors.magenta })
  hl(0, 'NoiceCompletionItemKindClass', { fg = colors.magenta })
  hl(0, 'NoiceCompletionItemKindInterface', { fg = colors.magenta })
  hl(0, 'NoiceCompletionItemKindStruct', { fg = colors.magenta })
  hl(0, 'NoiceCompletionItemKindEvent', { fg = colors.yellow })
  hl(0, 'NoiceCompletionItemKindEnum', { fg = colors.magenta })
  hl(0, 'NoiceCompletionItemKindUnit', { fg = colors.yellow })
  hl(0, 'NoiceCompletionItemKindModule', { fg = colors.cyan })
  hl(0, 'NoiceCompletionItemKindProperty', { fg = colors.fg })
  hl(0, 'NoiceCompletionItemKindField', { fg = colors.fg })
  hl(0, 'NoiceCompletionItemKindTypeParameter', { fg = colors.magenta })
  hl(0, 'NoiceCompletionItemKindEnumMember', { fg = colors.yellow })
  hl(0, 'NoiceCompletionItemKindOperator', { fg = colors.yellow })
  hl(0, 'NoiceCompletionItemKindSnippet', { fg = colors.yellow })

  -- Hop / Leap
  hl(0, 'HopNextKey', { fg = colors.yellow, bold = true })
  hl(0, 'HopNextKey1', { fg = colors.cyan, bold = true })
  hl(0, 'HopNextKey2', { fg = colors.magenta })
  hl(0, 'HopUnmatched', { fg = colors.fg_dark })
  hl(0, 'LeapMatch', { fg = colors.yellow, bold = true })
  hl(0, 'LeapLabelPrimary', { fg = colors.bg, bg = colors.yellow, bold = true })
  hl(0, 'LeapLabelSecondary', { fg = colors.bg, bg = colors.cyan, bold = true })
  hl(0, 'LeapBackdrop', { fg = colors.fg_dark })

  -- Flash
  hl(0, 'FlashBackdrop', { fg = colors.fg_dark })
  hl(0, 'FlashMatch', { fg = colors.yellow, bold = true })
  hl(0, 'FlashCurrent', { fg = colors.bg, bg = colors.yellow, bold = true })
  hl(0, 'FlashLabel', { fg = colors.bg, bg = colors.red, bold = true })

  -- Trouble
  hl(0, 'TroubleText', { fg = colors.fg })
  hl(0, 'TroubleCount', { fg = colors.magenta, bg = colors.bg_highlight })
  hl(0, 'TroubleNormal', { fg = colors.fg, bg = colors.bg })
  hl(0, 'TroubleIndent', { fg = colors.fg_dark })
  hl(0, 'TroubleFile', { fg = colors.cyan })
  hl(0, 'TroubleFoldIcon', { fg = colors.cyan })
  hl(0, 'TroubleFoldOpen', { fg = colors.cyan })
  hl(0, 'TroubleFoldClosed', { fg = colors.yellow })
  hl(0, 'TroubleLocation', { fg = colors.fg_dark })
  hl(0, 'TroubleCode', { fg = colors.magenta })
  hl(0, 'TroubleHint', { fg = colors.magenta })
  hl(0, 'TroubleInformation', { fg = colors.cyan })
  hl(0, 'TroubleWarning', { fg = colors.yellow })
  hl(0, 'TroubleError', { fg = colors.red })
  hl(0, 'TroubleSignText', { fg = colors.fg })
  hl(0, 'TroubleSignOther', { fg = colors.fg })
  hl(0, 'TroublePreview', { bg = colors.bg_highlight })
  hl(0, 'TroubleSource', { fg = colors.fg_dark })
  hl(0, 'TroubleSignHint', { fg = colors.magenta })
  hl(0, 'TroubleSignInformation', { fg = colors.cyan })
  hl(0, 'TroubleSignWarning', { fg = colors.yellow })
  hl(0, 'TroubleSignError', { fg = colors.red })
  hl(0, 'TroubleTextHint', { fg = colors.fg })
  hl(0, 'TroubleTextInformation', { fg = colors.fg })
  hl(0, 'TroubleTextWarning', { fg = colors.fg })
  hl(0, 'TroubleTextError', { fg = colors.fg })
  hl(0, 'TroubleTextInformation', { fg = colors.fg })
  hl(0, 'TroubleTextWarning', { fg = colors.fg })
  hl(0, 'TroubleTextError', { fg = colors.fg })

  -- TODO comments
  hl(0, 'TodoBgTODO', { fg = colors.bg, bg = colors.cyan, bold = true })
  hl(0, 'TodoFgTODO', { fg = colors.cyan })
  hl(0, 'TodoBgFIX', { fg = colors.bg, bg = colors.red, bold = true })
  hl(0, 'TodoFgFIX', { fg = colors.red })
  hl(0, 'TodoBgHACK', { fg = colors.bg, bg = colors.yellow, bold = true })
  hl(0, 'TodoFgHACK', { fg = colors.yellow })
  hl(0, 'TodoBgWARN', { fg = colors.bg, bg = colors.yellow, bold = true })
  hl(0, 'TodoFgWARN', { fg = colors.yellow })
  hl(0, 'TodoBgPERF', { fg = colors.bg, bg = colors.magenta, bold = true })
  hl(0, 'TodoFgPERF', { fg = colors.magenta })
  hl(0, 'TodoBgNOTE', { fg = colors.bg, bg = colors.green, bold = true })
  hl(0, 'TodoFgNOTE', { fg = colors.green })
  hl(0, 'TodoBgTEST', { fg = colors.bg, bg = colors.cyan, bold = true })
  hl(0, 'TodoFgTEST', { fg = colors.cyan })

  -- Terminal colors
  vim.g.terminal_color_0 = colors.bg
  vim.g.terminal_color_1 = colors.red
  vim.g.terminal_color_2 = colors.green
  vim.g.terminal_color_3 = colors.yellow
  vim.g.terminal_color_4 = colors.blue
  vim.g.terminal_color_5 = colors.magenta
  vim.g.terminal_color_6 = colors.cyan
  vim.g.terminal_color_7 = colors.fg
  vim.g.terminal_color_8 = colors.bg_highlight
  vim.g.terminal_color_9 = colors.red
  vim.g.terminal_color_10 = colors.green
  vim.g.terminal_color_11 = colors.yellow
  vim.g.terminal_color_12 = colors.blue
  vim.g.terminal_color_13 = colors.magenta
  vim.g.terminal_color_14 = colors.cyan
  vim.g.terminal_color_15 = colors.fg
end

return {
  {
    name = 'cyberpunk',
    lazy = false,
    priority = 1000,
    config = function()
      M.setup()
      vim.cmd('colorscheme cyberpunk')
    end,
  },
}