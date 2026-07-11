-- mini.indentscope: animated highlight of the indent scope under the cursor
-- (replaces indent-blankline.nvim - draws one scope at a time instead of
-- static guides at every indent level).
--
-- Keymaps (defaults):
--   ii / ai  inside/around scope textobject
--   [i / ]i  go to scope's top/bottom border

return {
  'nvim-mini/mini.indentscope',
  version = false,
  config = function()
    require('mini.indentscope').setup()
  end,
}
