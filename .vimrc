
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !mkdir -p ~/.vim/autoload
  silent !curl -fLo ~/.vim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall
endif

call plug#begin('~/.vim/plugged')
Plug 'fimkap/swift-apple-utils'
Plug 'jacoborus/tender.vim'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'maralla/completor.vim'
Plug 'maralla/completor-swift'
Plug 'ervandew/supertab'
Plug 'neomake/neomake'
Plug 'vim-airline/vim-airline'
call plug#end()

set nobackup
set nowritebackup
set noswapfile
syntax enable
set nu
set rnu
set signcolumn=yes
set mouse=a

colorscheme deep-space
"colorscheme tender
set guifont=SourceCodePro+Powerline+Awesome\ Regular:h14

let g:airline_theme = 'deep_space'
"let g:airline_theme = 'tender'
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline_symbols.readonly = ''
let g:airline_symbols.branch = ''
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
let g:airline_section_a = ''

let g:NERDTreeDirArrowExpandable=""
let g:NERDTreeDirArrowCollapsible=""

set termguicolors

set pumheight=10
autocmd BufNewFile,BufRead *.swift set filetype=swift
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
"imap <buffer> <tab>  <Plug>CompletorSwiftJumpToPlaceholder
nmap <tab> <Plug>CompletorSwiftJumpToPlaceholder

nnoremap <BS> :e #<CR>
"set laststatus=2
"set statusline+=%o

" Swift maker.
let swift_dic = {}
if filereadable('.neomake_swift')
    let lines = readfile('.neomake_swift')
    for line in lines
        let len = strlen(line)
        let eq_position = match(line, '=')
        let key = strpart(line, 0, eq_position)
        let value = strpart(line, eq_position+1, len)
        let swift_dic[key] = value
    endfor
endif
if !has_key(swift_dic, 'sdk')
    let swift_dic['sdk'] = system('xcrun --show-sdk-path')
endif
let swift_args = ['-frontend','-c'] + (has_key(swift_dic,'files') ?  split(expand(swift_dic['files'])) : []) + ['-sdk'] + split(swift_dic['sdk']) + (has_key(swift_dic,'target') ? ['-target'] + split(swift_dic['target']) : []) + ['-parse','-primary-file']

let g:neomake_swift_swiftc_maker = {
        \ 'exe' : 'swift',
        \ 'args': swift_args,
        \ 'errorformat':
            \ '%E%f:%l:%c: error: %m,' .
            \ '%W%f:%l:%c: warning: %m,' .
            \ '%Z%\s%#^~%#,' .
            \ '%-G%.%#',
        \ }
let g:neomake_swift_enabled_makers = ['swiftc']
autocmd! BufWritePost *.swift Neomake

hi NeomakeErrorSign guibg=#1b1f29 guifg=#ff0000
hi NeomakeWarningSign guibg=#1b1f29 guifg=#ffff00
let g:neomake_error_sign = {
    \ 'text': '',
    \ 'texthl': 'NeomakeErrorSign',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '',
    \ 'texthl': 'NeomakeWarningSign',
    \ }
