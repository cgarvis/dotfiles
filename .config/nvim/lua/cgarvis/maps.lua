local keymap = vim.keymap

vim.g.mapleader = ";"

keymap.set('n', '<leader><leader>', '<c-^>')
keymap.set('n', '<c-h>', '<c-w>h')
keymap.set('n', '<c-j>', '<c-w>j')
keymap.set('n', '<c-k>', '<c-w>k')
keymap.set('n', '<c-l>', '<c-w>l')
