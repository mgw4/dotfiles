set nocompatible              " required
filetype off                  " required

set encoding=utf-8

execute pathogen#infect()
execute pathogen#helptags()

set hidden

filetype plugin indent on
set autoindent


"
" Quickly edit/reload the vimrc file
"
nmap <silent> <leader>ev :e ~/.vimrc<CR>
nmap <silent> <leader>sv :so ~/.vimrc<CR>


"
" set colorscheme
"
colorscheme xoria256 " ron


"
" map more keys to escape
" disabled because it is too awesome 
" and causes problems when it is not enabled
"
" imap jj <ESC>
" imap jk <ESC>


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
"required for ctrlspace
"
set nocompatible
set hidden

if executable("ag")
    let g:CtrlSpaceGlobCommand = 'ag -l --nocolor -g ""'
endif

let g:CtrlSpaceSaveWorkspaceOnSwitch = 1
let g:CtrlSpaceSaveWorkspaceOnExit = 1

hi CtrlSpaceSearch guifg=#cb4b16 guibg=NONE gui=bold ctermfg=9 ctermbg=NONE term=bold cterm=bold


" 
" set vim to use the system clipboard
"
set clipboard=unnamedplus


"
" set relative line numbers in various conditions
"
set number

au FocusLost * :set number
au FocusGained * :set relativenumber
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber


"
" airline settings
"
set laststatus=2
set ttimeoutlen=50
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ctrlspace#enabled = 1
let g:CtrlSpaceStatuslineFunction = "airline#extensions#ctrlspace#statusline()"
let g:airline_powerline_fonts = 1


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
" autopep8 settings
"

let g:autopep8_disable_show_diff=1

" have autopep8 run on selected code when gq is pressed
au FileType python setlocal formatprg=autopep8\ -


" 
" jedi settings
"

" disable the auto doc string on completion
autocmd FileType python setlocal completeopt-=preview


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

" more custom bindings are in the ftplugin folder for the appropriate file
" type


" some weird option that have cropped up 
let g:netrw_dirhistmax  =10
let g:netrw_dirhist_cnt =0


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
" set quick keys to suround selected text with
"
vmap <leader>' di'<ESC>pa'<ESC>
vmap <leader>" di"<ESC>pa"<ESC>
vmap <leader>( di(<ESC>pa)<ESC>
vmap <leader>[ di[<ESC>pa]<ESC>
vmap <leader>) di(<ESC>pa)<ESC>
vmap <leader>] di[<ESC>pa]<ESC>


"
" set nice line at 121 
" set highlight chars over 80
"
let &colorcolumn="121"
highlight ColorColumn ctermbg=17 guibg=lightgrey
highlight OverLength ctermbg=17 ctermfg=white guibg=#59292
match OverLength /\%81v.\+/

"
" ultrasnips config
"

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

"
" remember location from last edit
"
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif


"
" set 256 color
"
set t_Co=256

