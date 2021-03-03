"""""""""""""""""""""""""""""""""""""""""""""""""
" My .VIMRC                                     "
" Gijs Burghoorn (@coastalwhite)                "
" Created at 19-01-2020                         "
" Mostly copied for my last vimrc               "
"""""""""""""""""""""""""""""""""""""""""""""""""


" Vimrc's looked at
"""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/mathiasbynens/dotfiles/blob/main/.vimrc
" https://github.com/amix/vimrc/blob/master/vimrcs/basic.vim
" https://github.com/amix/vimrc/blob/master/vimrcs/extended.vim
"""""""""""""""""""""""""""""""""""""""""""""""""

" Move the ugly netrwhist files to the cache folder
let g:netrw_home=$XDG_CACHE_HOME.'/vim'

set shell=/bin/bash
let mapleader="\<Space>" " Map leader to space
set nocompatible " Don't try to behave like Vi

set clipboard+=unnamedplus " Use OS clipboard by default

set title " Show file being edited in title

hi Normal ctermbg=NONE

" Colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""
let base16colorspace=256  " Access colors present in 256 colorspace
colorscheme base16-materia

" Brighter comments
call g:Base16hi("Comment", g:base16_gui09, "", g:base16_cterm09, "", "", "")
set background=dark
"""""""""""""""""""""""""""""""""""""""""""""""""

" Command line options
"""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu " Enhance command-line completion
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor
set ttyfast " Optimize for fast terminal connections
"""""""""""""""""""""""""""""""""""""""""""""""""

" VIMRC
"""""""""""""""""""""""""""""""""""""""""""""""""
set exrc " Allow for local vimrc's
set secure " Only allow secure vimrc commands

" Reload the vimrc every time you save it.
autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim
"""""""""""""""""""""""""""""""""""""""""""""""""

" Motions
"""""""""""""""""""""""""""""""""""""""""""""""""
" Jump to start and end of line using the home row keys
nnoremap <Space> ^

" Add a new line without going into insert mode
nnoremap no o<Esc>
nnoremap nO O<Esc>
"""""""""""""""""""""""""""""""""""""""""""""""""

" Hightlighting
"""""""""""""""""""""""""""""""""""""""""""""""""
" highlight last inserted text
nnoremap gV `[v`] 
"""""""""""""""""""""""""""""""""""""""""""""""""

" Buffercontrol
"""""""""""""""""""""""""""""""""""""""""""""""""
set autoread " Reload the buffer
au FocusGained,BufEnter * checktime " Check if the buffer is adjusted from the outside.

set hidden " When a buffer is abandoned, it remains loaded in the background.

" On <leader>to close all other tabs
map <leader>to :tabonly<cr> 
" On <leader>tc close current tab
map <leader>tc :tabclose<cr>
" On <leader>tn open new tab
map <leader>tn :tabnew<cr>
" On <leader>tm start the tabmove command
map <leader>tm :tabmove

" Toggling between buffers
nnoremap <leader><Tab> :b#<cr>

" Saving with Leader s
nnoremap <leader>w :w<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""

" Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""
" On <leader>ss enable spell checking for current file
map <leader>ss :setlocal spell!<cr>

" On <leader>sn go to next spelling error
map <leader>sn ]s
" On <leader>sp go to next spelling error
map <leader>sp [s
" On <leader>sa go to next spelling error
"""""""""""""""""""""""""""""""""""""""""""""""""

" Cursor and scrolling
"""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline " Hightlight current line
set scrolloff=5 " Start scrolling 5 lines before you reach bottom/top
set nostartofline " Don’t reset cursor to start of line when moving around

set mouse=a " Disable the use of the mouse
"""""""""""""""""""""""""""""""""""""""""""""""""

" Brackets
"""""""""""""""""""""""""""""""""""""""""""""""""
set showmatch " Show the matching bracket when you mouse over one
set mat=2 " How many tenths of a second to blink
"""""""""""""""""""""""""""""""""""""""""""""""""

" Turn off arrow-keys for movement
"""""""""""""""""""""""""""""""""""""""""""""""""
for key in ['<Up>', '<Down>', '<Left>', '<Right>']
	exec 'noremap' key '<Nop>'
	exec 'inoremap' key '<Nop>'
	exec 'cnoremap' key '<Nop>'
endfor
"""""""""""""""""""""""""""""""""""""""""""""""""

" Line Numbering
"""""""""""""""""""""""""""""""""""""""""""""""""
set number " Set line numbers
if exists("&relativenumber") " Check option exists
	set relativenumber
endif
"""""""""""""""""""""""""""""""""""""""""""""""""

" Search options
"""""""""""""""""""""""""""""""""""""""""""""""""
set gdefault " Add the g flag to search/replace by default
set ignorecase " Ignore case while searching
set hlsearch " Highlight searches
set incsearch " Hightlight dynamically as we search

" turn off search highlight
nnoremap <leader>h :nohlsearch<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""

" Encoding and filter options
"""""""""""""""""""""""""""""""""""""""""""""""""
set encoding=utf-8 nobomb " Use UTF-8 without BOM
set binary " Don't add new lines at the end of file
set noeol " ^
"""""""""""""""""""""""""""""""""""""""""""""""""

" Backups, swaps and undo-dirs
"""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup " Remove backup files (we have git for that)
set noswapfile " Remove swap files
set undodir="~/.vimdid"
set undofile
"""""""""""""""""""""""""""""""""""""""""""""""""

" Modelines
"""""""""""""""""""""""""""""""""""""""""""""""""
set modeline " All custom settings per file
set modelines=4 " For 4 lines at the start of a file

" e.g // vim: syntax=html:ts=8
" will set the syntax to html for this file and change the tabstop to 8
"""""""""""""""""""""""""""""""""""""""""""""""""

" Bells
"""""""""""""""""""""""""""""""""""""""""""""""""
set noerrorbells " No sounds on error
set novisualbell " Remove visual errors
set tm=500 " Wait for 500ms before a sequence has to be completed
"""""""""""""""""""""""""""""""""""""""""""""""""

" Syntax processing
"""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable " Enable syntax highlighting
filetype plugin indent on " IDK...
"""""""""""""""""""""""""""""""""""""""""""""""""

" Tabs
"""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab " Use spaces instead of tabs
set smarttab " Be smart when using tabs

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai " Use the same indent as the last line
set si " Smartly indent with new scopes/blocks

" Toggle show tabs and trailing spaces
nnoremap <leader>c :set nolist!<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""

" Wrapping
"""""""""""""""""""""""""""""""""""""""""""""""""
" Linebreak on 500 characters
set lbr
set tw=500

set textwidth=80
set colorcolumn=+1

set wrap " Wrap but move by screen line
" movement by screen line instead of file line (for text wrap)
nnoremap j gj
nnoremap <down> gj
nnoremap k gk
nnoremap <up> gk
"""""""""""""""""""""""""""""""""""""""""""""""""

" Folding
"""""""""""""""""""""""""""""""""""""""""""""""""
set nofoldenable
"""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""
let g:nvim_config_root = stdpath('config')
call plug#begin(stdpath('data') . '/plugged')
" VIM ENHANCEMENTS
"
" Comment out lines
Plug 'tyru/caw.vim'

" Markdown support
Plug 'drmingdrmer/vim-syntax-markdown'

" Repeat with the dot command for other plugins
Plug 'tpope/vim-repeat'

" Surrounding text with certain characters
Plug 'tpope/vim-surround'

" Respect Snake case and camel case with word motions
Plug 'chaoren/vim-wordmotion'

" TOML Syntax support
Plug 'cespare/vim-toml'

" Fish Syntax support
Plug 'dag/vim-fish'

" Open at the place you left off except for some cases
Plug 'farmergreg/vim-lastplace'

" GIT ENHANCEMENTS
"
" Git Gutter
Plug 'airblade/vim-gitgutter'

" GUI ENHANCEMENTS

" Bar at bottom
Plug 'itchyny/lightline.vim'
" Lightline

" Highlight what you are yanking
Plug 'machakann/vim-highlightedyank'

" % commands
Plug 'andymass/vim-matchup'

" Aligning
Plug 'godlygeek/tabular'

" Moves vim root to closest git initiated dir
Plug 'airblade/vim-rooter'

" Creates a fuzzy finder with a keybinding
if $XDG_DATA_HOME != ''
    let fzf_location=$XDG_DATA_HOME.'/fzf'
else
    let fzf_location=$HOME.'/.local/share/fzf'
end
Plug 'junegunn/fzf', { 'dir': fzf_location, 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" LSP implementation
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'do': 'yarn install --frozen-lockfile' }

" Color Scheme Plugin
" This is where I get the base16 theme I use from:
" 'chriskempson/base16-vim'

" Syntactic language support
Plug 'rust-lang/rust.vim'

" Formatting of files
Plug 'sbdchd/neoformat'

" Show css color
Plug 'ap/vim-css-color'

" Repeat all commands
Plug 'tpope/vim-repeat'

" Make it easy to interact with unicode characters
Plug 'chrisbra/unicode.vim'

" Echo documentation when you use it
Plug 'Shougo/echodoc.vim'
let g:echodoc#enable_at_startup=1
set cmdheight=2

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

call plug#end()
"""""""""""""""""""""""""""""""""""""""""""""""""
" Avoid mistyping
"""""""""""""""""""""""""""""""""""""""""""""""""
" avoid mistyping commands
command! W w
command! Wq wq
command! Q q
command! Qa qa
"""""""""""""""""""""""""""""""""""""""""""""""""

" Opening files
"""""""""""""""""""""""""""""""""""""""""""""""""
" Open file (useful for HTML)
noremap <silent> <leader>o :!open %<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""

" Add specific syntax for certain files
"""""""""""""""""""""""""""""""""""""""""""""""""
" Make syntax hightlighting turn on for gitconfig files
au BufReadPost gitconfig set syntax=gitconfig

" Make syntax hightlighting turn on for shellrc files
au BufReadPost shellrc set syntax=zsh

" Make syntax hightlighting turn on for bashrc files
au BufReadPost bashrc set syntax=zsh

" Make syntax hightlighting turn on for zshrc files
au BufReadPost zshrc set syntax=zsh
"""""""""""""""""""""""""""""""""""""""""""""""""

" Map Control-L to escape
map <C-L> <Esc>
imap <C-L> <Esc>