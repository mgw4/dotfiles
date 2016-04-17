" Python specific key bindings
"

" use <leader>t to write a try block
nmap <leader>t itry:<CR>except:<CR>pass<ESC>kkA<CR>

"use <leader>m to write a main block
nmap <leader>m GA<CR><ESC>0Di<CR><CR>def main():<CR>pass<CR><CR>if __name__ == "__main__":<CR>main()<ESC>kkk^ve

" user <leader>s to generate a doc string
nmap <leader>s :Pydocstring<CR>
