return {
  -- Highlights hex color strings (`#rrggbb`) with their actual color inline.
  -- TODO/FIXME/NOTE highlighting is handled by todo-comments.nvim instead.
  'echasnovski/mini.hipatterns',
  version = false,
  config = function()
    local hipatterns = require('mini.hipatterns')
    hipatterns.setup({
      highlighters = {
        hex_color = hipatterns.gen_highlighter.hex_color(),
      },
    })
  end,
}
