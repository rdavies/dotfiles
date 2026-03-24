-- LSP (Language Server Protocol) stack
--
-- Neovim 0.11 introduced a native LSP config API (vim.lsp.config / vim.lsp.enable)
-- that replaces the old require('lspconfig').X.setup() pattern.
-- We use two plugins here:
--
--   1. mason.nvim          — installs LSP servers locally (~/.local/share/nvim/mason/)
--   2. mason-lspconfig.nvim — registers default server configs + auto-enables them
--
-- nvim-lspconfig is NOT used — mason-lspconfig 2.x ships its own defaults and
-- registers them via vim.lsp.config() without needing lspconfig as a middleman.
--
-- Usage:
--   :Mason            — open the Mason UI to browse/install/update servers
--   :MasonInstall X   — install a specific server (e.g. :MasonInstall pyright)
--   :LspInfo          — show active LSP clients for the current buffer
--   :checkhealth lsp  — diagnose LSP setup issues

return {
  -- ────────────────────────────────────────────────────────────────────────────
  -- mason.nvim: downloads and manages LSP servers, DAP adapters, linters, etc.
  -- Nothing is installed system-wide — everything lives under ~/.local/share/nvim/mason/
  -- ────────────────────────────────────────────────────────────────────────────
  {
    'williamboman/mason.nvim',
    config = function()
      require('mason').setup({
        ui = { border = 'rounded' },
      })
    end,
  },

  -- ────────────────────────────────────────────────────────────────────────────
  -- mason-lspconfig.nvim: the bridge between mason and Neovim's LSP client.
  --
  -- With `automatic_enable = true` it:
  --   1. Registers a default vim.lsp.config() for each known server
  --   2. Calls vim.lsp.enable(server) for every server mason has installed
  --
  -- Our overrides (set via vim.lsp.config() below) are merged on top of those
  -- defaults before the server starts.
  -- ────────────────────────────────────────────────────────────────────────────
  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()

      -- ── Global capabilities override ────────────────────────────────────
      -- Apply blink.cmp's enhanced capabilities to ALL servers via the '*'
      -- wildcard. This tells servers that our editor can handle snippets,
      -- completion item resolve, etc.
      local ok, blink = pcall(require, 'blink.cmp')
      if ok then
        vim.lsp.config('*', {
          capabilities = blink.get_lsp_capabilities(),
        })
      end

      -- ── Per-server overrides ────────────────────────────────────────────
      -- vim.lsp.config() merges with the defaults registered by mason-lspconfig,
      -- so we only need to specify what differs from the defaults.

      -- lua_ls: without this, lua_ls floods your config files with "Undefined
      -- global `vim`" warnings because it doesn't know about Neovim's runtime.
      vim.lsp.config('lua_ls', {
        settings = {
          Lua = {
            runtime = { version = 'LuaJIT' }, -- Neovim embeds LuaJIT, not PUC Lua
            diagnostics = {
              -- Declare `vim` as a known global so lua_ls stops warning about it
              globals = { 'vim' },
            },
            workspace = {
              -- Make lua_ls aware of all Neovim built-in Lua modules (vim.api, etc.)
              library = vim.api.nvim_get_runtime_file('', true),
              -- Suppress the "configure your work environment?" popup
              checkThirdParty = false,
            },
          },
        },
      })

      -- ── Server installation list ────────────────────────────────────────
      require('mason-lspconfig').setup({
        -- These servers are auto-installed on first launch if not present.
        -- Add more here as needed; run :Mason to browse available servers.
        ensure_installed = {
          'lua_ls',   -- Lua (invaluable for editing this config)
          'pyright',  -- Python (static type checking + completions)
          'bashls',   -- Bash / Shell scripting
          'ts_ls',    -- TypeScript & JavaScript (ready for when you need it)
        },

        -- Automatically enable (vim.lsp.enable) every server that mason has
        -- installed, using the default + our override configs above.
        automatic_enable = true,
      })

      -- ── LSP keymaps ─────────────────────────────────────────────────────
      -- Set up keymaps only when an LSP client attaches to a buffer, so these
      -- bindings don't leak into buffers that have no language server.
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('lsp_keymaps', { clear = true }),
        callback = function(event)
          local buf = event.buf
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
          end

          -- Navigation
          map('n', 'gd', vim.lsp.buf.definition,      'LSP: Go to definition')
          map('n', 'gD', vim.lsp.buf.declaration,     'LSP: Go to declaration')
          map('n', 'gr', vim.lsp.buf.references,      'LSP: List references')
          map('n', 'gi', vim.lsp.buf.implementation,  'LSP: Go to implementation')

          -- Documentation
          -- K is the standard Vim "look up keyword" binding — we override it
          -- to show LSP hover docs (type info, signatures, docstrings)
          map('n', 'K',     vim.lsp.buf.hover,           'LSP: Hover documentation')
          map('n', '<C-k>', vim.lsp.buf.signature_help,  'LSP: Signature help')

          -- Refactoring
          map('n', '<leader>rn', vim.lsp.buf.rename,        'LSP: Rename symbol')
          map({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, 'LSP: Code action')

          -- Format via LSP (conform.nvim handles format-on-save, but this is a
          -- useful manual fallback for filetypes without a conform formatter)
          map('n', '<leader>lf', function()
            vim.lsp.buf.format({ async = true })
          end, 'LSP: Format buffer')

          -- Diagnostics (errors, warnings, hints)
          map('n', '[d',        vim.diagnostic.goto_prev,  'LSP: Previous diagnostic')
          map('n', ']d',        vim.diagnostic.goto_next,  'LSP: Next diagnostic')
          map('n', '<leader>ld', vim.diagnostic.open_float, 'LSP: Show diagnostic detail')
        end,
      })

      -- ── Diagnostic display ───────────────────────────────────────────────
      vim.diagnostic.config({
        signs = true,          -- show icons in the sign column (gutter)
        virtual_text = {
          prefix = '●',        -- bullet character before inline diagnostic messages
        },
        update_in_insert = false,  -- don't update diagnostics while typing (less noisy)
        severity_sort = true,      -- errors appear before warnings in lists
        float = { border = 'rounded' }, -- rounded border on diagnostic float windows
      })
    end,
  },
}
