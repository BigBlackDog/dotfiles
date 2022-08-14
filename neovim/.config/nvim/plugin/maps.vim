
" don't bend your fingers
inoremap jj <ESC>

" move visual blocks up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" make ,mw surround the currend word with three backticks ... MONOSPACE WORD
nmap <leader>mw viwSm```<cr>

" jump around in help
nnoremap ö <c-]>
nnoremap Ö <c-t>

" Maps to make handling windows a bit easier
"===== buffers =====
map <Leader>bd :bd<CR>
map <Leader>bD :bd!<CR>
map <Leader>bl :ls<CR>
map <Leader>bn :bn<CR>
map <Leader>bp :bp<CR>

"===== windows =====
" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

noremap <silent> <CTRL-h> :wincmd h<CR>
noremap <silent> <CTRL-j> :wincmd j<CR>
noremap <silent> <CTRL-k> :wincmd k<CR>
noremap <silent> <CTRL-l> :wincmd l<CR>

