-- ============================================
-- Keymaps
-- ============================================

local map = vim.keymap.set

-- Better escape
map('i', 'jk', '<Esc>', { desc = 'Exit insert mode' })
map('i', 'kj', '<Esc>', { desc = 'Exit insert mode' })

-- Better window navigation
map('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
map('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
map('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
map('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- Resize windows
map('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
map('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- Move lines
map('n', '<A-j>', '<cmd>m .+1<cr>==', { desc = 'Move line down' })
map('n', '<A-k>', '<cmd>m .-2<cr>==', { desc = 'Move line up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move line down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move line up' })
map('v', '<A-j>', ":m '>+1<cr>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', ":m '<-2<cr>gv=gv", { desc = 'Move selection up' })

-- Better indenting
map('v', '<', '<gv', { desc = 'Decrease indent' })
map('v', '>', '>gv', { desc = 'Increase indent' })

-- Clear search highlights
map('n', '<Esc>', '<cmd>noh<cr><Esc>', { desc = 'Clear highlights' })

-- Save file
map({ 'i', 'v', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save file' })

-- Better paste
map('v', 'p', '"_dP', { desc = 'Paste without yanking' })

-- Copy to system clipboard
map({ 'n', 'v' }, '<leader>y', '"+y', { desc = 'Copy to system clipboard' })
map('n', '<leader>Y', '"+Y', { desc = 'Copy line to system clipboard' })

-- Buffers
map('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
map('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '[b', '<cmd>bprevious<cr>', { desc = 'Previous buffer' })
map('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })
map('n', '<leader>bd', '<cmd>bdelete<cr>', { desc = 'Delete buffer' })
map('n', '<leader>bD', '<cmd>bdelete!<cr>', { desc = 'Delete buffer (force)' })

-- Toggle options
map('n', '<leader>ow', '<cmd>set wrap!<cr>', { desc = 'Toggle word wrap' })
map('n', '<leader>on', '<cmd>set number!<cr>', { desc = 'Toggle line numbers' })
map('n', '<leader>or', '<cmd>set relativenumber!<cr>', { desc = 'Toggle relative numbers' })

-- Quick file operations
map('n', '<leader>fn', '<cmd>enew<cr>', { desc = 'New file' })
map('n', '<leader>fo', '<cmd>!open %<cr>', { desc = 'Open file in default app' })

-- Close all buffers except current
map('n', '<leader>bo', '<cmd>%bdelete|edit#|bdelete#<cr>', { desc = 'Close other buffers' })

-- Terminal
map('n', '<leader>t', '<cmd>terminal<cr>', { desc = 'Open terminal' })
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
map('t', '<C-h>', '<C-\\><C-n><C-w>h', { desc = 'Go to left window' })
map('t', '<C-j>', '<C-\\><C-n><C-w>j', { desc = 'Go to lower window' })
map('t', '<C-k>', '<C-\\><C-n><C-w>k', { desc = 'Go to upper window' })
map('t', '<C-l>', '<C-\\><C-n><C-w>l', { desc = 'Go to right window' })

-- Quick fix and location list
map('n', '[q', '<cmd>cprev<cr>', { desc = 'Previous quickfix' })
map('n', ']q', '<cmd>cnext<cr>', { desc = 'Next quickfix' })
map('n', '[l', '<cmd>lprev<cr>', { desc = 'Previous location' })
map('n', ']l', '<cmd>lnext<cr>', { desc = 'Next location' })

-- Stay in visual mode when shifting
map('x', 'K', ":move '<-2<CR>gv-gv", { desc = 'Move selection up' })
map('x', 'J', ":move '>+1<CR>gv-gv", { desc = 'Move selection down' })
