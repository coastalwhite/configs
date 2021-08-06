return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  -- Language supports
  -----------------------------------------
  use 'drmingdrmer/vim-syntax-markdown' -- Markdown
  use 'cespare/vim-toml' -- TOML
  use 'pangloss/vim-javascript' -- Javascript
  use 'leafgarland/typescript-vim' -- Typescript
  use 'peitalin/vim-jsx-typescript' -- JSX Typescript
  use 'jxnblk/vim-mdx-js' -- MDX
  use 'alexlafroscia/postcss-syntax.vim' -- PostCSS
  use 'ap/vim-css-color' -- Show css colors
  -----------------------------------------

  -- Base16 Colorscheme
  use {
    'norcalli/nvim-base16.lua',
    as = 'base-16'
  }

  -- Extra keybindings
  -----------------------------------------
  use 'tyru/caw.vim' -- Comment out lines
  use 'tpope/vim-repeat' -- Repeat with the dot command for other plugins
  use 'tpope/vim-surround' -- Changing surrounding quotes, brackets or tags
  -----------------------------------------

  -- Modified keybindings
  -----------------------------------------
  use 'chaoren/vim-wordmotion' -- snake case and camel case with word motions
  -----------------------------------------

  -- Nice settings to have
  -----------------------------------------
  -- Moves vim root to closest git initiated dir
  use 'airblade/vim-rooter'
  -----------------------------------------

  -- GUI ENHANCEMENTS
  -----------------------------------------
  -- Git Gutter
  use 'airblade/vim-gitgutter'

  -- Bar at bottom
  use { 'itchyny/lightline.vim', config = [[ require('config.lightline') ]] }
  -----------------------------------------

  -- Fuzzy Searching
  -----------------------------------------
  use { 'junegunn/fzf', run = './install --bin' }
  use {
    'ibhagwan/fzf-lua',
    requires = {
      'vijaymarupudi/nvim-fzf' }
  }
  -----------------------------------------

  -- LSP
  -----------------------------------------
  -- LSP implementation
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-compe'

  -- Autocompletion framework for built-in LSP
  use {
    'haorenW1025/completion-nvim',
    opt = true,
    requires = {
        {'hrsh7th/vim-vsnip', opt = true},
        {'hrsh7th/vim-vsnip-integ', opt = true}
    }
  }
  -----------------------------------------

  -- Make it easy to interact with unicode characters
  use 'chrisbra/unicode.vim'

  -- Neovim in the browser
  use {
      'glacambre/firenvim',
      run = function() vim.fn['firenvim#install'](0) end
  }
end)