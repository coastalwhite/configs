" Define the layout
let g:fzf_layout = { 'window': 'tabnew' }

" Default Keybindings
"""""""""""""""""""""""""""""""""""""""""""""""""
" Check if we are in a git directory
let inGitDir = system("git rev-parse --is-inside-work-tree 2> /dev/null | xargs")
if inGitDir != ""
	nnoremap <leader>f :GFiles<CR>
else
	nnoremap <leader>f :Files<CR>
endif

nnoremap <leader>F :Files<CR>
nnoremap <leader>? :History<CR>
nnoremap <leader>C :Commits<CR>
nnoremap <leader>B :Buffers<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""
