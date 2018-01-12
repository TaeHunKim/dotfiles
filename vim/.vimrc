"NOTE : to use this .vimrc, you need to install
"TagList, NERDTree, Vundle, FuzzyFinder plugins.

"==================== VIM Set ====================="
set nu
set ai
set ts=4
set sw=4
set expandtab  "tab as space
au Bufenter *.\(c\|cpp\h\)set et
set cindent
set ignorecase
set showmode
set incsearch
set ruler
set showcmd
set smarttab
set hlsearch
set list
syntax enable
let g:syntastic_cpp_compiler_options = ' -std=c++11'

"-------------------- VIM Start With --------------"
"au VimEnter * Tlist
"au VimEnter * NERDTree

"==================== Taglist  ===================="
let Tlist_Use_Right_Window=0
let Tlist_Compact_format=1
let Tlist_Enable_Fold_column=0
let Tlist_WinWidth=50
set updatetime=100

"==================== NERDTree ===================="
let NERDTreeWinPos="left"
let NERDTreeQuitOnOpen=1
let g:NERDTRreeChDirMode=2
let NERDTreeWinSize=50
let NERDTreeShowBookmarks=1
let NERDTreeShowHidden=1
let NERDTreeShowFiles=1

"==================== HotKey ======================"
nmap <F3> :Tlist<CR>
nmap <F6> :BufExplorer<CR>
nmap <F8> :NERDTreeFind<CR>
nmap <F9> :NERDTreeToggle<CR>
nmap <F11> :call CommitTemplate()<CR>

"This totally depend on the project
"nmap <F11> :!find ./hbbtv/ ./launcher/ ./ohtv/ -iname '*.c' -o -iname '*.h' > cscope.files<CR>
"   \:!cscope -b -i cscope.files -f cscope.out<CR>
"   \:cs reset<CR>


"- replace ctags key with cscope
map <C-_> :cstag <C-R>=expand("<cword>")<CR><CR>
map g<C-]> :cs find 3 <C-R>=expand("<cword>")<CR><CR>
map g<C-\> :cs find 0 <C-R>=expand("<cword>")<CR><CR>
"================== C11 syntax  ==================="
au BufNewFile,BufRead *.cpp set syntax=cpp11

map <leader>fb :FufBuffer<CR>
map <leader>ff :FufFile **/<CR>

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'tpope/vim-fugitive'
Plugin 'L9'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"Plugin 'user/L9', {'name': 'newL9'}

Plugin 'FuzzyFinder'
Plugin 'a.vim'
Plugin 'fugitive.vim'
Plugin 'taglist.vim'
"Plugin 'minibufexpl.vim'
Plugin 'Syntastic'
"snipmate for auto complete
Plugin 'superSnipMate'
"no need to press 'ctrl+n' for autocompletion
Plugin 'AutoComplPop'
"for selecting autocompletion item by pressing tab
Plugin 'SuperTab'
"for FuzzyFinder tab
Plugin 'scrooloose/nerdtree'

Plugin 'kien/ctrlp.vim'

Plugin 'jremmen/vim-ripgrep'

"Plugin 'vim-scripts/Conque-GDB'
"
Plugin 'vim-airline/vim-airline'

Plugin 'airblade/vim-gitgutter'

Plugin 'rhysd/vim-clang-format'

Plugin 'vim-airline/vim-airline-themes'

call vundle#end()

filetype plugin indent on     " required!

"================= highlight over than 80 space =========
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/


"================== CSCOPE ==================="
if filereadable("./cscope.out")
  cs add ./cscope.out
  set cst
elseif filereadable("./cscope.out")
  cs add ../cscope.out
endif
"=================CLang-format================"

" clang-format
" map to <Leader>cf in C++ code
autocmd FileType c,cpp,objc nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType c,cpp,objc vnoremap <buffer><Leader>cf :ClangFormat<CR>
" Toggle auto formatting:
nmap <Leader>C :ClangFormatAutoToggle<CR>
let g:clang_format#style_options = {
           \ "Language" : "Cpp",
           \ "BasedOnStyle" : "WebKit",
           \ "IndentCaseLabels" : "true",
           \ "NamespaceIndentation" : "None",
           \ "Standard" : "Cpp11"}

"autocmd FileType c,cpp,objc,h ClangFormatAutoEnable

if executable('rg')
  set grepprg=rg\ --vimgrep\ --color=never
endif
     
nnoremap K :grep! "\b\s?<C-R><C-W>\b"<CR>:cw<CR>

let g:ConqueTerm_Color = 2         " 1: strip color after 200 lines, 2: always with color
let g:ConqueTerm_CloseOnEnd = 1    " close conque when program ends running
let g:ConqueTerm_StartMessages = 0 " display warning messages if conqueTerm is configured incorrectly

" for vim-airline
let g:airline#extensions#tabline#enabled = 1 " turn on buffer list
let g:airline_theme='hybrid'
set laststatus=2 " turn on bottom bar
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
nnoremap <C-S-Left> <Esc>:sbprevious<CR>
nnoremap <C-S-Right> <Esc>:sbnext<CR>
let g:airline_powerline_fonts = 1

"Lines for SAP HANA
let g:sql_type_default = 'sqlhana' 

"Lines for HANA newt
au BufNewFile,BufRead */newt/*.py set filetype=newt
au FileType newt syntax sync fromstart
