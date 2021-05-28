nnoremap <leader>p :Neoformat<Esc>

" autoformat
autocmd BufWritePre *.tsx Neoformat
autocmd BufWritePre *.md Neoformat
autocmd BufWritePre *.mdx Neoformat
autocmd BufWritePre *.ex Neoformat
autocmd BufWritePre *.exs Neoformat
autocmd BufWritePre *.re Neoformat
autocmd BufWritePre *.rei Neoformat

" Neoformat
let g:neoformat_javascript_jsbeautify = {
        \ 'exe': 'jsbeautify',
        \ 'args': ['-s 4', '-E'],
        \ 'replace': 1,
        \ 'stdin': 1,
        \ 'env': ["DEBUG=1"],
        \ 'valid_exit_codes': [0, 23],
        \ 'no_append': 1
        \ }
let g:neoformat_enabled_javascript = ['js-beautify']
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
