set nocompatible              " required
filetype off                  " required

execute pathogen#infect()
execute pathogen#helptags()

filetype plugin indent on
set autoindent

" 
" set the leader key to ','
"
let mapleader=","


"
" handle json highlighting
"
autocmd BufNewFile,BufRead *.json set ft=javascript

augroup json_autocmd
  autocmd!
  autocmd FileType json set autoindent
  autocmd FileType json set formatoptions=tcq2l
  autocmd FileType json set textwidth=78 shiftwidth=2
  autocmd FileType json set softtabstop=2 tabstop=8
  autocmd FileType json set expandtab
  autocmd FileType json set foldmethod=syntax
augroup END

"
"required for ctrlspace
"
set nocompatible
set hidden

" 
" set vim to use the system clipboard
"
set clipboard=unnamedplus

"
" set vim color count 
"
if $COLORTERM == 'gnome-terminal'
    set t_Co=265
endif


"
" set relative line numbers in various conditions
"
set number
" au FocusLost * :set number
" au FocusGained * :set relativenumber
" 
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber

"
" add fancy bracket stuff
"
inoremap {<CR>  {<CR>}<Esc>O
inoremap [<CR>  [<CR>]<ESC>O
inoremap {{     {
inoremap {}     {}
inoremap []     []
inoremap ""     ""
inoremap ''     ''


inoremap        (  ()<Left>
inoremap <expr> )  strpart(getline('.'), col('.')-1, 1) == ")" ? "\<Right>" : ")"
inoremap <expr> ' strpart(getline('.'), col('.')-1, 1) == "\'" ? "\<Right>" : "\'\'\<Left>"

"
" set nice line at 80 , 120 and 121 chars
"
set colorcolumn=80,120,121
highlight ColorColumn ctermbg=0 guibg=lightgrey

" 
" Jedi setting to set the doc string window at the bottom
"
set splitbelow

" Python-mode settings
" " Activate rope
" " Keys:
" " K             Show python docs
" " <Ctrl-Space>  Rope autocomplete
" " <Ctrl-c>g     Rope goto definition
" " <Ctrl-c>d     Rope show documentation
" " <Ctrl-c>f     Rope find occurrences
" " <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" " [[            Jump on previous class or function (normal, visual, operator
" modes)
" " ]]            Jump on next class or function (normal, visual, operator
" modes)
" " [M            Jump on previous class or method (normal, visual, operator
" modes)
" " ]M            Jump on next class or method (normal, visual, operator
" modes)
"
"


let g:pymode_rope = 0

" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'

"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
"" Auto check on save
let pymode_lint_write = 1

" Support virtualenv
let g:pymode_virtualenv = 1

" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'

" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all

" 
" Don't autofold code
"
let g:pymode_folding = 1


" set line length highlighting to
" 120 

" let g:pymode_options_max_line_length = 120
" let g:pymode_options_colorcolumn = 0

"
" have autopep8 run on selected code when gq is pressed
"
au FileType python setlocal formatprg=autopep8\ -



"
" Not sure what this does
"
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

"
" Use <leader>l to toggle display of whitespace
"
nmap <leader>l :set list!<CR>

"
"  prefer spaces to tabs
"
set tabstop=4
set shiftwidth=4
set expandtab


"
" more subtle popup colors
"
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif

"
" remove the arrow keys in vim 
"
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

"inoremap <Up> <NOP>
"inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>



"
" airline settings
"
set laststatus=2
set ttimeoutlen=50
" let g:airline#extensions#tabline#enabled = 1

"
" set colorscheme
"

colorscheme ron
