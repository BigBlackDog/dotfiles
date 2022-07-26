
" telescope
" Searches over files in a git folder. Note: This does not work outside a git repo folder.
nnoremap <Leader>tg <cmd>lua require'telescope.builtin'.git_files{}<CR>
" Search over files in your cwd current working directory.
nnoremap <Leader>tf <cmd>lua require'telescope.builtin'.find_files{}<CR>

nnoremap <Leader>tb <cmd>lua require'telescope.builtin'.buffers{show_all_buffers = true}<CR>
nnoremap <Leader>tr <cmd>lua require'telescope.builtin'.live_grep{}<CR>

