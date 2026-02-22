return {
  -- indentation guide lines
  'lukas-reineke/indent-blankline.nvim',
  config = function()
    require('ibl').setup({
      -- use treesitter when possible
      -- use_treesitter = true, -- currently throwing an error
      -- use treesitter to determine current context
      -- show_current_context = true, -- stale, idk
      -- highlights first line of current context (reqs treesitter)
      -- show_current_context_start = true, -- stale, idk
    })
  end
}
