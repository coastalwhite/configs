local utils = require('utils')

-- Motions
-----------------------------------------
-- Add a new line without going into insert mode
utils.map('n', 'mo',
    '<cmd>:call append(line("."), repeat([""], v:count1))<CR>',
    { silent = true }
)
utils.map('n', 'mO',
    '<cmd>:call append(line(".")-1, repeat([""], v:count1))<CR>',
    { silent = true }
)
-----------------------------------------

-- Reformatting Lines
-- Will a paragraph and format it into the max line character limit again.
-- TODO: Replace this with a proper formatter e.g. efm-language-server
utils.map('n', '<Leader>rp', 'vipJgqq')

-- Select last inserted text
utils.map('n', 'gV', '`[v`]')

-- Toggling between buffers
utils.map('n', '<Leader><Tab>', ':b#<cr>')

-- Writing with Leader w
utils.map('n', '<Leader>w', ':w<CR>')

-- Toggling spell check
utils.map('n', '<Leader>ss', ':setlocal !spell')

-- Turn off arrow-keys for movement
-----------------------------------------
for _,key in ipairs({ '<Up>', '<Down>', '<Left>', '<Right>' })
do
	utils.map('n', key, '<Nop>')
	utils.map('i', key, '<Nop>')
end
-----------------------------------------

-- Remove all highlights
utils.map('n', '<Leader>h', '<cmd>noh<CR>') -- Clear highlights

-- Map Control-L to escape
utils.map('i', '<C-L>', '<Esc>')
utils.map('', '<C-L>', '<Esc>')

-- Toggle show tabs and trailing spaces
utils.map('n', '<Leader>c', ':set nolist!<CR>')

-- movement by screen line instead of file line (for text wrap)
utils.map('n', 'j', 'gj')
utils.map('n', '<down>', 'gj')
utils.map('n', 'k', 'gk')
utils.map('n', '<up>', 'gk')
