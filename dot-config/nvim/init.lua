local set = vim.opt
local cmd = vim.cmd

set.showcmd = true
set.cursorline = true
set.relativenumber = true
set.showmatch = true
set.ignorecase = true
set.smartcase = true
set.tabstop = 2
set.shiftwidth = 2
set.autoindent = true
set.smartindent = true
set.wildmenu = true
set.wildmode = 'longest:full,full'
set.foldmethod = 'syntax'
set.foldlevel = 99
set.mouse = 'a'
set.whichwrap = '>,l<,h'

cmd.colorscheme 'slate'
cmd [[match errorMsg /\s\+$/]]
