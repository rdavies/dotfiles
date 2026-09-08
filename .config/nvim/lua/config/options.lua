-- LazyVim's own config/options.lua sets mapleader unconditionally, and this
-- file is loaded right after it (see lazyvim.config.init.M.load), so setting
-- it here is what makes the override stick -- and it happens before any
-- <leader> keymap gets registered.
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- mouse off so terminal-native drag-to-select copies straight to the system
-- clipboard (mouse='a' would intercept drags into Neovim visual mode
-- instead, which needs an explicit `y` to actually copy)
vim.opt.mouse = ""
vim.opt.spelllang = { "en_us" } -- LazyVim defaults to { "en" }
vim.opt.cmdheight = 0 -- hide command line when not in use
vim.opt.swapfile = false -- disable the creation of swap files
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir" -- keep existing undo history location
vim.opt.softtabstop = 2 -- how many spaces tab is in insert mode
vim.opt.showmatch = true -- briefly jump to matching bracket upon inserting one
