-- lualine.nvim is already a LazyVim default (lazyvim.plugins.ui) with a
-- richer statusline (branch, diagnostics, git diff, lazy-update indicator,
-- etc). This only swaps the theme to catppuccin and hides the statusline in
-- the undotree window -- everything else is inherited.
return {
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "catppuccin/nvim" },
    opts = function(_, opts)
      opts.options.theme = "catppuccin-mocha"
      opts.options.disabled_filetypes = opts.options.disabled_filetypes or {}
      opts.options.disabled_filetypes.statusline = opts.options.disabled_filetypes.statusline or {}
      table.insert(opts.options.disabled_filetypes.statusline, "undotree")
    end,
  },
}
