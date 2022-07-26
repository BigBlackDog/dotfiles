
" telescope
" Searches over files in a git folder. Note: This does not work outside a git repo folder.
nnoremap <Leader>g <cmd>lua require'telescope.builtin'.git_files{}<CR>
" Search over files in your cwd current working directory.
nnoremap <Leader>f <cmd>lua require'telescope.builtin'.find_files{}<CR>

nnoremap <Leader><Leader>b <cmd>lua require'telescope.builtin'.buffers{show_all_buffers = true}<CR>
nnoremap <Leader><Leader>r <cmd>lua require'telescope.builtin'.live_grep{}<CR>

