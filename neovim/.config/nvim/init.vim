"Plugin management
"done with vim-plug from https://github.com/junegunn/vim-plug

if ! filereadable(expand(stdpath('data') . '/site/autoload/plug.vim'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ~/.config/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin(stdpath('data'))

"Snipptes
"Plug 'SirVer/ultisnips'

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

lua require 'init'

" eye-candy
colorscheme wombat256mod

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

let mapleader = ","

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


" remove trailing whitespace on save
fun! RemoveTrailingWhitespace()
  let l:save = winsaveview()
  keeppatterns %s/\s\+$//e
  call winrestview(l:save)
endfun

augroup BIG_BLACK_BEAR
  autocmd!
  autocmd BufWritePre * :call RemoveTrailingWhitespace()
augroup END

