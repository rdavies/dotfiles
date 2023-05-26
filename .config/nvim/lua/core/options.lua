vim.g.mapleader = ';'             -- setup <leader> key
vim.g.maplocalleader = ';'        -- setup <leader> key for buffer local maps

vim.opt.number = true             -- line numbers
vim.opt.shiftwidth = 2            -- spacing when using >> or <<
vim.opt.shiftround = true         -- round indent to multiple of sw with >> or <<
vim.opt.tabstop = 2               -- how many spaces tab should be
vim.opt.softtabstop = 2           -- how many spaces tab is in insert mode
vim.opt.expandtab = true          -- inserts space characters when tab is pressed
vim.opt.scrolloff = 4             -- keep at least 2 lines above/below
vim.opt.cursorline = true         -- enables line highlighting
vim.opt.confirm = true            -- prompt to save instead of failing a buffer exit
-- vim.opt.cursorlineopt = 'number'  -- make cursorline only highlight the line number
vim.opt.splitright = true         -- new vertical splits appear on the right
vim.opt.splitbelow = true         -- new horizontal splits appear on the bottom
vim.opt.showmatch = true          -- briefly jump to matching bracket upon inserting one
vim.opt.ignorecase = true         -- ignore case when searching
vim.opt.smartcase = true          -- override ignorecase when searching for upper case
vim.opt.clipboard = 'unnamedplus' -- use system clipboard
vim.opt.mouse = ''                -- mouse disabled, allows copy+paste
vim.opt.termguicolors = true      -- enable 24-bit RGB color in terminal UI
vim.opt.spelllang = { 'en_us' }   -- set locale for spell checking
vim.opt.winminwidth = 5           -- minimum window width
vim.opt.shortmess:append({ W = true, I = true, c = true, C = true }) -- avoid hit-enter prompts
vim.autowrite = true              -- auto write buffers when commands move to another file

vim.opt.swapfile = false          -- disable the creation of swap files
vim.opt.undodir = os.getenv('HOME') .. '/.vim/undodir' -- undo file location
vim.opt.undofile = true           -- save undo history to file for access across sessions
vim.opt.undolevels = 10000        -- save 10000 undos instead of 1000

-- TODO: will port these to lua eventually...
vim.cmd([[
" turn on spell checking in english locale files
autocmd BufNewFile,BufRead *.txt,*.md,README,markdown,gitcommit, setlocal spell spelllang=en_us

" highlight trailing white space
highlight ExtraWhitespace ctermbg=red guibg=red
call matchadd('ExtraWhitespace', '\s\+$')
]])
