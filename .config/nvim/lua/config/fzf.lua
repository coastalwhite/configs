local utils = require'utils'
local fzf_lua = require'fzf-lua'

fzf_lua.setup {
  winopts = {
    win_height = 0.6,
    win_width = 0.9,
  }
}

local opts = { silent = false }

utils.map('n', '<Leader>f', ':FzfLua files<CR>', opts)
utils.map('n', '<Leader>F', 'FzfLua grep<CR>', opts)
utils.map('n', '<Leader>c', 'FzfLua git_commits<CR>', opts)
utils.map('n', '<Leader>b', 'FzfLua buffers<CR>', opts)
