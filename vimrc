set nocompatible              " required 
filetype off                  " required

set encoding=utf-8

try | source $VIMRUNTIME/defaults.vim | catch | silent echo 'no defaults' | endtry

execute pathogen#infect()
execute pathogen#helptags()

set hidden

filetype plugin indent on
set autoindent

" 
" set backup and swap directory
"
set backupdir=$HOME/.vim_backup//
set directory=$HOME/.vim_backup//

set undofile
set undodir=$HOME/.vim_undo//

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
  autocmd FileType json nmap <leader>f :%!python -m json.tool
augroup END

"
" flake8 settings
"
let g:flake8_show_in_file=1 
let g:flake8_show_in_gutter=1
" run flake8 on write
autocmd BufWritePost *.py call Flake8()


" 
" autopep8 settings
"
let g:autopep8_disable_show_diff=1

"
" have autopep8 run on selected code when gq is pressed
"
au FileType python setlocal formatprg=autopep8\ -
autocmd FileType python map <buffer> <F8> :call Autopep8()<CR>


"
" remap the keys to switch windows
" 
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" 
" delimitmate options
"
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1


"
"  prefer spaces to tabs
"
set tabstop=4
set shiftwidth=4
set expandtab

"
" high light searches 
"
set hlsearch
set smartcase
set incsearch

"
" remove the arrow keys in vim 
"
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

inoremap <Up> <NOP>
inoremap <Down> <NOP>
inoremap <Left> <NOP>
inoremap <Right> <NOP>

"
" set nice line at 121 
" set highlight chars over 80
"
let &colorcolumn="121"
highlight ColorColumn ctermbg=17 guibg=lightgrey
highlight OverLength ctermbg=17 ctermfg=white guibg=lightgrey
match OverLength /\%81v.\+/

"
" remember location from last edit
"
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" 
" Jedi setting to set the doc string window at the bottom
"
set splitbelow

"
" ctrl-p settings
"
let g:ctrlp_working_path_mode='0'
if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" 
" YCM settings
"
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_python_binary_path = 'python'
map <leader>g :YcmCompleter GoTo<CR>
map <leader>d :YcmCompleter GetDoc<CR>

"
" NERDTree
"
map <C-n> :NERDTreeToggle<CR>

"
" Gundo
"
map <F5> :GundoToggle<CR>
let g:gundo_prefer_python3=1
let g:gundo_auto_preview=1 "show diff

"
" Clear search highligt
"
map <leader>, :nohlsearch<CR>

"
" split line on comma
"
map <leader>j ^f,la<CR><ESC>

"
" set 256 color
"
set t_Co=256

"
" set colorscheme
"
colorscheme xoria256 " ron

