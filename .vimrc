set nocompatible              " be iMproved, required
filetype off                  " required
"let mapleader = ","

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" Keep Plugin commands between vundle#begin/end.
Plugin 'ervandew/supertab'
"Plugin 'Rip-Rip/clang_complete'
Plugin 'tpope/vim-fugitive'
"Plugin 'kentaroi/cocoa.vim'
Plugin 'jlanzarotta/bufexplorer'
"Plugin 'toyamarinyon/vim-swift'
Plugin 'Keithbsmiley/swift.vim'
Plugin 'kshenoy/vim-signature'
"Plugin 'scrooloose/syntastic'
"Plugin 'terhechte/syntastic'
"Plugin 'juneedahamed/svnj.vim'
"Plugin 'qstrahl/vim-matchmaker'
Plugin 'rking/ag.vim'
Plugin 'junegunn/goyo.vim'
"Plugin 'vim-scripts/TextFormat'
"Plugin 'jerrymarino/xcodebuild.vim'
"Plugin 'bbchung/clighter'
"Plugin 'jeaye/color_coded'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-obsession'
Plugin 'Valloric/YouCompleteMe'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" YouCompleteMe Setup
"set completeopt-=preview
"let g:ycm_seed_identifiers_with_syntax = 1
"let g:ycm_autoclose_preview_window_after_insertion = 1
"let g:ycm_autoclose_preview_window_after_completion = 1

" clang
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
"let g:clang_periodic_quickfix = 1
"let g:clang_complete_copen = 1
"let g:clang_conceal_snippets=1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1

nmap <F1> 

" vim signature
nmap <F2> ]=
nmap <S-F2> [=

" buf explorer
nmap <F3> :BufExplorer<CR>

" supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-u>'
"let g:SuperTabDefaultCompletionType = '<c-n>'

" SVNJ
"let g:svnj_username="efimp"
"let g:svnj_password="efimp"

" syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"
"let g:syntastic_enable_signs=1
"let g:syntastic_objc_config_file = '.clang_complete'
"let g:syntastic_objc_checker = 'clang'
"let g:syntastic_objc_compiler = 'clang'
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
""let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0

"let g:matchmaker_enable_startup = 0

set nobackup
set nowritebackup
set noswapfile
set autoread
set wildmenu
set ic
set completeopt=menu
set hls
set is
set diffopt=filler,vertical,iwhite
set shiftwidth=4
set tabstop=4
set expandtab
set report=1
set guifont=PT\ Mono:h11
colorscheme mydelek

nmap <S-Right> :cn<CR>
nmap <S-Left> :cp<CR>

" Alternate source and header
fun! Alt()
    let matchs = matchstr(expand("%"),"h$")
    echo matchs 
    if strlen(matchs) !=0 " go to C file
        let res = bufname(expand("%:t:r") . ".m")
        if strlen(res) != 0 
            exe ":b " . res 
        else
            exe ":tag /^" . expand("%:t:r") . "\.m"
        endif
    else " go to H file
        let res = bufname(expand("%:t:r") . ".h")
        if strlen(res) != 0 
            exe ":b " . res 
        else
            exe ":tag " . expand("%:t:r") . ".h"
        endif
    endif
endfun
:command! A :call Alt()

" Global search (use 50 chars width on the right side)
nmap gl :silent Ggrep <C-R>=expand("<cword>")<CR><CR>:vertical bo 50 cwindow<CR>
:command! -nargs=+ Look :silent Ggrep <args> | vertical bo 50 cwindow

" fold ObjC
nmap [f :so ~/.vim/objcfold.vim<CR>
