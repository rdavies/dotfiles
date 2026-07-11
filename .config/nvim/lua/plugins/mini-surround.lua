-- mini.surround: add/delete/replace surrounding pairs (quotes, brackets, tags)
--
-- Keymaps (defaults):
--   sa  add surrounding      (e.g. saiw"  -> surround inner word with ")
--   sd  delete surrounding   (e.g. sd"    -> delete surrounding ")
--   sr  replace surrounding  (e.g. sr"'   -> replace " with ')
--   sf  find surrounding (move cursor to it)
--   sh  highlight surrounding
--
-- Note: this shadows Vim's native `s` (substitute char) with a short
-- input-wait, same tradeoff every surround plugin using this prefix makes.

return {
  'nvim-mini/mini.surround',
  version = false,
  config = function()
    require('mini.surround').setup()
  end,
}
