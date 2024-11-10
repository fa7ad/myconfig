-- this has to run first (other keymaps in keymaps.lua)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- fish does wonky things in vimterm
vim.opt.shell = "/bin/bash"

vim.opt.number = true
vim.opt.relativenumber = true

-- editing globals
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.breakindent = true
-- vim.opt.wrap = false

vim.opt.mouse = 'a'
vim.opt.mousefocus = true

vim.opt.showmode = false

vim.schedule(function()
  vim.opt.clipboard = 'unnamed,unnamedplus'
end)

vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.cache/vim"

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.magic = true
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.smartcase = true
vim.opt.ignorecase = true

vim.opt.showmatch = true
vim.opt.matchtime = 5

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'
vim.opt.colorcolumn = { 80, 120 }
vim.opt.termguicolors = true
vim.opt.scrolloff = 10

vim.opt.splitright = true
vim.opt.splitbelow = true

vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
vim.opt.listchars = { lead = "·", trail = "·", eol = "↵", tab = "» ", nbsp = '␣' }

vim.opt.hidden = true
-- Decrease update time
vim.opt.updatetime = 250
-- add "@" to isfname
vim.opt.isfname:append('@-@')

-- Decrease mapped sequence wait time
vim.opt.timeoutlen = 300

vim.opt.inccommand = 'split'

vim.opt.cursorline = true
vim.opt.ruler = true

vim.opt.backspace = { "eol", "start", "indent" }
vim.opt.whichwrap:append("<,>,h,l")

vim.opt.lazyredraw = true

vim.scriptencoding = "utf-8"
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"

vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.wildignore = "*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/node_modules/*"