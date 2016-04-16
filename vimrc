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
" set relative line numbers in various conditions
"
set number


" au FocusLost * :set number
" au FocusGained * :set relativenumber
" 
" autocmd InsertEnter * :set number
" autocmd InsertLeave * :set relativenumber




"
" airline settings
"
set laststatus=2
set ttimeoutlen=50
" let g:airline#extensions#tabline#enabled = 1

"
" SimplyFold settings
"
let g:SimpylFold_fold_docstring = 0

" 
" Jedi setting to set the doc string window at the bottom
"
set splitbelow


"
" flake8 settings
"
let g:flake8_show_in_file=1 
let g:flake8_show_in_gutter=1
" run flake8 on write
autocmd BufWritePost *.py call Flake8()

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
" remap the keys to switch windows
" 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l


" 
" disable pydocstring mapping
"
let g:pydocstring_enable_mapping = 0


" 
" set backup and swap directory
"
set backupdir=$HOME/.vim_backup//
set directory=$HOME/.vim_backup//


"
" Use <leader>l to toggle display of whitespace
"
nmap <leader>l :set list!<CR>


" use <leader>t to write a try block
nmap <leader>t itry:<CR>except:<CR>pass<ESC>kkA<CR>

"use <leader>m to write a main block
nmap <leader>m GA<CR><ESC>0Di<CR><CR>def main():<CR>pass<CR><CR>if __name__ == "__main__":<CR>main()<ESC>kkk^ve

" user <leader>s to generate a doc string
nmap <leader>s :Pydocstring<CR>


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

inoremap <Up> <NOP>
inoremap <Down> <NOP>
"inoremap <Left> <NOP>
"inoremap <Right> <NOP>



"
" set nice line at 80 , 120 and 121 chars
"
set colorcolumn=80,120,121
highlight ColorColumn ctermbg=0 guibg=lightgrey


"
" set 256 color
"
set t_Co=256


"
" set colorscheme
"
colorscheme ron

