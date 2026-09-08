-- LazyVim's lang.markdown extra (enabled in lua/config/lazy.lua) disables
-- checkbox styling by default; this restores the ☐/☑ glyphs for `- [ ]`/
-- `- [x]` task items. Headings/colors/icons are unaffected either way.
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      checkbox = { enabled = true },
    },
  },
}
