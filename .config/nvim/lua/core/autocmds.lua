local function augroup(name)
  return vim.api.nvim_create_augroup('autocmds_' .. name, { clear = true })
end

-- When the terminal window is resized, re-equalize all open splits
vim.api.nvim_create_autocmd('VimResized', {
  group = augroup('resize_splits'),
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

-- Set .gitconfig.local files to filetype gitconfig for syntax highlighting
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup('gitconfig_local_filetype'),
  pattern = '.gitconfig.local',
  callback = function()
    vim.opt_local.filetype = 'gitconfig'
  end,
})

-- Enable word wrap and spell checking in prose filetypes
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup('wrap_spell'),
  pattern = { 'gitcommit', 'markdown', 'README*', '*.txt', '*.md' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

-- Highlight trailing whitespace in red.
-- matchadd() is window-local, so we re-apply it for every new window.
-- The highlight group is re-declared after colorscheme changes since
-- colorschemes reset all highlights on load.
local tw_group = vim.api.nvim_create_augroup('autocmds_trailing_whitespace', { clear = true })

vim.api.nvim_create_autocmd('ColorScheme', {
  group = tw_group,
  callback = function()
    vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = 'red' })
  end,
})

vim.api.nvim_create_autocmd('WinNew', {
  group = tw_group,
  callback = function()
    vim.fn.matchadd('ExtraWhitespace', [[\s\+$]])
  end,
})

-- Apply to the initial window (WinNew doesn't fire for the first window)
vim.api.nvim_set_hl(0, 'ExtraWhitespace', { bg = 'red' })
vim.fn.matchadd('ExtraWhitespace', [[\s\+$]])
