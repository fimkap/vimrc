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
" Plug 'ervandew/supertab'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-characterize'
Plug 'leafgarland/typescript-vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'godlygeek/tabular'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'qstrahl/vim-matchmaker'
" Plug 'gregsexton/gitv'
Plug 'davidoc/taskpaper.vim'
" Plug 'critiqjo/lldb.nvim'
Plug 'junegunn/goyo.vim'
Plug 'benekastah/neomake'
" Plug 'w0rp/ale'
Plug 'mhinz/vim-grepper'
" Plug 'fimkap/objc_matchbracket'
Plug 'tpope/vim-afterimage'
Plug 'fimkap/vim-mark'
Plug 'romainl/Apprentice', { 'branch': 'fancylines-and-neovim' }
Plug 'jacoborus/tender.vim'
Plug 'rakr/vim-one'
" Plug 'tmhedberg/SimpylFold'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'idanarye/vim-merginal'
" Plug 'junegunn/vim-pseudocl'
" Plug 'junegunn/vim-oblique'
Plug 'rust-lang/rust.vim'
Plug 'metakirby5/codi.vim'
" Plug 'Pablo1107/codi.vim', { 'branch': 'nvim-virtual-text' }
Plug 'alvan/vim-closetag'
Plug 'othree/html5.vim'
Plug 'othree/yajs.vim', { 'for' : 'javascript' }
Plug 'othree/javascript-libraries-syntax.vim'
Plug 'othree/jsdoc-syntax.vim'
Plug 'othree/es.next.syntax.vim', { 'for' : 'javascript' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
" Plug 'zchee/deoplete-jedi'
" Plug 'tweekmonster/deoplete-clang2'
" Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'blueyed/smarty.vim'
" Plug 'blueyed/vim-diminactive'
Plug 'tweekmonster/startuptime.vim'
Plug 'gcorne/phpfolding.vim'
Plug 'stephpy/vim-php-cs-fixer'
Plug 'jreybert/vimagit'
" Plug 'majutsushi/tagbar'
Plug 'beloglazov/vim-online-thesaurus'
Plug 'eugen0329/vim-esearch'
Plug 'inside/vim-search-pulse'
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
" }}}

Plug 'gabrielelana/vim-markdown'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ryanoasis/vim-devicons'
Plug 'mhartington/oceanic-next'
Plug 'jph00/swift-apple'
Plug 'google/yapf', { 'rtp': 'plugins/vim', 'for': 'python' }
Plug 'vim-vdebug/vdebug'
Plug 'tell-k/vim-autopep8'
Plug 'sheerun/vim-polyglot'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'kizza/actionmenu.nvim'
Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Plug 'lambdalisue/vim-pyenv', {'for': 'python'}
call plug#end()

let mapleader      = ' '
let maplocalleader = ' '

filetype plugin indent on

set nobackup
set nowritebackup
set noswapfile
set autoread
set signcolumn=yes
" Change sensible; wildmode default has been changed in 0.1
set nowildmenu
set wildmode=list:longest,full
set ic
set smartcase
set cpoptions+=$            " dollar sign while changing
set completeopt=longest,menu
set nohls
set is
set diffopt=filler,vertical
set shiftwidth=2
set tabstop=2
set softtabstop=2
set expandtab
set report=1
"set guifont=PT\ Mono:h12
set guifont=SourceCodePro+Powerline+Awesome\ Regular:h12
set pumheight=15            " limit popup menu height
set updatetime=750
set mousemodel=extend
set mouse=a
autocmd BufNewFile,BufRead *.swift set filetype=swift
set hid
" enable max 100000 scrollback size in terminal
set scrollback=-1
set shortmess+=c
set guicursor=n:hor10
" colorscheme apprentice
colorscheme OceanicNext

" Git Gutter Setup
let g:gitgutter_sign_added = '┃ '
let g:gitgutter_sign_modified = '┃ '
let g:gitgutter_sign_modified_removed = '┃ '
let g:gitgutter_sign_removed = '┃ '
let g:gitgutter_sign_modified_removed = '┃ '
highlight GitGutterChange ctermbg=234 ctermfg=60 guibg=bg guifg=#66004d
highlight GitGutterDelete ctermbg=234 ctermfg=131 guibg=bg guifg=#660000
highlight GitGutterChangeDelete ctermbg=234 ctermfg=60 guibg=bg guifg=#660029
highlight GitGutterAdd ctermbg=Black ctermfg=Green guibg=bg guifg=#004d00

hi link taskpaperDone Type
hi link taskpaperCancelled Type

" Airline Setup {{{
let g:airline_theme = 'onedark'
" let g:airline_theme = 'apprentice'
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#bufferline#enabled = 1
let g:airline_symbols.readonly = ''
let g:airline_symbols.branch = 'שׂ'
let g:airline_symbols.linenr = ''
let g:airline_symbols.notexists = ''
let g:airline_left_sep = ' '
let g:airline_left_alt_sep = ' '
let g:airline_right_sep = ' '
let g:airline_right_alt_sep = ' '
"let g:airline_section_z = '%#__accent_bold#%4l%#__restore__#/%L [%p%%]'
let g:airline_section_a = ''

" Neomake Setup
" let g:neomake_javascript_jshint_maker = {
"     \ 'args': ['--verbose'],
"     \ 'errorformat': '%A%f: line %l\, col %v\, %m \(%t%*\d\)',
"     \ }
let g:neomake_javascript_enabled_makers = ['eslint']
" autocmd! BufWritePost,BufEnter *.js Neomake

call neomake#configure#automake('nwi', 400)

highlight NeomakeErrorSign ctermfg=red ctermbg=234 guifg=#ff0000 guibg=bg
highlight NeomakeWarningSign ctermfg=yellow ctermbg=234 guifg=#e6e600 guibg=bg

highlight ALEErrorSign ctermfg=red ctermbg=234 guifg=#ff0000 guibg=bg
highlight ALEWarningSign ctermfg=yellow ctermbg=234 guifg=#e6e600 guibg=bg

let g:neomake_error_sign = {
    \ 'text': '',
    \ 'texthl': 'NeomakeErrorSign',
    \ }
let g:neomake_warning_sign = {
    \ 'text': '卑',
    \ 'texthl': 'NeomakeWarningSign',
    \ }

let g:neomake_php_phpcs_args_standard = "PSR2"
let g:neomake_php_enabled_makers = ['php', 'phpcs']
" let g:neomake_php_enabled_makers = ['php']
autocmd! BufWritePost *.php Neomake

let g:ale_sign_error = ''
let g:ale_sign_warning = '卑'

let g:SuperTabDefaultCompletionType = '<c-x><c-n>'
" autocmd! BufEnter *.cc,*.cpp let g:SuperTabDefaultCompletionType = '<c-x><c-u>'

" Bookmarks setup
let g:bookmark_save_per_working_dir = 1
let g:bookmark_manage_per_buffer = 1
"let g:bookmark_auto_save = 1
let g:bookmark_sign = ''
let g:bookmark_annotation_sign = ''
highlight BookmarkSign ctermfg=27 guifg=#0099ff ctermbg=234 guibg=bg
highlight BookmarkAnnotationSign ctermfg=27 guifg=#0099ff ctermbg=234 guibg=bg

" Goyo Setup {{{
let g:goyo_margin_top = 2
let g:goyo_margin_bottom = 2

nnoremap <leader>G :Goyo<CR>
nmap     <Leader>gs :Gstatus<CR>gg<c-n>
nnoremap <Leader>gd :Gdiff<CR>
" diff all
nnoremap <Leader>da :windo diffthis<CR>
" diff off (for all open windows)
nnoremap <Leader>do :windo diffoff<CR>
" }}}

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

nmap <Leader>gl :silent Glog -10 --<CR>:cwindow<CR>

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

if has('termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

" Paste fast in terminal from clipboard
nnoremap <F3> :read !pbpaste<CR>

" XML format
nmap <Leader>pxa :%!xmllint --format -<CR>
" JSON format
nmap <Leader>jf :%!python -m json.tool<CR>

let g:closetag_filenames = "*.xml,*.html,*.xhtml,*.phtml,*.tpl,*.php,*.js"

nnoremap <leader>c :cclose<bar>lclose<cr>

" let g:NERDTreeDirArrowExpandable=""
" let g:NERDTreeDirArrowCollapsible=""
let NERDTreeMinimalUI = 1

if executable('ag')
  let &grepprg = 'ag --nogroup --nocolor --column'
else
  let &grepprg = 'grep -rn $* *'
endif
command! -nargs=1 -bar Grep execute 'silent! grep! <q-args>' | redraw! | copen

command! -bang -nargs=* Cs
  \ call fzf#vim#grep(
  \   'csearch -n '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" ============================================================================
" FZF {{{
" ============================================================================
if has('nvim') || has('gui_running')
  let $FZF_DEFAULT_OPTS .= ' --inline-info'
  let g:fzf_layout = { 'down': '~60%' }
endif

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" let g:fzf_files_options =
            " \ '--preview "(termpix --width 50 --true-color {} || cat {}) 2> /dev/null "'

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

autocmd! FileType fzf
autocmd  FileType fzf set laststatus=0 noshowmode noruler
  \| autocmd BufLeave <buffer> set laststatus=2 showmode ruler

" command! Ag call fzf#vim#ag('query', {'options': '--bind ctrl-a:select-all,ctrl-d:deselect-all'})

" nnoremap <silent> <Leader><Leader> :Files<CR>
nnoremap <silent> <expr> <Leader><Leader> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":GFiles\<cr>"
nnoremap <silent> <Leader>C        :Colors<CR>
nnoremap <silent> <Leader><Enter>  :Buffers<CR>
nnoremap <silent> <Leader>l        :Lines<CR>
nnoremap <silent> <Leader>ag       :Ag <C-R><C-W><CR>
nnoremap <silent> <Leader>AG       :Ag <C-R><C-A><CR>
xnoremap <silent> <Leader>ag       y:Ag <C-R>"<CR>
nnoremap <silent> <Leader>`        :Marks<CR>
" nnoremap <silent> q: :History:<CR>
" nnoremap <silent> q/ :History/<CR>

inoremap <expr> <c-x><c-t> fzf#complete('tmuxwords.rb --all-but-current --scroll 500 --min 5')
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
inoremap <expr> <c-x><c-d> fzf#vim#complete#path('blsd')
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

function! s:plug_help_sink(line)
  let dir = g:plugs[a:line].dir
  for pat in ['doc/*.txt', 'README.md']
    let match = get(split(globpath(dir, pat), "\n"), 0, '')
    if len(match)
      execute 'tabedit' match
      return
    endif
  endfor
  tabnew
  execute 'Explore' dir
endfunction

command! PlugHelp call fzf#run(fzf#wrap({
  \ 'source': sort(keys(g:plugs)),
  \ 'sink':   function('s:plug_help_sink')}))

let s:ag_options = ' --smart-case '
command! -bang -nargs=+ -complete=dir Rag call fzf#vim#ag_raw(<q-args>, {'options': '--delimiter : --nth 4..'}, <bang>0)

let g:deoplete#enable_at_startup=1

let g:terminal_scrollback_buffer_size = 10000

nmap <Leader>gs :Gstatus<CR>
nmap <Leader>bm :bmodified<CR>

let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1

let g:deoplete#ignore_sources = get(g:, 'deoplete#ignore_sources', {})
let g:deoplete#ignore_sources.php = ['omni']
let g:deoplete#sources = {}
let g:deoplete#sources.javascript = ['buffer', 'tern']

" let g:UltiSnipsSnippetsDir = "~"
let g:DisableAutoPHPFolding = 1

autocmd FileType php setlocal commentstring=//%s

nmap <Leader>nt :NERDTreeToggle<CR>
nnoremap <silent> <Leader>v :NERDTreeFind<CR>

" coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

hi EndOfBuffer guibg=bg guifg=bg
hi VertSplit guibg=bg guifg=bg
hi LineNr guibg=bg
hi SignColumn guibg=bg

" hi Search guibg=bg guifg=fg
let g:vim_search_pulse_mode = 'pattern'
" let g:vim_search_pulse_color_list = ['#ffff1a', '#ffff33', '#ffff33', '#ffff33', '#ffff33']
" let g:vim_search_pulse_duration = 400

let g:python3_host_prog='/usr/local/bin/python3'
let g:python_host_prog='/usr/local/bin/python'

let g:Hexokinase_optInPatterns = [
\     'full_hex',
\     'triple_hex',
\     'rgb',
\     'rgba',
\     'hsl',
\     'hsla',
\     'colour_names'
\ ]
let g:Hexokinase_refreshEvents = ['BufWrite', 'BufRead', 'TextChanged', 'InsertLeave']

" if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
"   let g:coc_global_extensions += ['coc-prettier']
" endif

" if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
"   let g:coc_global_extensions += ['coc-eslint']
" endif
"
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

let g:gutentags_file_list_command = 'git ls-files'

" :h defx
" ---
" Problems? https://github.com/Shougo/defx.nvim/issues

call defx#custom#option('_', {
	\ 'resume': 1,
	\ 'winwidth': 25,
	\ 'split': 'vertical',
	\ 'direction': 'topleft',
	\ 'show_ignored_files': 0,
	\ 'columns': 'indent:git:icons:filename',
	\ 'root_marker': '',
	\ 'ignored_files':
	\     '.mypy_cache,.pytest_cache,.git,.hg,.svn,.stversions'
	\   . ',__pycache__,.sass-cache,*.egg-info,.DS_Store,*.pyc'
	\ })

call defx#custom#column('git', {
	\   'indicators': {
	\     'Modified'  : '•',
	\     'Staged'    : '✚',
	\     'Untracked' : 'ᵁ',
	\     'Renamed'   : '≫',
	\     'Unmerged'  : '≠',
	\     'Ignored'   : 'ⁱ',
	\     'Deleted'   : '✖',
	\     'Unknown'   : '⁇'
	\   }
	\ })

call defx#custom#column('mark', { 'readonly_icon': '', 'selected_icon': '' })
call defx#custom#column('filename', { 'root_marker_highlight': 'Comment' })

" defx-icons plugin
let g:defx_icons_column_length = 2
let g:defx_icons_mark_icon = ''

" Used in s:toggle_width()
let s:original_width = get(get(defx#custom#_get().option, '_'), 'winwidth')

" Events
" ---

augroup user_plugin_defx
	autocmd!

	" Define defx window mappings
	autocmd FileType defx call <SID>defx_mappings()

	" Delete defx if it's the only buffer left in the window
	autocmd WinEnter * if &filetype == 'defx' && winnr('$') == 1 | bdel | endif

	" Move focus to the next window if current buffer is defx
	autocmd TabLeave * if &filetype == 'defx' | wincmd w | endif

	" autocmd WinEnter * if &filetype ==# 'defx'
	"	\ |   silent! highlight! link CursorLine TabLineSel
	"	\ | endif
	"
	" autocmd WinLeave * if &filetype ==# 'defx'
	"	\ |   silent! highlight! link CursorLine NONE
	"	\ | endif

augroup END

" Internal functions
" ---

function! s:jump_dirty(dir) abort
	" Jump to the next position with defx-git dirty symbols
	let l:icons = get(g:, 'defx_git_indicators', {})
	let l:icons_pattern = join(values(l:icons), '\|')

	if ! empty(l:icons_pattern)
		let l:direction = a:dir > 0 ? 'w' : 'bw'
		return search(printf('\(%s\)', l:icons_pattern), l:direction)
	endif
endfunction

function! s:defx_toggle_tree() abort
	" Open current file, or toggle directory expand/collapse
	if defx#is_directory()
		return defx#do_action('open_tree', ['nested', 'toggle'])
	endif
	return defx#do_action('multi', ['drop', 'quit'])
endfunction

function! s:defx_mappings() abort
	" Defx window keyboard mappings
	setlocal signcolumn=no expandtab
	setlocal cursorline

	nnoremap <silent><buffer><expr> <CR>  <SID>defx_toggle_tree()
	nnoremap <silent><buffer><expr> e     <SID>defx_toggle_tree()
	nnoremap <silent><buffer><expr> l     <SID>defx_toggle_tree()
	nnoremap <silent><buffer><expr> h     defx#do_action('close_tree')
	nnoremap <silent><buffer><expr> t     defx#do_action('open_tree', 'recursive')
	nnoremap <silent><buffer><expr> st    defx#do_action('multi', [['drop', 'tabnew'], 'quit'])
	nnoremap <silent><buffer><expr> sg    defx#do_action('multi', [['drop', 'vsplit'], 'quit'])
	nnoremap <silent><buffer><expr> sv    defx#do_action('multi', [['drop', 'split'], 'quit'])
	nnoremap <silent><buffer><expr> P     defx#do_action('pedit')
	nnoremap <silent><buffer><expr> y     defx#do_action('yank_path')
	nnoremap <silent><buffer><expr> x     defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> gx    defx#do_action('execute_system')
	nnoremap <silent><buffer><expr> .     defx#do_action('toggle_ignored_files')

	" Defx's buffer management
	nnoremap <silent><buffer><expr> <Esc>  defx#do_action('quit')
	nnoremap <silent><buffer><expr> q      defx#do_action('quit')
	nnoremap <silent><buffer><expr> se     defx#do_action('save_session')
	nnoremap <silent><buffer><expr> <C-r>  defx#do_action('redraw')
	nnoremap <silent><buffer><expr> <C-g>  defx#do_action('print')

	" File/dir management
	nnoremap <silent><buffer><expr><nowait> c  defx#do_action('copy')
	nnoremap <silent><buffer><expr><nowait> m  defx#do_action('move')
	nnoremap <silent><buffer><expr><nowait> p  defx#do_action('paste')
	nnoremap <silent><buffer><expr><nowait> r  defx#do_action('rename')
	nnoremap <silent><buffer><expr> dd defx#do_action('remove_trash')
	nnoremap <silent><buffer><expr> K  defx#do_action('new_directory')
	nnoremap <silent><buffer><expr> N  defx#do_action('new_multiple_files')

	" Jump
	nnoremap <silent><buffer>  [g :<C-u>call <SID>jump_dirty(-1)<CR>
	nnoremap <silent><buffer>  ]g :<C-u>call <SID>jump_dirty(1)<CR>

	" Change directory
	nnoremap <silent><buffer><expr><nowait> \  defx#do_action('cd', getcwd())
	nnoremap <silent><buffer><expr><nowait> &  defx#do_action('cd', getcwd())
	nnoremap <silent><buffer><expr> <BS>  defx#async_action('cd', ['..'])
	nnoremap <silent><buffer><expr> ~     defx#async_action('cd')
	nnoremap <silent><buffer><expr> u   defx#do_action('cd', ['..'])
	nnoremap <silent><buffer><expr> 2u  defx#do_action('cd', ['../..'])
	nnoremap <silent><buffer><expr> 3u  defx#do_action('cd', ['../../..'])
	nnoremap <silent><buffer><expr> 4u  defx#do_action('cd', ['../../../..'])

	" Selection
	nnoremap <silent><buffer><expr> *  defx#do_action('toggle_select_all')
	nnoremap <silent><buffer><expr><nowait> <Space>
		\ defx#do_action('toggle_select') . 'j'

	nnoremap <silent><buffer><expr> S  defx#do_action('toggle_sort', 'Time')
	nnoremap <silent><buffer><expr> C
		\ defx#do_action('toggle_columns', 'indent:mark:filename:type:size:time')

	" Tools
	nnoremap <silent><buffer><expr> w   defx#do_action('call', '<SID>toggle_width')
	nnoremap <silent><buffer><expr> gd  defx#async_action('multi', ['drop', 'quit', ['call', '<SID>git_diff']])
	nnoremap <silent><buffer><expr> gr  defx#do_action('call', '<SID>grep')
	nnoremap <silent><buffer><expr> gf  defx#do_action('call', '<SID>find_files')
	if exists('$TMUX')
		nnoremap <silent><buffer><expr> gl  defx#async_action('call', '<SID>explorer')
	endif
endfunction

" TOOLS
" ---

function! s:git_diff(context) abort
	Gina compare
endfunction

function! s:find_files(context) abort
	" Find files in parent directory with Denite
	let l:target = a:context['targets'][0]
	let l:parent = fnamemodify(l:target, ':h')
	silent execute 'wincmd w'
	silent execute 'Denite file/rec:'.l:parent
endfunction

function! s:grep(context) abort
	" Grep in parent directory with Denite
	let l:target = a:context['targets'][0]
	let l:parent = fnamemodify(l:target, ':h')
	silent execute 'wincmd w'
	silent execute 'Denite grep:'.l:parent
endfunction

function! s:toggle_width(context) abort
	" Toggle between defx window width and longest line
	let l:max = 0
	for l:line in range(1, line('$'))
		let l:len = strdisplaywidth(substitute(getline(l:line), '\s\+$', '', ''))
		let l:max = max([l:len + 1, l:max])
	endfor
	let l:new = l:max == winwidth(0) ? s:original_width : l:max
	call defx#call_action('resize', l:new)
endfunction

function! s:explorer(context) abort
	" Open file-explorer split with tmux
	let l:explorer = s:find_file_explorer()
	if empty('$TMUX') || empty(l:explorer)
		return
	endif
	let l:target = a:context['targets'][0]
	let l:parent = fnamemodify(l:target, ':h')
	let l:cmd = 'split-window -p 30 -c ' . l:parent . ' ' . l:explorer
	silent execute '!tmux ' . l:cmd
endfunction

function! s:find_file_explorer() abort
	" Detect terminal file-explorer
	let s:file_explorer = get(g:, 'terminal_file_explorer', '')
	if empty(s:file_explorer)
		for l:explorer in ['lf', 'hunter', 'ranger', 'vifm']
			if executable(l:explorer)
				let s:file_explorer = l:explorer
				break
			endif
		endfor
	endif
	return s:file_explorer
endfunction

" vim: set ts=2 sw=2 tw=80 noet :
