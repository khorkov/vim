call pathogen#infect('bundle/{}')
syntax on
filetype plugin indent on

filetype on
filetype indent on
filetype plugin on

let mapleader = " "
syntax enable

set smartindent
set wrap
set ignorecase
set hlsearch
set autoindent
set fileencoding=utf-8
set encoding=utf-8
set backspace=indent,eol,start
set ts=2 sts=2 sw=2 expandtab
set smartcase
set gdefault
set incsearch
set showmatch

set runtimepath^=~/.vim/bundle/ctrlp.vim
set runtimepath+=~/.vim/ultisnips_rep

set winwidth=84
set winheight=5
set winminheight=5
set winheight=999

set list
set listchars=tab:▸\ ,eol:¬,nbsp:⋅,trail:•
set noswapfile
set cursorline
set relativenumber
set matchpairs+=<:>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:jsx_ext_required = 0 " Allow JSX in normal JS files
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git' " Ignore node modules folder

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Scrolling
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set scrolloff=8
set sidescrolloff=15
set sidescroll=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Folds
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set foldmethod=indent   "fold based on indent
set foldnestmax=3       "deepest fold is 3 levels
set nofoldenable        "dont fold by default

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" STATUS LINE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
":set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

let g:airline_powerline_fonts = 1
let g:airline_detect_paste=1
let g:airline_left_sep='>'
let g:airline_theme='molokai'
set laststatus=2

if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Colorscheme
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call togglebg#map("<F6>")
set t_Co=256
let g:solarized_termcolors=256
set background=light
colorscheme solarized

nnoremap <leader>n :NERDTreeToggle<CR>

"""""""""""""""""""""""""
"""  RSpec 
"""""""""""""""""""""""""

map <Leader>a :call RunAllSpecs()<CR>
map <Leader>c :call RunCurrentSpecFile()<CR>

"""""""""""""""""""""""""
""  Mappings
"""""""""""""""""""""""""

map <Leader>w :w <CR>
map <Leader>q :wq <CR>
map <F2> i<CR><ESC>
map <F3> Ei<RIGHT>
map <F4> ei<RIGHT>
map <Leader>e gEi<RIGHT>
nmap <silent> <RIGHT> :cnext<CR>
nmap <silent> <RIGHT><RIGHT> :cnfile<CR><C-G>
nmap <silent> <LEFT> :sprev<CR>
nmap <silent> <LEFT><LEFT> :cpfile<CR><C-G>
nnoremap <silent> <Leader><UP> :resize +10<CR>
nnoremap <silent> <Leader><DOWN> :resize -10<CR>
nnoremap <silent> <Leader><LEFT> :vertical resize -10<CR>
nnoremap <silent> <Leader><RIGHT> :vertical resize +10<CR>
nmap <leader>gr "*gr

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" RENAME CURRENT FILE
"" """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
  let old_name = expand('%')
  let new_name = input('New file name: ', expand('%'), 'file')
  if new_name != '' && new_name != old_name
    exec ':saveas ' . new_name
    exec ':silent !rm ' . old_name
    redraw!
  endif
endfunction
map <leader>r :call RenameFile()<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" Expands "book = book, author: author" to " let(:book) = { crete(:book, author: author) }"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

function! Lettify()
  :normal! F=wicreate(:
  :normal! A)
  :normal! dd
  :normal! P
  :.s/\(\w\+\) = \(.*\)$/let(:\1) { \2 }/
  :normal ==
endfunction
:command! Lettify :call Lettify()
:map <leader>tl :Lettify<cr>


" ===== Seeing Is Believing =====
" " Assumes you have a Ruby with SiB available in the PATH
"
" " Annotate every line
nmap <leader>jb :%!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk<CR>;
"
"  " Annotate marked lines
nmap <leader>jn :%.!seeing_is_believing --timeout 12 --line-length 500 --number-of-captures 300 --alignment-strategy chunk --xmpfilter-style<CR>;
"
"  " Remove annotations
nmap <leader>jc :%.!seeing_is_believing --clean<CR>;
"
"  " Mark the current line for annotation
nmap <leader>jm A # => <Esc>
"
"  " Mark the highlighted lines for annotation
vmap <leader>jm :norm A # => <Esc>
