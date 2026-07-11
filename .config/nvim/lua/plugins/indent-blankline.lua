return {
  -- Draws thin vertical lines at indentation levels so you can see block
  -- structure at a glance. Uses the ibl (indent-blankline v3) API.
  'lukas-reineke/indent-blankline.nvim',
  -- ibl is the v3 main module name (the old "indent_blankline" module is gone)
  main = 'ibl',
  config = function()
    require('ibl').setup({
      -- Underlines the opening line of the current scope (requires treesitter)
      scope = { enabled = true },
    })
  end,
}
