" vimrc
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'fimkap/swift-apple-utils'
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'maralla/completor.vim'
Plug 'maralla/completor-swift', { 'for': 'swift' }
Plug 'ervandew/supertab'
Plug 'neomake/neomake' | Plug 'fimkap/neomake-swift', { 'for': 'swift' }
Plug 'inside/vim-search-pulse'
Plug 'reedes/vim-wordy'
Plug 'ap/vim-css-color'
Plug 'othree/csscomplete.vim'
Plug 'othree/html5.vim'
Plug 'othree/html5-syntax.vim'
"Plug 'vim-airline/vim-airline'
"Plug 'rafi/vim-badge'
call plug#end()

set nobackup
set nowritebackup
set noswapfile
syntax enable
" set nu
" set rnu
set signcolumn=yes
set mouse=a
set ignorecase
set shortmess+=c
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" Change cursor shape on insert (no need in NeoVim)
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

"colorscheme deep-space
"colorscheme tender
colorscheme one
set guifont=SourceCodePro+Powerline+Awesome\ Regular:h14
hi SignColumn guibg=#282828
hi PmenuSbar guifg=#d3b987 ctermfg=180 guibg=#73cef4 ctermbg=180 gui=NONE cterm=NONE
hi PmenuThumb guifg=#ffc24b ctermfg=215 guibg=Black ctermbg=215 gui=NONE cterm=NONE
hi EndOfBuffer guibg=bg guifg=bg

"set rulerformat=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"set rulerformat=%30(%{fugitive#head(7)}\ %c%V\ %p%%%)
set ruler
set hidden

let g:completor_refresh_always = 0

"let g:airline_theme = 'deep_space'
"let g:airline_theme = 'tender'
"let g:airline_powerline_fonts = 0
"if !exists('g:airline_symbols')
"  let g:airline_symbols = {}
"endif
"let g:airline#extensions#hunks#enabled = 0
"let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#bufferline#enabled = 1
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.branch = ''
"let g:airline_left_sep = ' '
"let g:airline_left_alt_sep = ' '
"let g:airline_right_sep = ' '
"let g:airline_right_alt_sep = ' '
"let g:airline_section_a = ''

let g:NERDTreeDirArrowExpandable=""
let g:NERDTreeDirArrowCollapsible=""
let NERDTreeMinimalUI = 1

set termguicolors

set pumheight=10
autocmd BufNewFile,BufRead *.swift set filetype=swift
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
"imap <buffer> <tab>  <Plug>CompletorSwiftJumpToPlaceholder
nmap <tab> <Plug>CompletorSwiftJumpToPlaceholder

nnoremap <BS> :e #<CR>
set laststatus=0
"set statusline+=%o

hi NeomakeErrorSign guibg=#282828 guifg=#ff0000
hi NeomakeWarningSign guibg=#282828 guifg=#ffff00
let g:neomake_error_sign = {
    \ 'text': '',
    \ 'texthl': 'NeomakeErrorSign',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '',
    \ 'texthl': 'NeomakeWarningSign',
    \ }

let g:vim_search_pulse_mode = 'pattern'

let g:completor_clang_binary = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/clang'

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS noci
let g:completor_css_omni_trigger = '([\w-]+|@[\w-]*|[\w-]+:\s*[\w-]*)$'
" some comments
