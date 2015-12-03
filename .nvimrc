" VIM-PLUG Setup {{{

" Automatic installation {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall
endif
" }}}

call plug#begin('~/.config/nvim/plugged')

" Plugins {{{
"Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'Rip-Rip/clang_complete'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-characterize'
"Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'kien/ctrlp.vim'
"Plug 'junegunn/seoul256.vim'
Plug 'vim-scripts/twilight'
Plug 'fimkap/newdelek'
Plug 'fimkap/cocoa.vim'
Plug 'rizzatti/dash.vim'
Plug 'airblade/vim-gitgutter'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'fimkap/syntastic'
Plug 'b4winckler/vim-objc'
Plug 'vimwiki/vimwiki'
Plug 'qstrahl/vim-matchmaker'
Plug 'gregsexton/gitv'
Plug 'davidoc/taskpaper.vim'
Plug 'critiqjo/lldb.nvim'
Plug 'junegunn/goyo.vim'
Plug 'benekastah/neomake'
Plug 'mhinz/vim-grepper'
"Plug 'haifengkao/objc_matchbracket'
Plug 'kurkale6ka/vim-chess'
" }}}

call plug#end()

set nobackup
set nowritebackup
set noswapfile
set autoread
" Change sensible; wildmode default has been changed in 0.1
set nowildmenu
set wildmode=list:longest,full
set ic
set smartcase
set cpoptions+=$            " dollar sign while changing
set completeopt=menu
set hls
set is
set diffopt=filler,vertical,iwhite
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set report=1
"set guifont=PT\ Mono:h12
set guifont=SourceCodePro+Powerline+Awesome\ Regular:h12
set pumheight=15            " limit popup menu height
set updatetime=750
set mousemodel=extend
let c_no_curly_error=1
" find thw right way to cope with objc parenthesis red highlight 
hi cParenError ctermbg=231
"hi DropboxSymbol ctermfg=27 ctermbg=White guibg=White guifg=RoyalBlue3
"set laststatus=0
"set rulerformat=%30(%{fugitive#head(7)}\ %c%V\ %p%%%)
"set rulerformat=%30(%#dropboxIcon#%{IsDropbox()}%*%#Comment#%{GetGitBranch()}%*\ %l,%c%V\ %p%%%)
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P

fun! GetGitBranch()
    let head = fugitive#head(7)
    if head ==# ''
        return ''
    endif
    "let branch = '┟  '.head
    let branch = ' '.head
    return branch
endfun
fun! IsDropbox()
    let path = expand('%:p')
    if path =~ 'Dropbox'
        return '   '
        "if has("gui_running")
        "    return '⍂'
        "else
        "    return ''
        "endif
    endif
    return ''
endfun
colorscheme newdelek
"colorscheme default
"let g:seoul256_background = 235
"colors seoul256
"hi! link Conceal Normal
" }}}
"au VimEnter * set laststatus=0

" Git Gutter Setup
let g:gitgutter_sign_column_always = 1
"let g:gitgutter_highlight_lines    = 1
highlight GitGutterAdd ctermbg=158 ctermfg=158 guibg=#e1f8e1 guifg=#e1f8e1
highlight GitGutterChange ctermbg=117 ctermfg=117 guibg=#ffb2ff guifg=#ffb2ff
highlight GitGutterDelete ctermbg=196 ctermfg=196 guibg=#ff8080 guifg=#ff8080
highlight GitGutterChangeDelete ctermbg=147 ctermfg=147 guibg=#00afff guifg=#00afff

hi link taskpaperDone Type
hi link taskpaperCancelled Type

" Airline Setup {{{
let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_enable_hunks = 0
let g:airline_symbols.readonly = ''
let g:airline_symbols.branch = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = '▶'
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

"set laststatus=2

" File Type Settings {{{

" C++
"au BufNewFile,BufRead *
"            \ if expand('%:e') =~ '^\(h\|hh\|hxx\|hpp\|ii\|ixx\|ipp\|inl\|txx\|tpp\|tpl\|cc\|cxx\|cpp\)$' |
"            \   if &ft != 'cpp'                                                                           |
"            \     set ft=cpp                                                                              |
"            \   endif                                                                                     |
"            \ endif
"

" Neomake Setup
let g:neomake_objc_clang_maker = {
            \ 'exe': '/usr/bin/clang',
            \ 'args': ['-x','objective-c','-std=c99','-I/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/include','-isysroot\ /Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS9.1.sdk','-F/Users/efimpolevoi/Library/Developer/Xcode/DerivedData/CellewiseHandset-drdcscawevketifzeigwnpckmpqy/Build/Products/Debug-iphoneos','-fsyntax-only','-arch\ arm64','%:p'],
            \ 'errorformat':
            \     '%-G%f:%s:,' .
            \     '%-G%f:%l: %#error: %#(Each undeclared identifier is reported only%.%#,' .
            \     '%-G%f:%l: %#error: %#for each function it appears%.%#,' .
            \     '%-GIn file included%.%#,'.
            \     '%-G %#from %f:%l\,,' .
            \     '%f:%l:%c: %trror: %m,' .
            \     '%f:%l:%c: %tarning: %m,' .
            \     '%f:%l:%c: %m,' .
            \     '%f:%l: %trror: %m,' .
            \     '%f:%l: %tarning: %m,' .
            \     '%f:%l: %m'
            \ }
"
let g:neomake_objc_enabled_makers = ['clang']
"autocmd! BufWritePost objc Neomake

" Syntastic Setup {{{
" syntastic
set statusline+=%#Search#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
"
let g:syntastic_enable_signs=1
"let g:syntastic_objc_config_file = '.clang_complete'
""let g:syntastic_objc_checkers = ['clang']
let g:syntastic_objc_compiler = 'clang'
"let g:syntastic_objc_config_file = '.clang_complete'
let g:syntastic_objc_compiler_options = '`< .clang_complete` -fsyntax-only -arch arm64'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_objc_remove_include_errors = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = '✕'
let g:syntastic_warning_symbol = '⧍'

fun! Analyze()
    let g:syntastic_objc_compiler_options = '`< .clang_complete` --analyze -arch arm64'
    "highlight SyntasticWarningSign guifg=White guibg=RoyalBlue1
    "let g:syntastic_warning_symbol = '⤷'
    write
    let g:syntastic_objc_compiler_options = '`< .clang_complete` -fsyntax-only -arch arm64'
    "highlight SyntasticWarningSign guifg=Black guibg=yellow
    "let g:syntastic_warning_symbol = '»'
endfun
:command! Analyze :call Analyze()

highlight SyntasticWarningSign ctermfg=black ctermbg=yellow guifg=Black guibg=Yellow
highlight SyntasticErrorSign ctermfg=231 ctermbg=red guifg=White guibg=Red

"hi! link SyntasticErrorLine Visual
"hi! link SyntasticWarningLine Visual
"au VimEnter,ColorScheme * exec 'hi! SyntasticErrorSign guifg=red ctermfg=red ' . s:getbg('SyntasticErrorLine')
"au VimEnter,ColorScheme * exec 'hi! SyntasticWarningSign guifg=yellow ctermfg=yellow ' . s:getbg('SyntasticWarningLine')
"au VimEnter,ColorScheme * exec 'hi! SyntasticError ' . s:getbg('SyntasticErrorLine')
"au VimEnter,ColorScheme * exec 'hi! SyntasticWarning ' . s:getbg('SyntasticWarningLine')

"let g:syntastic_mode_map = { "mode": "active", "passive_filetypes": ["go", "html"] }
" }}}

" clang
let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
"let g:clang_auto_user_options="compile_commands.json, path, .clang_complete"
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
"let g:clang_periodic_quickfix = 1
"let g:clang_complete_copen = 1
"let g:clang_conceal_snippets=1
let g:clang_complete_macros = 1
let g:clang_complete_patterns = 1

" supertab
let g:SuperTabDefaultCompletionType = '<c-x><c-u>'
"let g:SuperTabDefaultCompletionType = '<c-n>'

" YouCompleteMe Setup {{{
set completeopt-=preview
let g:ycm_confirm_extra_conf = 0
"let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1
"let g:ycm_semantic_triggers = { 'haskell' : ['.'], 'rust' : ['::', '.'] }
nnoremap <leader>h :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>e :YcmCompleter GoToDefinitionElseDeclaration<CR>
nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
let g:ycm_semantic_triggers = {
 \ 'objc' : ['re!\@"\.*"\s',
 \ 're!\@\w+\.*\w*\s',
 \ 're!\@\(\w+\.*\w*\)\s',
 \ 're!\@\(\s*',
 \ 're!\@\[.*\]\s',
 \ 're!\@\[\s*',
 \ 're!\@\{.*\}\s',
 \ 're!\@\{\s*',
 \ "re!\@\’.*\’\s",
 \ '#ifdef ',
 \ 're!:\s*',
 \ 're!=\s*',
 \ 're!,\s*', ],
 \ }
" }}}

"set makeprg=clang\ -x\ objective-c\ \"`<\ .clang_complete`\"\ -fsyntax-only\ -arch\ arm64\ -I.\ -I..\ -Iinclude\ -Iincludes\ -I../include\ -I../includes\ %
"set makeprg=clang\ -x\ objective-c\ -fsyntax-only\ -arch\ arm64\ -I.\ -I..\ -Iinclude\ -Iincludes\ -I../include\ -I../includes\ %
set makeprg=xcodebuild\ -workspace\ CellewiseHandset.xcworkspace\ -scheme\ TransferAtHomeEn\ -sdk\ iphoneos9.1\ build
set errorformat=%-G%f:%s:,%-G%f:%l:\ %#error:\ %#(Each\ undeclared\ identifier\ is\ reported\ only%.%#,%-G%f:%l:\ %#error:\ %#for\ each\ function\ it\ appears%.%#,%-GIn\ file\ included%.%#,%-G\ %#from\ %f:%l\,,%f:%l:%c:\ %trror:\ %m,%f:%l:%c:\ %tarning:\ %m,%f:%l:%c:\ %m,%f:%l:\ %trror:\ %m,%f:%l:\ %tarning:\ %m,%f:%l:\ %m

" CtrlP Setup {{{
let g:ctrlp_user_command = 'ag %s -i -l --nocolor --nogroup --hidden -g ""'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 10000
let g:ctrlp_follow_symlinks = 1
nnoremap <silent> <space> :CtrlPBuffer<cr>
nnoremap <silent> <leader>pl :CtrlPLine<cr>
" }}}

" ClangFormat Setup {{{
"let g:clang_format#style_options = {
"            \ "AccessModifierOffset": -4,
"            \ "AllowShortLoopsOnASingleLine": "false",
"            \ "AllowShortBlocksOnASingleLine" : "false",
"            \ "AllowShortIfStatementsOnASingleLine": "false",
"            \ "AlwaysBreakTemplateDeclarations": "true",
"            \ "DerivePointerBinding": "false",
"            \ "PointerBindsToType": "false",
"            \ "ColumnLimit": 80,
"            \ "TabWidth": 4,
"            \ "Standard": "C++11" }
"au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>f :ClangFormat<cr>
"au FileType c,cpp,objc,objcpp noremap! <silent> <buffer> <leader>f <c-o>:ClangFormat<cr>
" }}}

" Bookmarks setup
let g:bookmark_save_per_working_dir = 1
let g:bookmark_manage_per_buffer = 1
"let g:bookmark_auto_save = 1
highlight BookmarkSign guifg=DarkGoldenrod2

" Goyo Setup {{{
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

"function! s:goyo_enter()
"  silent !tmux set status off
"endfunction
"
"function! s:goyo_leave()
"  silent !tmux set status on
"endfunction
"
"au! User GoyoEnter
"au! User GoyoLeave
"au  User GoyoEnter nested call <SID>goyo_enter()
"au  User GoyoLeave nested call <SID>goyo_leave()
"
nnoremap <leader>g :Goyo<CR>
" }}}

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
"nmap gl :silent Ggrep! <C-R>=expand("<cword>")<CR><CR>:vertical bo 50 cwindow<CR>
":command! -nargs=+ Look :silent Ggrep! <args> | vertical bo 50 cwindow
:command! -nargs=+ LookCached :silent Ggrep! --cached <args> | vertical bo 50 cwindow

":command! -nargs=* -complete=file Ag cex [] | vertical bo 50 copen | Grepper! -tool ag -query <args> 
:command! -nargs=* -complete=file Ag Grepper! -tool ag -query <args> | vertical bo 50 copen
nmap gk :Grepper! -tool ag -query <C-R>=expand("<cword>")<CR><CR>:vertical bo 50 copen<CR>

:command! -nargs=* -complete=file Look Grepper! -tool git -query <args> | vertical bo 50 copen
nmap gl :Grepper! -tool git -query <C-R>=expand("<cword>")<CR><CR>:vertical bo 50 copen<CR>

nmap <Leader>gl :silent Glog -10 --<CR>:cwindow<CR>

"nmap gb :call ClangUpdateQuickFix()<CR>: cwindow<CR>

" fold ObjC
nmap [z :so ~/.vim/objcfold.vim<CR>zr

highlight Matchmaker guibg=aquamarine1

" Copy to clipboard
vnoremap  <leader>y  "+y

nnoremap gm :e #<CR>
" Hide tilde (sideeffect - hides all special symbols)
hi NonText ctermfg=231
