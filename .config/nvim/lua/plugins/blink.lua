-- Disable completion entirely for prose filetypes -- the menu popping up on
-- every word (and <CR> accepting instead of making a new line, LazyVim's
-- default "enter" keymap preset) is disruptive while writing markdown,
-- plain text, or commit messages. Code/config filetypes are unaffected.
return {
  {
    "saghen/blink.cmp",
    opts = {
      enabled = function()
        return not vim.tbl_contains({ "markdown", "markdown.mdx", "text", "gitcommit" }, vim.bo.filetype)
      end,
    },
  },
}
