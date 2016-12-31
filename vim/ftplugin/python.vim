" Python specific key bindings
"

" load the last python command that was run on the current buffer

nmap <F4> :let cmd = input("Specify command to run on <F5>: ")<CR>
nmap <F5> :wa<CR>:execute '!'.cmd<CR>

" use <leader>t to write a try block
nmap <leader>t Otry:<CR>except:<CR>pass<ESC>kkA<CR>

"use <leader>m to write a main block
nmap <leader>m GA<CR><ESC>0Di<CR><CR>def main():<CR>pass<CR><CR>if __name__ == "__main__":<CR>main()<ESC>kkk^ve

" user <leader>s to generate a doc string
nmap <leader>a :Pydocstring<CR>

nmap <leader>s ^f,a<CR><ESC>

" 
" ipdbg break point
"
nmap <leader>b Oimport ipdb; ipdb.set_trace() # XXX Break Point<ESC>
nmap <leader>e Ofrom IPython embed; embed() # XXX Ipython embed break point<ESC>
imap <F8> <ESC><F8>

nmap <leader>d :YcmCompleter GoToDeclaration<CR>
nmap <leader>r :YcmCompleter GoToDeclaration<CR>
