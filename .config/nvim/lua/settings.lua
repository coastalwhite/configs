local utils = require('utils')

local cmd = vim.cmd

local cache_dir = os.getenv("XDG_CACHE_HOME")
if cache_dir == '' or cache_dir == nil then
    cache_dir = os.getenv('HOME') .. '/.cache'
end

-- Autocommands
-----------------------------------------
-- Automatically turn on spell check for Markdown and Tex files.
cmd [[ au BufEnter *.md,*.tex setlocal spell ]]

-- Automatically reload the buffer when it is changed from the outside
cmd [[ au FocusGained,BufEnter * checktime ]]

-- Add specific syntax for certain files
cmd [[ au BufReadPost gitconfig set syntax=gitconfig ]]
cmd [[ au BufReadPost shellrc set syntax=bash ]]
cmd [[ au BufReadPost bashrc set syntax=bash ]]
cmd [[ au BufReadPost zshrc set syntax=zsh ]]
-----------------------------------------

-- Syntax processing
-----------------------------------------
cmd 'syntax enable' -- Enable syntax highlighting
cmd 'filetype plugin indent on' -- IDK...
-----------------------------------------

-- Buffer control
-----------------------------------------
utils.opt('b', 'autoread', true) -- Reload the buffer
utils.opt('o', 'hidden', true) -- Keep buffers loaded in the background
-----------------------------------------

utils.opt('o', 'shell', '/bin/bash')
utils.opt('o', 'clipboard', 'unnamed,unnamedplus') -- Use the OS clipboard by default

utils.opt('o', 'title', true)
utils.opt('o', 'background', 'dark')

-- Command line options
-----------------------------------------
utils.opt('o', 'wildmenu', true) -- Enchance command-line completion
-- Ignore files for command-line completion
utils.opt('o', 'wildignore', '.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor')
utils.opt('o', 'ttyfast', true) -- Optimize for fast terminal connections
-----------------------------------------

-- VIMRC
-----------------------------------------
utils.opt('o', 'exrc', true) -- Allow for local vimrc's
utils.opt('o', 'secure', true) -- Only allow secure vimrc commands
-----------------------------------------
-- Cursor and scrolling
-----------------------------------------
utils.opt('o', 'cursorline', true) -- Hightlight current line
utils.opt('o', 'scrolloff', 5) -- Start scrolling 5 lines before you reach bottom/top
utils.opt('o', 'sol', false) -- Keep cursor at horizontal position

utils.opt('o', 'mouse', 'a') -- Allow for mouse movement
-----------------------------------------

-- Matching brackets
-----------------------------------------
utils.opt('o', 'showmatch', true) -- Show the matching bracket when you mouse over one
utils.opt('o', 'mat', 2) -- How many tenths of a second to blink
-----------------------------------------

-- Line Numbering
-----------------------------------------
utils.opt('w', 'number', true) -- Set line numbers
utils.opt('w', 'relativenumber', true) -- Use relative numbers
-----------------------------------------

-- Search/replace options
-----------------------------------------
utils.opt('o', 'gdefault', true) -- Add the g flag to search/replace by default
utils.opt('o', 'ignorecase', true) -- Ignore case while searching
utils.opt('o', 'hlsearch', true) -- Highlight searches
utils.opt('o', 'incsearch', true) -- Hightlight dynamically as we search
-----------------------------------------

-- Encoding and filter options
-----------------------------------------
utils.opt('o', 'binary', true) -- Don't add new lines at the end of file
utils.opt('o', 'eol', false) -- ^
-----------------------------------------

-- Backups, swaps and undo-dirs
-----------------------------------------
utils.opt('o', 'backup', false) -- Remove backup files (we have git for that)
utils.opt('o', 'swapfile', false) -- Remove swap files

-- Add undo files and put them in the '~/.vimdid folder'
utils.opt('o', 'undodir', cache_dir .. '/vimdid')
utils.opt('o', 'undofile', true)
-----------------------------------------

-- Modelines
-----------------------------------------
utils.opt('o', 'modeline', true) -- All custom settings per file
utils.opt('o', 'modelines', 4) -- For 4 lines at the start of a file

-- e.g // vim: syntax=html:ts=8
-- will set the syntax to html for this file and change the tabstop to 8
-----------------------------------------

-- Bells
-----------------------------------------
utils.opt('o', 'errorbells', false) -- No sounds on error
utils.opt('o', 'visualbell', false) -- Remove visual errors
utils.opt('o', 'tm', 500) -- Wait for 500ms before a sequence has to be completed
-----------------------------------------

-- Tabs
-----------------------------------------
local indent = 4

utils.opt('o', 'expandtab', true) -- Use spaces instead of tabs
utils.opt('o', 'smarttab', true) -- Be smart when using tabs

-- 1 tab == 4 spaces
utils.opt('o', 'shiftwidth', indent) -- lsadkjf
utils.opt('o', 'tabstop', indent) ---

utils.opt('o', 'ai', true) -- Use the same indent as the last line
utils.opt('o', 'si', true) -- Smartly indent with new scopes/blocks
-----------------------------------------

-- Wrapping
-----------------------------------------
-- Linebreak on 500 characters
utils.opt('o', 'lbr', true)
utils.opt('o', 'tw', 500)

utils.opt('o', 'textwidth', 80)
utils.opt('o', 'colorcolumn', '+1') -- Set colored cell character after textwidth

utils.opt('o', 'wrap', true) -- Wrap but move by screen line
-----------------------------------------

-- Folding
-----------------------------------------
utils.opt('o', 'foldenable', false) -- Don't do folding
-----------------------------------------

-- Highlight on yank
cmd [[ au TextYankPost * lua vim.highlight.on_yank({ on_visual=false, timeout=500 }) ]]

-- Open a file where you left off
cmd [[ autocmd BufWinLeave *.* mkview ]]
cmd [[ autocmd BufWinEnter *.* silent! loadview ]]