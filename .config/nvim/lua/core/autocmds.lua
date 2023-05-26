local function augroup(name)
  return vim.api.nvim_create_augroup('autocmds_' .. name, { clear = true })
end

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = augroup('resize_splits'),
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

-- resize splits if window got resized
vim.api.nvim_create_autocmd({ 'VimResized' }, {
  group = augroup('resize_splits'),
  callback = function()
    vim.cmd('tabdo wincmd =')
  end,
})

-- set .gitconfig.local files to filetype gitconfig for syntax highlighting
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
-- vim.api.nvim_create_autocmd({ 'BufEnter' }, {
  group = augroup('gitconfig.local_filetype'),
  pattern = { '.gitconfig.local' },
  callback = function()
    vim.opt_local.filetype = 'gitconfig'
  end,
})

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
  group = augroup('wrap_spell'),
  pattern = { 'gitcommit', 'markdown', 'README', '*.txt', '*.md' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
