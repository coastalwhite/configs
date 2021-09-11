local base16 = require 'base16'
-- Apply the materia base16 colorscheme
base16(base16.themes.materia, true)

local cmd = vim.api.nvim_exec

-- Have background opacity
cmd ([[ highlight Normal ctermbg=none ]], false)
cmd ([[ highlight NonText ctermbg=none ]], false)
