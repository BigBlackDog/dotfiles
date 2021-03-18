
" this is just to make transparancy work on linux
" using i3, picom and alacritty
" I should review that and use an autocmd
" https://stackoverflow.com/questions/37712730/set-vim-background-transparent
set t_ut=
set t_Co=256
hi Normal guibg=NONE ctermbg=NONE

let g:airline_powerline_fonts = 1
set listchars=tab:»\ ,eol:¬

" line numbers - we don't want them
set nonu
set norelativenumber

"make room for linters and the like on the left
set signcolumn=yes

" no highlighting after search
set nohlsearch

" start scrolling lines before the cursor hits top or bottom
set scrolloff=8

" indenting
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent

" highlight current line
set cursorline

" utf-8 encoding
set encoding=utf8
set ffs=unix,dos "Default filetypes

" sometimes we still need the mouse
set mouse=a

" These settings are from the following Repo:
" https://github.com/nvim-lua/completion-nvim

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" hmmmm didn't do what I want
set completeopt-=preview

" Avoid showing message extra message when using completion
set shortmess+=c
