" VIM-PLUG Setup {{{

" Automatic installation {{{
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !mkdir -p ~/.config/nvim/autoload
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  au VimEnter * PlugInstall
endif
" }}}

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')

" Plugins {{{
"Plug 'Valloric/YouCompleteMe'
Plug 'ervandew/supertab'
Plug 'Rip-Rip/clang_complete'
"Plug 'myint/clang-complete'
"Plug 'https://github.com/SirVer/ultisnips.git'
"Plug 'https://github.com/honza/vim-snippets.git'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-characterize'
"Plug 'tpope/vim-surround'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
"Plug 'kien/ctrlp.vim' , { 'on':  'CtrlPBuffer' }
Plug 'kien/ctrlp.vim'
"Plug 'junegunn/seoul256.vim'
Plug 'romainl/Apprentice'
Plug 'vim-scripts/twilight'
Plug 'fimkap/newdelek'
Plug 'fimkap/cocoa.vim'
"Plug 'rizzatti/dash.vim'
Plug 'airblade/vim-gitgutter'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'fimkap/syntastic'
Plug 'b4winckler/vim-objc'
"Plug 'vimwiki/vimwiki'
Plug 'qstrahl/vim-matchmaker'
Plug 'gregsexton/gitv'
Plug 'davidoc/taskpaper.vim'
Plug 'critiqjo/lldb.nvim'
Plug 'junegunn/goyo.vim'
Plug 'benekastah/neomake'
Plug 'mhinz/vim-grepper'
Plug 'fimkap/objc_matchbracket'
"Plug 'kurkale6ka/vim-chess'
"Plug 'tpope/vim-afterimage'
Plug 'fimkap/vim-mark'
Plug 'aklt/plantuml-syntax'
Plug 'vim-scripts/DrawIt'
Plug 'mickaobrien/vim-stackoverflow'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-commentary'
Plug 'altercation/vim-colors-solarized'
"Plug 'bbchung/Clamp'
Plug 'keith/swift.vim'
Plug 'rhysd/vim-clang-format'
Plug 'tmhedberg/SimpylFold'
Plug 'jreybert/vimagit'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'itchyny/dictionary.vim'
Plug 'Shougo/vimproc.vim'
Plug 'romainl/vim-cool'
"Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote') }
Plug 'mitsuse/autocomplete-swift'
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
set completeopt=longest,menu
set hls
set is
set diffopt=filler,vertical
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
set fillchars+=vert:\ 
let g:c_no_curly_error=1
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
colorscheme apprentice
"colorscheme newdelek
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
let g:airline_theme = 'apprentice'
"let g:airline_theme = 'papercolor'
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_symbols.readonly = ''
let g:airline_symbols.branch = ''
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_section_z = '%#__accent_bold#%4l%#__restore__#/%L [%p%%]'
"let g:airline#extensions#tabline#enabled = 1

"set laststatus=2

" File Type Settings {{{

"let g:deoplete#enable_at_startup = 1

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
            \ 'args': ["`<.clang_complete`",'--analyze','-arch\ arm64','%:p'],
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

let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']
autocmd! BufWritePost,BufEnter *.js Neomake
let g:neomake_error_sign = {
    \ 'text': '✕',
    \ 'texthl': 'ErrorMsg',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '',
    \ 'texthl': 'Special',
    \ }

let g:neomake_vim_enabled_makers = ['vint']
"autocmd! BufWritePost,BufEnter *.vim Neomake
autocmd! BufWritePost *.vim Neomake

" Syntastic Setup {{{
" getbg function {{{
" gets background of a highlighting group with fallback to SignColumn group
function! s:getbg(group)
    if has("gui_running")
        let l:mode = 'gui'
        let l:validation = '\w\+\|#\x\+'
    else
        let l:mode = 'cterm'
        let l:validation = '\w\+'
    endif

    if synIDattr(synIDtrans(hlID(a:group)), 'reverse', l:mode)
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'fg', l:mode)
    else
        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'bg', l:mode)
    endif

    if l:bg == '-1' || l:bg !~ l:validation
        if synIDattr(synIDtrans(hlID('SignColumn')), 'reverse', l:mode)
            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'fg', l:mode)
        else
            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', l:mode)
        endif
    endif

    if l:bg == '-1' || l:bg !~ l:validation
        return ''
    endif

    return l:mode . 'bg=' . l:bg
endfunction
"}}}
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
"let g:syntastic_warning_symbol = '⧍'
let g:syntastic_warning_symbol = ''

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

"highlight SyntasticWarningSign ctermfg=220 ctermbg=231 guifg=Black guibg=Yellow
"highlight SyntasticWarningSign ctermfg=220 s:getbg('SignColumn') guifg=Black guibg=Yellow
"highlight SyntasticWarningLine ctermbg=230 guibg=Yellow
highlight SyntasticErrorSign ctermfg=231 ctermbg=red guifg=White guibg=Red

"hi! link SyntasticErrorLine Visual
"hi! link SyntasticWarningLine Visual
"au VimEnter,ColorScheme * exec 'hi! SyntasticErrorSign guifg=red ctermfg=red ' . s:getbg('SyntasticErrorLine')
au VimEnter,ColorScheme * exec 'hi! SyntasticWarningSign guifg=yellow ctermfg=220 ' . s:getbg('SignColumn')
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
"nnoremap <leader>h :YcmCompleter GoToDeclaration<CR>
"nnoremap <leader>e :YcmCompleter GoToDefinitionElseDeclaration<CR>
"nnoremap <leader>d :YcmCompleter GoToDefinition<CR>
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
set makeprg=xcodebuild\ -workspace\ CellewiseHandset.xcworkspace\ -scheme\ TransferAtHomeEn\ -sdk\ iphoneos9.2\ build
set errorformat=%-G%f:%s:,%-G%f:%l:\ %#error:\ %#(Each\ undeclared\ identifier\ is\ reported\ only%.%#,%-G%f:%l:\ %#error:\ %#for\ each\ function\ it\ appears%.%#,%-GIn\ file\ included%.%#,%-G\ %#from\ %f:%l\,,%f:%l:%c:\ %trror:\ %m,%f:%l:%c:\ %tarning:\ %m,%f:%l:%c:\ %m,%f:%l:\ %trror:\ %m,%f:%l:\ %tarning:\ %m,%f:%l:\ %m

" CtrlP Setup {{{
let g:ctrlp_user_command = 'ag %s -i -l --nocolor --nogroup --hidden -g ""'
let g:ctrlp_working_path_mode = 'r'
let g:ctrlp_by_filename = 1
let g:ctrlp_max_files = 10000
let g:ctrlp_follow_symlinks = 1
let g:ctrlp_match_window = 'max:15,results:20'
nnoremap <silent> <space> :CtrlPBuffer<cr>
nnoremap <silent> <leader>pl :CtrlPLine<cr>
" }}}

 "ClangFormat Setup {{{
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
"let g:clang_format#code_style = 'chromium'
"let g:clang_format#style_options = {
"            \ "AlignTrailingComments": "true",
"            \ "AllowShortIfStatementsOnASingleLine": "false",
"            \ "BreakBeforeBraces": "Attach",
"            \ "ColumnLimit": 0,
"            \ "IndentWidth": 4,
"            \ "KeepEmptyLinesAtTheStartOfBlocks": "true",
"            \ "Language": "Cpp",
"            \ "MaxEmptyLinesToKeep": 4,
"            \ "ObjCSpaceAfterProperty": "true",
"            \ "ObjCSpaceBeforeProtocolList": "false",
"            \ "PointerBindsToType": "false",
"            \ "SpacesBeforeTrailingComments": 1,
"            \ "TabWidth": 4,
"            \ "UseTab": "Never" }

au FileType c,cpp,objc,objcpp noremap  <silent> <buffer> <leader>f :ClangFormat<cr>
au FileType c,cpp,objc,objcpp noremap! <silent> <buffer> <leader>f <c-o>:ClangFormat<cr>
" }}}

" Bookmarks setup
let g:bookmark_save_per_working_dir = 1
let g:bookmark_manage_per_buffer = 1
"let g:bookmark_auto_save = 1
let g:bookmark_sign = ''
let g:bookmark_annotation_sign = ''
highlight BookmarkSign ctermfg=27 guifg=DarkGoldenrod2

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
nnoremap <leader>G :Goyo<CR>
nmap     <Leader>gs :Gstatus<CR>gg<c-n>
nnoremap <Leader>d :Gdiff<CR>
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

:command! -nargs=* -complete=file Ag cex [] | vertical bo 50 copen | Grepper! -tool ag -query <args>
":command! -nargs=* -complete=file Ag Grepper! -tool ag -query <args> | vertical bo 50 copen
nmap gk :Grepper! -tool ag -query <C-R>=expand("<cword>")<CR><CR>:vertical bo 50 copen<CR>

:command! -nargs=* -complete=file Look cex [] | vertical bo 50 copen | Grepper! -tool git -query <args>
nmap gl :Grepper! -tool git -query <C-R>=expand("<cword>")<CR><CR>:vertical bo 50 copen<CR>

nmap <Leader>gl :silent Glog -10 --<CR>:cwindow<CR>

"nmap gb :call ClangUpdateQuickFix()<CR>: cwindow<CR>

" fold ObjC
nmap [z :so ~/.vim/objcfold.vim<CR>zr

highlight Matchmaker guibg=aquamarine1

" Copy to clipboard
vnoremap  <leader>y  "+y

nnoremap <BS> :e #<CR>
" Hide tilde (sideeffect - hides all special symbols)
"hi NonText ctermfg=231
hi NonText ctermfg=234

" Terminal
nnoremap <leader>t :below 15sp term:///bin/bash<cr>i
tnoremap <F1> <C-\><C-n>

" QuickLook in CtrlP
let g:ctrlp_buffer_func = { 'enter': 'CtrlpMaps' }

func! CtrlpMaps()
    nnoremap <buffer> <silent> <c-q> :call <sid>QuickLook()<cr>
endfunc

func! s:QuickLook()
    let line = getline('.')
    let l:path = getcwd() . substitute(line, '> ', '/', "")
    call system("qlmanage -p 2>/dev/null '" . path . "'")
endfunc

vnoremap // y/<C-R>"<CR>
" True Color for iTerm2
if $TERM_PROGRAM == 'iTerm.app'
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
endif

" LLDB
nmap <F9> <Plug>LLBreakSwitch
nnoremap <F6> :LL step<CR>
nnoremap <F5> :LL continue<CR>
nnoremap <S-F5> :LL process interrupt<CR>

" Base64 decode and pretty print in XML
nnoremap \bd :%!python -m base64 -d<CR>:set ft=xml<CR>:%!xmllint --format -<CR>

" Paste fast in terminal from clipboard
nnoremap <S-F12> :read !pbpaste<CR>

" XML format
nmap <Leader>pxa :%!xmllint --format -<CR>

" Stack Overflow
nmap <Leader>so :StackOverflow <C-R>=expand("<cword>")<CR><CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml"
" Clamp
let g:clamp_libclang_file = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib/libclang.dylib'
let g:clamp_highlight_mode = 1
let g:clamp_autostart = 0

" Copy the current file name into clipboard (the name or the full path)
nmap ,cs :let @*=expand("%:t")<CR>
nmap ,cl :let @*=expand("%:p")<CR>

"map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

"nmap <silent> <Leader>d :!open dict://<cword><CR><CR>

if has('autocmd')
  autocmd VimEnter * nested
        \ if !argc() && empty(v:this_session) && filereadable('Session.vim') && !&modified |
        \   source Session.vim |
        \ endif
endif
