":let loaded_matchparen = 1
set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
let $PATH = 'C:\utils; C:\jsctags;' . $PATH
"autocmd BufRead  */VC/include/** setfiletype cpp
" comment
set nobackup
set nowritebackup
set noswapfile
set mouseshape=n:beam
set wildmenu
set selectmode=key
set mousemodel=extend
set winaltkeys=no
"set isk+=-
set iskeyword=@,48-57,_,192-255
"set keymap=russian-jcukenwin
set encoding=utf-8
" set filling chars
set fillchars=vert:\ ,fold:-
set nu
"colorscheme twilight
colorscheme mydelek
"colorscheme mac_classic
set guifont=Consolas:h10:cANSI
set printfont=Consolas:h9:cANSI
set guioptions=emg
set lines=60
set columns=200
set diffopt=filler,vertical,iwhite
set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
set completeopt=menu
map <F3> :BufExplorer<CR>
set gcr=a:blinkon0
set cindent
set cino=:0g0
set shiftwidth=4
set tabstop=4
set expandtab
set report=1
set autoread
set hls
set showcmd
set ic
" highlight status lines
hi CursorLine guibg=White
set laststatus=0
set mouse=a
set cpo-=<
filetype on
nmap [[ [[z.
nmap ]] ]]z.
nmap <F7> ]c
nmap <F8> [c
nmap <S-Right> :cn<CR>
nmap <S-Left> :cp<CR>
nmap <A-Right> :bn<CR>
nmap <A-Left> :bp<CR>
"let g:SuperTabDefaultCompletionType = "<C-X><C-N>"
"let g:SuperTabRetainCompletionType = 0
vmap // y/<C-R>"<CR>
nmap <A-e> :Exp!<CR>
"nmap <F15> :silent !start C:\PROGRA~1\imageN\imageN.exe %:p:h/<cfile><CR>
"nmap <F13> :silent !start C:\PROGRA~1\MICROS~2\Office12\WINWORD.EXE %:p/<cfile><CR>
nmap <C-Tab> w
map <A-F8> :silent !start C:\utils\ctags -R --c++-kinds=+px --fields=+iamnS --extra=+fq .<CR>
map <A-F9> :silent !start C:\utils\ctags --language-force=c++ --c++-kinds=+px --fields=+iamnS --extra=+fq -L systemfiles<CR>
map <A-F10> :silent !start C:\utils\ctags --language-force=c++ --c++-kinds=+p --fields=+iaS --extra=+fq -L systemfiles<CR>
" cscope
set csprg=C:/utils/cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cspc=1
nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap gs :cs find s <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap gc :cs find c <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>	
nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>	
nmap ge :cs find e <C-R>=expand("<cword>")<CR><CR>	
vmap <C-\>e y:cs find e <C-R>"<CR>	
vmap ge y:cs find e <C-R>"<CR>	
nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>	
nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>	


"syntax
syntax on
call pathogen#infect()
let Tlist_Ctags_Cmd = "C:/utils/ctags"
let Tlist_Show_One_File = 1
