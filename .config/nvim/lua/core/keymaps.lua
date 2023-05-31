-- open Explore [view] (netrw)
-- likely overridden by oil.nvim
vim.keymap.set('n', '<leader>ev', vim.cmd.Ex)

-- moving cursor vertically won't skip wrapped lines
vim.keymap.set('n', 'j', "v:count ? 'j' : 'gj'", { noremap = true, expr = true })
vim.keymap.set('n', 'k', "v:count ? 'k' : 'gk'", { noremap = true, expr = true })

-- open split
vim.keymap.set('n', '<leader>w-', '<C-W>s<cr>', { desc = 'Open horizontal split' })
vim.keymap.set('n', '<leader>w|', '<C-W>v<cr>', { desc = 'Open vertical split' })

-- move to window using the <ctrl> hjkl keys
vim.keymap.set('n', '<C-h>', '<C-w>h', { desc = 'Go to left window' })
vim.keymap.set('n', '<C-j>', '<C-w>j', { desc = 'Go to lower window' })
vim.keymap.set('n', '<C-k>', '<C-w>k', { desc = 'Go to upper window' })
vim.keymap.set('n', '<C-l>', '<C-w>l', { desc = 'Go to right window' })

-- resize window using <ctrl> arrow keys
vim.keymap.set('n', '<C-Up>', '<cmd>resize +2<cr>', { desc = 'Increase window height' })
vim.keymap.set('n', '<C-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease window height' })
vim.keymap.set('n', '<C-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease window width' })
vim.keymap.set('n', '<C-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase window width' })

-- previous and next buffers
-- likely overridden by bufferline.lua
vim.keymap.set('n', '<S-h>', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
vim.keymap.set('n', '<S-l>', '<cmd>bnext<cr>', { desc = 'Next buffer' })
vim.keymap.set('n', '[b', '<cmd>bprevious<cr>', { desc = 'Prev buffer' })
vim.keymap.set('n', ']b', '<cmd>bnext<cr>', { desc = 'Next buffer' })

-- open new buffer & close current buffer
vim.keymap.set('n', '<leader>bn', '<cmd>enew<cr>', { desc = 'New buffer' })
vim.keymap.set('n', '<leader>bt', '<cmd>enew<cr>', { desc = 'New buffer tab' })
vim.keymap.set('n', '<leader>bd', '<cmd>bd<cr>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bq', '<cmd>bd<cr>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>bx', '<cmd>bd<cr>', { desc = 'Close buffer' })

-- clear search with <esc>
vim.keymap.set({ 'i', 'n' }, '<esc>', '<cmd>noh<cr><esc>', { desc = 'Escape and clear hlsearch' })

-- allow moving highlighted lines with J / K
vim.keymap.set('v', 'J', ":m '>+1<cr>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<cr>gv=gv")

-- when moving below line up with J, keep cursor in place
vim.keymap.set('n', 'J', 'mzJ`z')

-- keep highlighted selection when indenting
vim.keymap.set('v', '<', '<gv')
vim.keymap.set('v', '>', '>gv')

-- pasting & deleting without overwriting the clipboard buffer
vim.keymap.set('x', '<leader>p', '\"_dP')
vim.keymap.set('n', '<leader>d', '\"_d')
vim.keymap.set('v', '<leader>d', '\"_d')

-- disable Q
vim.keymap.set('n', 'Q', '<nop>')

-- substitute the currently selected word
vim.keymap.set('n', '<leader>s', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
