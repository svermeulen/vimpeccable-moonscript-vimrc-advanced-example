
util = require('vimrc.util')
MoonMaker = require("moonmaker")

vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.incsearch = true

vim.o.hidden = true

vim.o.history = 5000

vim.o.tabstop = 4
vim.o.shiftwidth = vim.o.tabstop

vim.g.mapleader = " "

vim.cmd('colorscheme gruvbox')

-- Note that we are using 'vimp' here for vimpeccable
vimp.nnoremap '<leader>hw', ->
  print('hello')
  print('world')

-- Toggle line numbers
vimp.nnoremap '<leader>n', -> vim.wo.number = not vim.wo.number

-- Keep the cursor in place while joining lines
vimp.nnoremap 'J', 'mzJ`z'

-- Edit the primary vimrc
vimp.nnoremap '<leader>ev', -> vim.cmd("vsplit ~/.config/nvim/plugged/vimpeccable-moonscript-vimrc-advanced-example/moon/vimrc.moon")
-- This would work too:
-- vimp.nnoremap '<leader>ev', ':vsplit ~/.config/nvim/plugged/vimpeccable-moonscript-vimrc-advanced-example/moon/vimrc.moon<cr>'
-- Or this:
-- vimp.nnoremap '<leader>ev', [[:vsplit ~/.config/nvim/plugged/vimpeccable-moonscript-vimrc-advanced-example/moon/vimrc.moon<cr>]]

-- Hot reload config
vimp.nnoremap '<leader>r', ->
  vimp.unmap_all!
  util.unload_lua_namespace('vimrc')
  vim.cmd('silent wa')
  MoonMaker.compileAll(false)
  require('vimrc')
  print("Reloaded vimrc")
