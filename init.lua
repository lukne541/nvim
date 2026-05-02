require("config.lazy")

require("config.coc")

vim.keymap.set('n', '<M-f>', ':Neotree toggle<CR>', { noremap = true, silent = true })
vim.cmd.colorscheme("retrobox")

local o = vim.o

o.expandtab = true -- expand tab input with spaces characters
o.smartindent = true -- syntax aware indentations for newline inserts
o.tabstop = 2 -- num of space characters per tab
o.shiftwidth = 2 -- spaces per indentation level

vim.opt.relativenumber = true
