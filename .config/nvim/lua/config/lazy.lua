-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(vim.env.LAZY or lazypath)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- LazyVim core + its recommended extras (snacks picker/explorer,
    -- blink.cmp, etc. are auto-selected here -- see lazyvim.plugins.xtras)
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- mini.files bound to `-` (see lua/plugins/mini-files.lua) for
    -- edit-the-directory-like-a-buffer file management
    { import = "lazyvim.plugins.extras.editor.mini-files" },

    -- render-markdown.nvim + marksman LSP + markdownlint + preview
    -- (see lua/plugins/render-markdown.lua for the checkbox-styling tweak)
    { import = "lazyvim.plugins.extras.lang.markdown" },

    -- Alt+hjkl move visual selections / shift lines (see
    -- lua/plugins/mini-move.lua for the j/k mapping tweak)
    { import = "lazyvim.plugins.extras.editor.mini-move" },

    -- import your plugins
    { import = "plugins" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "catppuccin" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})
