return {
  -- status line
  'nvim-lualine/lualine.nvim',
  -- optional, enables icons in the status line
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    require('lualine').setup {
      options = {
        -- 'catppuccin' is the only valid name, it will pick
        -- the theme set in config
        theme = 'catppuccin',
        -- don't show lualine in specific filetypes / plugin windows
        disabled_filetypes = { 'undotree' }
      },
      -- disable filetype metadata on rhs UI
      sections = {
        lualine_x = {},
      },
    }
  end
}
