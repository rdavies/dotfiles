-- mini.move's defaults (down/up = <M-j>/<M-k>) overlap with LazyVim's own
-- <A-j>/<A-k> move-line keymaps (<A-x> and <M-x> are the same modifier), so
-- those are disabled here -- LazyVim's version already handles it. Only
-- left/right (<M-h>/<M-l>: shift line indent, or move a visual-block
-- selection left/right) are new, and stay on mini.move's defaults.
return {
  {
    "nvim-mini/mini.move",
    opts = {
      mappings = {
        down = "",
        up = "",
        line_down = "",
        line_up = "",
      },
    },
  },
}
