return {
  'nvim-treesitter/nvim-treesitter',
  -- Run :TSUpdate after installing/updating to keep parsers in sync
  build = ':TSUpdate',
  config = function()
    -- NOTE: the old "nvim-treesitter.configs" module was removed in the 2024
    -- nvim-treesitter rewrite. The new API is just require("nvim-treesitter").
    require('nvim-treesitter').setup({
      -- Parsers to auto-install. Add more here as needed.
      -- Run :TSInstall <lang> manually for anything not listed.
      ensure_installed = {
        -- Config / neovim internals (already had these)
        'lua', 'vim', 'vimdoc', 'c', 'query',
        -- Primary languages
        'python',     -- Python scripting
        'bash',       -- Shell scripts
        -- JS / TS (for future use)
        'javascript',
        'typescript',
        'tsx',        -- TypeScript JSX
        -- Common data / config formats
        'json',
        'yaml',
        'toml',
        -- Docs / prose
        'markdown',
        'markdown_inline', -- inline markdown (e.g. inside code blocks)
      },

      -- Install parsers synchronously when calling :TSUpdate
      -- (false is fine for most use cases — parsers install in background)
      sync_install = false,

      -- Syntax highlighting powered by treesitter (replaces vim regex)
      highlight = {
        enable = true,
        -- Disable the old vim regex engine — treesitter handles this now
        additional_vim_regex_highlighting = false,
      },

      -- Treesitter-based indentation (smarter than built-in cindent etc.)
      indent = { enable = true },
    })
  end,
}
