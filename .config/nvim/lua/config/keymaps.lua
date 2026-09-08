-- This file is loaded after LazyVim's own default keymaps (see
-- lazyvim.config.init.M.load: "always load lazyvim, then user file"), so
-- anything set here for the same lhs/mode wins.

-- vim-tmux-navigator override: LazyVim binds <C-hjkl> to plain window
-- navigation. Re-bind here (after LazyVim's own keymaps load) so panes and
-- splits move seamlessly across tmux too -- pairs with the tmux plugin in
-- .config/tmux/tmux.conf.
vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<cr>", { desc = "Go to Left Window" })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<cr>", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<cr>", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { desc = "Go to Right Window" })

-- open split (LazyVim also has <leader>-/<leader>| for the same thing;
-- kept for muscle memory under the <leader>w "windows" group)
vim.keymap.set("n", "<leader>w-", "<C-W>s<cr>", { desc = "Open horizontal split" })
vim.keymap.set("n", "<leader>w|", "<C-W>v<cr>", { desc = "Open vertical split" })

-- buffer management
vim.keymap.set("n", "<leader>bn", "<cmd>enew<cr>", { desc = "New buffer" })
-- force-close, discarding unsaved changes -- LazyVim's <leader>bD is a plain
-- `:bd` (no bang), so it still fails on unsaved changes; this fills that gap
vim.keymap.set("n", "<leader>bx", "<cmd>bd!<cr>", { desc = "Force-close buffer" })

-- allow moving highlighted lines with J / K
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

-- when moving below line up with J, keep cursor in place
vim.keymap.set("n", "J", "mzJ`z")

-- pasting & deleting without overwriting the clipboard buffer -- <leader>D
-- rather than <leader>d, since <leader>d is a LazyVim debug-group prefix
-- (<leader>dpp, <leader>dph) and would otherwise wait out 'timeoutlen'
-- before firing
vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without overwriting clipboard" })
vim.keymap.set("n", "<leader>D", '"_d', { desc = "Delete without overwriting clipboard" })
vim.keymap.set("v", "<leader>D", '"_d', { desc = "Delete without overwriting clipboard" })

-- disable Q
vim.keymap.set("n", "Q", "<nop>")

-- substitute the word under cursor -- on <leader>rw rather than <leader>s,
-- since <leader>s is a LazyVim search-group prefix (<leader>sg, <leader>sr,
-- ...) and would otherwise wait out 'timeoutlen' before firing
vim.keymap.set(
  "n",
  "<leader>rw",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Substitute word under cursor" }
)
