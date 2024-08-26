vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.winblend = 0
vim.opt.wildoptions = 'pum'
vim.opt.pumblend = 5
vim.opt.background = 'dark'

vim.cmd[[colorscheme nord]]
--vim.cmd[[colorscheme tokyonight-night]]

vim.fn.matchadd('errorMsg', [[\s\+$]])
