-- Renders markdown (headings/bullets/checkboxes/code labels) while editing.
-- Needs a Nerd Font (already have one); reuses existing treesitter parsers
-- and nvim-web-devicons instead of adding mini.icons.

return {
  'MeanderingProgrammer/render-markdown.nvim',
  ft = 'markdown',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('render-markdown').setup({})
  end,
}
