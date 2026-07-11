-- render-markdown.nvim: renders markdown with icons/concealment while
-- editing (headings, bullets, checkboxes, code block labels) instead of
-- showing raw markdown syntax. Needs a Nerd Font for the glyphs - already
-- covered by Alacritty's SFMono Nerd Font. Reuses the markdown/markdown_inline
-- treesitter parsers (already in treesitter.lua) and nvim-web-devicons
-- (already installed for bufferline/oil/lualine) rather than adding mini.icons.

return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('render-markdown').setup({})
  end,
}
