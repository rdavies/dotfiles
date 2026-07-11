-- mini.ai: smarter around/inside (a/i) textobjects beyond Vim's built-ins
--
-- Adds textobjects Vim has no native concept of - e.g. daa (delete around
-- argument), dab/dib for brackets, plus builtins for quotes, function
-- calls, and tags. Also adds next/last variants (an/in/al/il) and
-- bracket-pair navigation (g[/g]).

return {
  'nvim-mini/mini.ai',
  version = false,
  config = function()
    require('mini.ai').setup()
  end,
}
