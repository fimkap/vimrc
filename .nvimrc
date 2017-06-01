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
"Plug 'justmao945/vim-clang'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'cfdrake/ultisnips-swift'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-characterize'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-rvm'
Plug 'vim-ruby/vim-ruby'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'bling/vim-airline'
Plug 'fimkap/newdelek'
Plug 'fimkap/cocoa.vim'
Plug 'airblade/vim-gitgutter'
Plug 'MattesGroeger/vim-bookmarks'
"Plug 'fimkap/syntastic'
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
Plug 'tpope/vim-afterimage'
Plug 'fimkap/vim-mark'
Plug 'aklt/plantuml-syntax'
Plug 'vim-scripts/DrawIt'
Plug 'mickaobrien/vim-stackoverflow'
Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim' }
Plug 'keith/swift.vim'
Plug 'tmhedberg/SimpylFold'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'idanarye/vim-merginal'
Plug 'junegunn/vim-pseudocl'
Plug 'junegunn/vim-oblique'
Plug 'rust-lang/rust.vim'
"Plug 'itchyny/calendar.vim'
Plug 'metakirby5/codi.vim'
Plug 'rakr/vim-two-firewatch'
Plug 'nathanaelkane/vim-indent-guides', { 'for' : 'haml' }
Plug 'alvan/vim-closetag'
" Plug 'osyo-manga/vim-monster'
Plug 'dhruvasagar/vim-table-mode'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim', { 'for' : 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/jsdoc-syntax.vim'
Plug 'othree/es.next.syntax.vim', { 'for' : 'javascript' }
Plug 'pangloss/vim-javascript'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'tpope/vim-sleuth'

Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
augroup nerd_loader
  autocmd!
  autocmd VimEnter * silent! autocmd! FileExplorer
  autocmd BufEnter,BufNew *
        \  if isdirectory(expand('<amatch>'))
        \|   call plug#load('nerdtree')
        \|   execute 'autocmd! nerd_loader'
        \| endif
augroup END
" Plug 'landaire/deoplete-swift', { 'for' : 'swift' }
" Plug 'mitsuse/autocomplete-swift'
" Plug 'tomasr/molokai'
" Plug 'maralla/completor.vim'
" Plug 'maralla/completor-swift'
" }}}

call plug#end()

let mapleader      = ' '
let maplocalleader = ' '

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
set mouse=a
autocmd BufNewFile,BufRead *.swift set filetype=swift
"set noshowmode
let c_no_curly_error=1
" find thw right way to cope with objc parenthesis red highlight 
hi cParenError ctermbg=231
"hi DropboxSymbol ctermfg=27 ctermbg=White guibg=White guifg=RoyalBlue3
"set laststatus=0
"set rulerformat=%30(%{fugitive#head(7)}\ %c%V\ %p%%%)
"set rulerformat=%30(%#dropboxIcon#%{IsDropbox()}%*%#Comment#%{GetGitBranch()}%*\ %l,%c%V\ %p%%%)
"set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
"set statusline+=\ %#ErrorMsg#%{neomake#statusline#LoclistStatus('NeoMk:\ ')}

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
let g:gitgutter_sign_added = '▋ '
let g:gitgutter_sign_modified = '▋ '
let g:gitgutter_sign_removed = '▋ '
let g:gitgutter_sign_modified_removed = '▋ '
"let g:gitgutter_highlight_lines    = 1
highlight GitGutterAdd ctermbg=234 ctermfg=108 guibg=#e1f8e1 guifg=#e1f8e1
"highlight GitGutterAdd ctermbg=237 ctermfg=237 guibg=#e1f8e1 guifg=#e1f8e1
highlight GitGutterChange ctermbg=234 ctermfg=60 guibg=#ffb2ff guifg=#ffb2ff
highlight GitGutterDelete ctermbg=234 ctermfg=131 guibg=#ff8080 guifg=#ff8080
highlight GitGutterChangeDelete ctermbg=234 ctermfg=60 guibg=#00afff guifg=#00afff

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
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
"let g:airline_section_z = '%#__accent_bold#%4l%#__restore__#/%L [%p%%]'
let g:airline_section_a = ''

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

" Swift maker. To be moved and based on swift filetype.
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

let g:neomake_javascript_jshint_maker = {
    \ 'args': ['--verbose'],
    \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
    \ }
let g:neomake_javascript_enabled_makers = ['jshint']
autocmd! BufWritePost,BufEnter *.js Neomake

highlight NeomakeErrorSign ctermfg=red ctermbg=234 guifg=White guibg=Red
highlight NeomakeWarningSign ctermfg=yellow ctermbg=234 guifg=White guibg=Yellow

let g:neomake_error_sign = {
    \ 'text': '',
    \ 'texthl': 'NeomakeErrorSign',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '',
    \ 'texthl': 'NeomakeWarningSign',
    \ }

" let g:neomake_vim_enabled_makers = ['vint']
"autocmd! BufWritePost,BufEnter *.vim Neomake
" autocmd! BufWritePost *.vim Neomake

" Syntastic Setup {{{
" getbg function {{{
" gets background of a highlighting group with fallback to SignColumn group
"function! s:getbg(group)
"    if has("gui_running")
"        let l:mode = 'gui'
"        let l:validation = '\w\+\|#\x\+'
"    else
"        let l:mode = 'cterm'
"        let l:validation = '\w\+'
"    endif
"
"    if synIDattr(synIDtrans(hlID(a:group)), 'reverse', l:mode)
"        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'fg', l:mode)
"    else
"        let l:bg = synIDattr(synIDtrans(hlID(a:group)), 'bg', l:mode)
"    endif
"
"    if l:bg == '-1' || l:bg !~ l:validation
"        if synIDattr(synIDtrans(hlID('SignColumn')), 'reverse', l:mode)
"            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'fg', l:mode)
"        else
"            let l:bg = synIDattr(synIDtrans(hlID('SignColumn')), 'bg', l:mode)
"        endif
"    endif
"
"    if l:bg == '-1' || l:bg !~ l:validation
"        return ''
"    endif
"
"    return l:mode . 'bg=' . l:bg
"endfunction
"}}}
" syntastic
"set statusline+=%#Search#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*
"

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

"let g:SuperTabDefaultCompletionType = '<c-x><c-u>'
let g:SuperTabDefaultCompletionType = '<c-x><c-n>'
autocmd! BufEnter *.cc,*.cpp let g:SuperTabDefaultCompletionType = '<c-x><c-u>'


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

" :command! -nargs=* -complete=file Ag cex [] | vertical bo 50 copen | Grepper! -tool ag -query <args>
":command! -nargs=* -complete=file Ag Grepper! -tool ag -query <args> | vertical bo 50 copen
"nmap gk :Grepper! -tool ag -query <C-R>=expand("<cword>")<CR><CR>:vertical bo 50 copen<CR>

:command! -nargs=* -complete=file Look cex [] | vertical bo 50 copen | Grepper -tool rg -query <args>
nmap gl :Grepper -tool rg -query <C-R>=expand("<cword>")<CR><CR>:vertical bo 50 copen<CR>

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

nmap <Leader>gl :silent Glog -10 --<CR>:cwindow<CR>

"nmap gb :call ClangUpdateQuickFix()<CR>: cwindow<CR>

" fold ObjC
nmap [z :so ~/.vim/objcfold.vim<CR>zr

highlight Matchmaker guibg=aquamarine1

" Copy to clipboard
vnoremap  <leader>y  "+y

nnoremap <BS> :e #<CR>
" Hide tilde (sideeffect - hides all special symbols)
hi NonText ctermfg=235

" Terminal
nnoremap <leader>te :below 15sp term:///bin/bash<cr>i
tnoremap <F1> <C-\><C-n>

vnoremap // y/<C-R>"<CR>
" True Color for iTerm2
"if $TERM_PROGRAM == 'iTerm.app'
"    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
"endif
if $TERM_PROGRAM == 'iTerm.app' && has("termguicolors") && has("nvim") " set true colors on NeoVim
    set t_8f=u;%lu;%lum
    set t_8b=u;%lu;%lum
    set termguicolors
endif

" LLDB
let g:lldb#sign#bp_symbol = ''
let g:lldb#sign#pc_symbol = ''
" highlight LLSelectedPCLine ctermfg=235 ctermbg=235
nmap <Leader>ll :LLsession new<CR>
nmap <Leader>md :LLmode debug<CR>
nmap <Leader>mc :LLmode code<CR>
nmap <F9> <Plug>LLBreakSwitch
nnoremap <F6> :LL step<CR>
nnoremap <F5> :LL continue<CR>
nnoremap <S-F5> :LL process interrupt<CR>

" Base64 decode and pretty print in XML
nnoremap \bd :%!python -m base64 -d<CR>:set ft=xml<CR>:%!xmllint --format -<CR>

" Paste fast in terminal from clipboard
nnoremap <F20> :read !pbpaste<CR>
nnoremap <Leader>th :%!html2haml --erb<CR>:set ft=haml<CR>
vnoremap <Leader>th :'<,'>%!html2haml --erb<CR>:set ft=haml<CR>

" XML format
nmap <Leader>pxa :%!xmllint --format -<CR>

" Stack Overflow
nmap <Leader>so :StackOverflow <C-R>=expand("<cword>")<CR><CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml"
" tagbar
"nmap <F8> :TagbarToggle<CR>
"let g:tagbar_type_swift = {
"  \ 'ctagstype': 'swift',
"  \ 'kinds' : [
"    \ 'n:Enums',
"    \ 't:Typealiases',
"    \ 'p:Protocols',
"    \ 's:Structs',
"    \ 'c:Classes',
"    \ 'f:Functions',
"    \ 'v:Variables',
"    \ 'e:Extensions'
"  \ ],
"  \ 'sort' : 0
"  \ }

nnoremap <leader>c :cclose<bar>lclose<cr>
"nnoremap <leader>l :cclose<bar>lclose<cr>

if executable('ag')
  let &grepprg = 'ag --nogroup --nocolor --column'
else
  let &grepprg = 'grep -rn $* *'
endif
command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen
" ============================================================================
" FZF {{{
" ============================================================================

if has('nvim')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  let g:fzf_layout = { 'down': '~60%' }
  " let $TERM='xterm-truecolor'
  "let $FZF_TMUX_HEIGHT = '80%'
  " let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
endif

let s:ag_options = ' --smart-case '

  " command! -bang -nargs=* Ag
  "       \ call fzf#vim#ag(
  "       \   <q-args>,
  "       \   s:ag_options,
  "       \  <bang>0 ? fzf#vim#with_preview('up:60%')
  "       \        : fzf#vim#with_preview('right:50%:hidden', '?'),
  "       \   <bang>0
  "       \ )

" File preview using CodeRay (http://coderay.rubychan.de/)
"let g:fzf_files_options =
"  \ '--preview "(coderay {} || cat {}) 2> /dev/null | head -'.&lines.'"'
" let g:fzf_files_options =
           " \ '--preview "~/truecol2.sh"'
let g:fzf_files_options =
            \ '--preview "(~/dev/termpix/bin/termpix --width 50 {} || cat {}) 2> /dev/null "'
"let g:fzf_files_options =
"            \ '--preview "(~/termpix.sh {} || (/Users/fimkap/Library/Developer/Xcode/DerivedData/Prevu-ficuumkuhdwwrxeimggukjtxinxw/Build/Products/Debug/Prevu.app/Contents/MacOS/Prevu {} > /dev/null 2>&1 &)) 2> /dev/null"'

" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Files\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

command! Plugs call fzf#run({
  \ 'source':  map(sort(keys(g:plugs)), 'g:plug_home."/".v:val'),
  \ 'options': '--delimiter / --nth -1',
  \ 'down':    '~40%',
  \ 'sink':    'Explore'})

" }}}

"autocmd VimEnter * command! -bang -nargs=* Ag
"  \ call fzf#vim#ag(<q-args>,
"  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"  \                 <bang>0)

let g:codi#interpreters = {
            \ 'swift': {
            \ 'bin': 'swift',
            \ 'prompt': '\w\+\d\+> ',
            \ },
            \ }

autocmd! BufWritePost *.rb,*.erb,*.haml Neomake

nmap <Leader>co :Econtroller<CR>
nmap <Leader>mo :Emodel<CR>
nmap <Leader>vi :Eview<CR>
nmap <Leader>sc :Eschema<CR>

let g:deoplete#enable_at_startup=1

"let g:table_mode_separator = '│'
let g:table_mode_fillchar = '━'
let g:table_mode_corner = '┿'
let g:terminal_scrollback_buffer_size = 10000

nmap <Leader>gs :Gstatus<CR>

" let g:deoplete#enable_at_startup=1
" let g:deoplete#sources#swift#daemon_autostart = 1

" call autocomplete_swift#use_toolchain('Swift_3_0')
" let g:deoplete#sources = {}
" let g:deoplete#sources.swift = ['buffer', 'swift']

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
" imap <buffer> <tab>  <Plug>CompletorSwiftJumpToPlaceholder
" map  <buffer> <tab>  <Plug>CompletorSwiftJumpToPlaceholder
