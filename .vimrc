syntax on             " syntax highlighting

set number            " line numbers
set shiftwidth=2      " spacing when using >> or <<
set tabstop=2         " how many spaces tab should be
set softtabstop=2     " how many spaces tab is in insert mode
set expandtab         " inserts space characters when tab is pressed
set smarttab          " tab inserts spaces according to sw
set autoindent        " let vim automatically indent
set scrolloff=2       " keep at least 2 lines above/below
set cursorline        " enables line highlighting

set splitright        " new vertical splits appear on the right
set splitbelow        " new horizontal splits appear on the bottom
set showmatch         " shot matching brackets
set hlsearch          " highlight search results
set ignorecase        " ignore case when searching
set smartcase         " try to be smart about case when searching
set incsearch         " enable incremental searching
set nostartofline     " prevent cursor from changing cols when jumping lines
set clipboard=unnamedplus " use system clipboard
set mouse=            " mouse disabled, allows copy+paste
set noerrorbells      " disable annoying error chime
set wildmenu          " auto completion, e.g. :color <TAB>
set backspace=2       " delete over line breaks (if not default)

" moving cursor vertically won't skip wrapped lines
nnoremap j gj
nnoremap k gk

" set line number colors
highlight LineNr ctermfg=darkgray
" disable underlining
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLineNr ctermfg=white cterm=NONE

filetype plugin indent on    " enable built in filetype indentation via plugins

" turn on spell checking in english locale files
autocmd BufNewFile,BufRead *.txt,*.md,README,markdown,gitcommit, setlocal spell spelllang=en_us

" highlight trailing white space
highlight ExtraWhitespace ctermbg=red guibg=red
call matchadd('ExtraWhitespace', '\s\+$')
