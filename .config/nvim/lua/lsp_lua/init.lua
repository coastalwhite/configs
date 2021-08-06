local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys 
-- after the language server attaches to the current buffer
local set_keybinds = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  -- buf_set_keymap('n', '<Leader>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<leader>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<leader>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '<leader>[', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', '<leader>]', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<leader>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<leader>p", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  buf_set_keymap("n", "<leader>a", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
end

local on_attach = function(client, bufnr)
    set_keybinds(client, bufnr)
end

-- Language servers:
-- pyright (https://github.com/microsoft/pyright)
-- rust_analyzer (https://rust-analyzer.github.io/)
-- texlab (https://texlab.netlify.app/)
-- clangd (https://clangd.llvm.org/)
-- cssls (https://github.com/vscode-langservers/vscode-css-languageserver-bin)
-- dotls (https://github.com/nikeee/dot-language-server)
-- htmlls (https://github.com/vscode-langservers/vscode-html-languageserver-bin)
-- denols (https://deno.land/)
-- lua-language-server (https://github.com/sumneko/lua-language-server)

local servers = {
    { name = 'pyright', opts = {} },
    { name = 'rust_analyzer', opts = require'lsp_lua.rust_analyzer' },
    { name = 'texlab', opts = require'lsp_lua.texlab' },
    { name = 'clangd', opts = {} },
    { name = 'cssls', opts = {} },
    { name = 'dotls', opts = {} },
    { name = 'denols', opts = {} },
    { name = 'sumneko_lua', opts = require'lsp_lua.lua_language_server' }
}

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
for _, lsp in ipairs(servers) do
  -- vim.api.nvim_exec(':echom "' .. lsp .. '"', false)
  lsp.opts.on_attach = function(client, bufnr)
      on_attach(client, bufnr)
      if lsp.opts['on_attach'] ~= nil then
          lsp.opts.on_attach(client, bufnr)
      end
  end

  nvim_lsp[lsp.name].setup(lsp.opts)
end
