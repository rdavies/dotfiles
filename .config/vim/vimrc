" =============================================================================
" Basic Vim config — no plugins, safe to copy to ~/.vimrc on any server
" =============================================================================

syntax on
filetype plugin indent on

" -----------------------------------------------------------------------------
" Display
" -----------------------------------------------------------------------------
set number                 " line numbers
set cursorline             " highlight current line
set scrolloff=4            " keep 4 lines above/below cursor when scrolling
set showmatch              " briefly jump to matching bracket
set wildmenu               " command-line completion menu

" -----------------------------------------------------------------------------
" Indentation (2-space, spaces not tabs)
" -----------------------------------------------------------------------------
set expandtab              " spaces instead of tabs
set tabstop=2              " display width of a tab
set shiftwidth=2           " >> and << indent width
set softtabstop=2          " spaces inserted/removed in insert mode
set shiftround             " round indents to multiples of shiftwidth
set smarttab
set autoindent

" -----------------------------------------------------------------------------
" Search
" -----------------------------------------------------------------------------
set hlsearch               " highlight search results
set incsearch              " incremental search as you type
set ignorecase             " case-insensitive search...
set smartcase              " ...unless query contains uppercase

" clear search highlight on escape
nnoremap <Esc> :nohlsearch<CR>

" -----------------------------------------------------------------------------
" Splits
" -----------------------------------------------------------------------------
set splitright             " vertical splits open to the right
set splitbelow             " horizontal splits open below

" navigate splits with ctrl+hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" -----------------------------------------------------------------------------
" Editing
" -----------------------------------------------------------------------------
set backspace=2            " backspace over line breaks, indent, insert start
set nostartofline          " keep column position when jumping lines
set clipboard=unnamedplus  " use system clipboard
set mouse=                 " disable mouse (allows terminal copy/paste)
set confirm                " prompt to save instead of failing on :q
set swapfile               " keep swap files on servers (safer for crashes)

" don't skip visual wrapped lines
nnoremap j gj
nnoremap k gk

" keep cursor in place when joining lines
nnoremap J mzJ`z

" move selected lines up/down and re-indent
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" stay in visual mode after indent
vnoremap < <gv
vnoremap > >gv

" -----------------------------------------------------------------------------
" Misc
" -----------------------------------------------------------------------------
set noerrorbells           " no error bell sounds

" re-equalize splits on terminal resize
autocmd VimResized * wincmd =

" -----------------------------------------------------------------------------
" Spell checking — prose files only
" -----------------------------------------------------------------------------
autocmd BufNewFile,BufRead *.txt,*.md,COMMIT_EDITMSG setlocal spell spelllang=en_us wrap

" -----------------------------------------------------------------------------
" Trailing whitespace — highlight in red (normal windows only)
" -----------------------------------------------------------------------------
highlight ExtraWhitespace ctermbg=red guibg=red
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * if &buftype ==# '' | call matchadd('ExtraWhitespace', '\s\+$') | endif
