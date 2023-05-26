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

-- wrap and check for spell in text filetypes
-- FIX: this doesn't seem to be working?

--[[
vim.api.nvim_create_autocmd('FileType', {
  group = augroup('wrap_spell'),
  pattern = { 'gitcommit', 'markdown', 'README', '*.txt', '*.md' },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})
--]]
