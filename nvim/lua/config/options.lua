-- ============================================
-- Core Options
-- ============================================

local opt = vim.opt
local g = vim.g

-- General
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.wrap = false
opt.linebreak = true
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.virtualedit = 'block'
opt.signcolumn = 'yes'
opt.fillchars = {
  foldopen = 'v',
  foldclose = '>',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}

-- Tabs & Indentation
opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true

-- Search
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = true
opt.incsearch = true

-- Appearance
opt.termguicolors = true
opt.background = 'dark'
opt.showmode = false
opt.cmdheight = 1
opt.laststatus = 3
opt.pumheight = 10
opt.pumblend = 10
opt.winblend = 0

-- Split behavior
opt.splitright = true
opt.splitbelow = true

-- Files
opt.swapfile = false
opt.backup = false
opt.undofile = true
opt.undodir = vim.fn.stdpath('data') .. '/undo'
opt.updatetime = 250
opt.timeoutlen = 300
opt.writebackup = false

-- Completion
opt.completeopt = 'menu,menuone,noselect'
opt.wildmode = 'longest:full,full'
opt.wildoptions = 'pum'

-- Folding
opt.foldlevel = 99
opt.foldmethod = 'expr'
opt.foldexpr = 'nvim_treesitter#foldexpr()'
opt.foldenable = true

-- Session
opt.sessionoptions = {
  'buffers',
  'curdir',
  'tabpages',
  'winsize',
  'help',
  'globals',
  'skiprtp',
  'folds',
}

-- Disable some built-in plugins
g.loaded_netrw = 1
g.loaded_netrwPlugin = 1
g.loaded_matchit = 1
g.loaded_matchparen = 1
