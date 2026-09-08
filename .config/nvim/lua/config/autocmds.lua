-- This file is loaded after LazyVim's own default autocmds (see
-- lazyvim.config.init.M.load).

local function augroup(name)
  return vim.api.nvim_create_augroup("autocmds_" .. name, { clear = true })
end

-- Set .gitconfig.local files to filetype gitconfig for syntax highlighting
vim.api.nvim_create_autocmd({ "BufNewFile", "BufRead" }, {
  group = augroup("gitconfig_local_filetype"),
  pattern = ".gitconfig.local",
  callback = function()
    vim.opt_local.filetype = "gitconfig"
  end,
})

-- mini.files keymap tweaks. Added as a separate MiniFilesBufferCreate
-- listener (fired by the plugin itself, after its own buffer-local mappings
-- are already applied -- see mini.files' H.new_buffer -- so these safely
-- win) rather than a plugin-spec `config` override, which would clobber the
-- LazyVim extra's own config (split keymaps, dotfile toggle, etc).
vim.api.nvim_create_autocmd("User", {
  group = augroup("mini_files_keys"),
  pattern = "MiniFilesBufferCreate",
  callback = function(args)
    local buf_id = args.data.buf_id
    -- <CR> opens a file and closes the explorer (matches Enter in most other
    -- file explorers); `l` keeps its built-in behavior of opening without
    -- closing, so both are available depending on whether you want to keep
    -- browsing.
    vim.keymap.set("n", "<CR>", function()
      require("mini.files").go_in({ close_on_file = true })
    end, { buffer = buf_id, desc = "Open (and close explorer)" })

    -- Escape also closes the explorer (mini.files only binds `q` by default)
    vim.keymap.set("n", "<Esc>", function()
      require("mini.files").close()
    end, { buffer = buf_id, desc = "Close" })
  end,
})
