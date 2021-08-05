local function set_keymap(...) vim.api.nvim_set_keymap(bufnr, ...) end
local opts = { noremap=true, silent=true }

-- FZF Keybindings
buf_set_keymap('n', '<leader>f', '<Cmd>Files<CR>', opts)
buf_set_keymap('n', '<leader>F', '<Cmd>BLines<CR>', opts)
buf_set_keymap('n', '<leader>?', '<Cmd>History<CR>', opts)
buf_set_keymap('n', '<leader>C', '<Cmd>Commits<CR>', opts)
buf_set_keymap('n', '<leader>B', '<Cmd>Buffers<CR>', opts)
