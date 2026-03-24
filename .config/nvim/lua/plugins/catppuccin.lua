return {
  -- color scheme
  'catppuccin/nvim',
  name = 'catppuccin',
  -- Load the colorscheme before all other plugins so its theme files
  -- (including the lualine integration) are registered at startup.
  -- priority = 1000 is the lazy.nvim convention for colorschemes.
  lazy = false,
  priority = 1000,
  config = function()
    require('catppuccin').setup({
      flavour = 'mocha',
      transparent_background = true,
      no_italic = true,
      integrations = {
        indent_blankline = { enabled = true },
      },
    })
    vim.cmd.colorscheme 'catppuccin-mocha'
  end
}
