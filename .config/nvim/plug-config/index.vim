" Load all plugins
""""""""""""""""""""""""""""""""""""""""
let g:nvim_config_root = stdpath('config')
call plug#begin(stdpath('data') . '/plugged')

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" VIM ENHANCEMENTS

" Comment out linest
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
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" Autocompletion framework for built-in LSP
Plug 'nvim-lua/completion-nvim'


" Color Scheme Plugin
" This is where I get the base16 theme I use from:
" 'chriskempson/base16-vim'

" Syntactic language support
" Plug 'rust-lang/rust.vim'

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
Plug 'jxnblk/vim-mdx-js'

Plug 'alexlafroscia/postcss-syntax.vim'

Plug 'rhysd/vim-grammarous'

call plug#end()
""""""""""""""""""""""""""""""""""""""""

" Additional Plugin Config imports
""""""""""""""""""""""""""""""""""""""""
source ~/.config/nvim/plug-config/lightline/base.vim

source ~/.config/nvim/plug-config/fzf/layout.vim

lua << EOF
require('lsp/base')
require('lsp/language-servers')

require('compe/base')
require('fzf-keybinds')
EOF
""""""""""""""""""""""""""""""""""""""""