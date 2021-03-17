"Plugin management
"done with vim-plug from https://github.com/junegunn/vim-plug

if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin(stdpath('data'))

"Snipptes
Plug 'SirVer/ultisnips'

"go
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries' }

" Neovim LSP Autocompletion, Diagnostic Stuff
Plug 'neovim/nvim-lsp'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/diagnostic-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'voldikss/vim-floaterm'

"telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/telescope.nvim'

"git
Plug 'tpope/vim-fugitive'

"little helpers
Plug 'tpope/vim-surround'

"statusbar
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'

"developers, developers, developers, ...
Plug 'neovim/nvim-lsp'
"Plug 'Shougo/deoplete.nvim'

"rust
"Plug 'Chiel92/vim-autoformat'

"colors
Plug 'https://github.com/vim-scripts/wombat256.vim.git'
Plug 'https://github.com/cocopon/iceberg.vim.git'
Plug 'https://github.com/fcpg/vim-orbital.git'
Plug 'https://github.com/Badacadabra/vim-archery'
Plug 'https://github.com/jacoborus/tender.vim.git'
Plug 'https://github.com/LuRsT/austere.vim.git'
Plug 'https://github.com/lmintmate/blue-mood-vim.git'
Plug 'https://github.com/thenewvu/vim-colors-blueprint.git'
Plug 'https://github.com/sasumutakahito/vim_colo_dark_green_elf.git'
Plug 'https://github.com/nightsense/snow.git'
Plug 'https://github.com/romainl/Apprentice.git'
Plug 'https://github.com/nanotech/jellybeans.vim.git'
Plug 'https://github.com/swalladge/paper.vim.git'
Plug 'https://github.com/pgdouyon/vim-yin-yang.git'
Plug 'https://github.com/fxn/vim-monochrome.git'
Plug 'https://github.com/KKPMW/distilled-vim.git'
Plug 'https://github.com/arcticicestudio/nord-vim.git'
Plug 'gruvbox-community/gruvbox'

call plug#end()

" this is just to make transparancy work on linux
" using i3, picom and alacritty
" I should review that and use an autocmd
" https://stackoverflow.com/questions/37712730/set-vim-background-transparent
set t_ut=
set t_Co=256
hi Normal guibg=NONE ctermbg=NONE

lua require 'init'

" eye-candy
colorscheme wombat256mod
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

" folding
" enable folding (https://bitcrowd.dev/folding-sections-of-markdown-in-vim)
" is said to be undocumented so far ...
let g:markdown_folding = 1
" startup markdown files with all folds open
au FileType markdown setlocal foldlevel=99

" make vim-surround ask you for input to use as surrounding
" e.g. make visual selection and hit Sm then enter ``` to make markdown code
" section
let g:surround_{char2nr('m')} = "\1Surround: \1\r\1\1"

" indent using 2 spaces
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set smartindent

" highlight current line
set cursorline

" utf-8 encoding
set encoding=utf8
set ffs=unix,dos "Default filetypes

let mapleader = ","

" don't bend your fingers
inoremap jj <ESC>

" sometimes we still need the mouse
set mouse=a

" move visual blocks up and down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" jump around in help
nnoremap ö <c-]>
nnoremap Ö <c-t>

" Maps to make handling windows a bit easier
"===== buffers =====
map <Leader>bd :bd<CR>
map <Leader>bdd :bd!<CR>
map <Leader>bl :ls<CR>
map <Leader>bn :bn<CR>
map <Leader>bp :bp<CR>

"===== windows =====
" Smart way to move btw. windows
map <C-j> <C-W>j "to the left
map <C-k> <C-W>k "up
map <C-h> <C-W>h "down
map <C-l> <C-W>l "to the right

noremap <silent> <CTRL-h> :wincmd h<CR>
noremap <silent> <CTRL-j> :wincmd j<CR>
noremap <silent> <CTRL-k> :wincmd k<CR>
noremap <silent> <CTRL-l> :wincmd l<CR>

" telescope
" Searches over files in a git folder. Note: This does not work outside a git repo folder.
nnoremap <Leader>g <cmd>lua require'telescope.builtin'.git_files{}<CR>
" Search over files in your cwd current working directory.
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.find_files{}<CR>

nnoremap <Leader>b <cmd>lua require'telescope.builtin'.buffers{show_all_buffers = true}<CR>
nnoremap <Leader>gr <cmd>lua require'telescope.builtin'.live_grep{}<CR>

" completion settings
inoremap <silent><expr> <c-p> completion#trigger_completion()

function! CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ CheckBackSpace() ? "\<TAB>" :
  \ completion#trigger_completion()

" This is very important to be loaded here
" or Tab will not work, for completion
let g:UltiSnipsExpandTrigger = "<S-Tab>"

autocmd BufEnter * lua require'completion'.on_attach()

" I either want it off, or the trigger higher | default = 1
let g:completion_trigger_keyword_length = 3

" Not Sure if I want popping Up
let g:completion_enable_auto_popup      = 1

let g:completion_enable_auto_signature  = 1

let g:completion_enable_auto_hover      = 0

let g:completion_matching_ignore_case   = 0

let g:completion_enable_snippet         = 'UltiSnips'


" :help hl-LspDiagnosticsError
highlight LspDiagnosticsError guibg=#D7001B

let g:diagnostic_enable_virtual_text = 1

let g:diagnostic_insert_delay = 1

let g:diagnostic_auto_popup_while_jump = 0

let g:diagnostic_virtual_text_prefix = ' '

let g:diagnostic_trimmed_virtual_text = '80'

let g:space_before_virtual_text = 5

let g:diagnostic_show_sign = 0

let g:diagnostic_enable_underline = 0

let g:diagnostic_sign_priority = 20



" These settings are from the following Repo:
" https://github.com/nvim-lua/completion-nvim

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" hmmmm didn't do what I want
set completeopt-=preview

" Avoid showing message extra message when using completion
set shortmess+=c
