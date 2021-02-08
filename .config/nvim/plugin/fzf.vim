" Define the layout
let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.6 } }

" Default Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""
" Check if we are in a git directory
nnoremap <leader>f :Files<CR>
nnoremap <leader>F :BLines<CR>
nnoremap <leader>? :History<CR>
nnoremap <leader>C :Commits<CR>
nnoremap <leader>B :Buffers<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""
