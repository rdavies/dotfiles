-- LazyVim's lang.markdown extra (enabled in lua/config/lazy.lua) sets several
-- render-markdown opts away from the plugin's own defaults: no checkbox
-- styling, no heading icons (an empty `icons` table replaces the default
-- list wholesale -- vim.tbl_deep_extend treats it as a list, not a dict to
-- merge, so it doesn't just leave the default untouched), no sign-column
-- icons, and a narrower ("block" instead of "full") code block background.
-- This restores all of those to render-markdown's own defaults.
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = {
        sign = true,
        width = "full",
        right_pad = 0,
      },
      heading = {
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      checkbox = { enabled = true },
    },
  },
}
