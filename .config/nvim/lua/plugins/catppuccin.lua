return {
  -- color scheme
  'catppuccin/nvim',
  name = 'catppuccin',
  config = function()
    -- do I need to call setup?
    require('catppuccin').setup({
      flavour = 'mocha',
      transparent_background = true,
      no_italic = true,
      -- manually enable this plugin
      indent_blankline = {
        enabled = true,
      },
    })
    vim.cmd.colorscheme 'catppuccin-mocha'
  end
}
