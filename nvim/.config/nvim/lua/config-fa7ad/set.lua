vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.undodir = os.getenv("HOME") .. "/.cache/vim"
vim.opt.undofile = true
vim.opt.backup = false

vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.magic = true

vim.opt.showmatch = true
vim.opt.mat = 5

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.clipboard = 'unnamed,unnamedplus'
vim.opt.mouse = 'a'
vim.opt.mousefocus = true

vim.opt.termguicolors = true
vim.opt.scrolloff = 7

vim.opt.errorbells = false
vim.opt.visualbell = false

vim.opt.signcolumn = "yes"
vim.opt.updatetime = 50
vim.opt.colorcolumn = {"80", "120"}
vim.opt.isfname:append("@-@")

vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.wildignore = '*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/node_modules/*'

vim.opt.ruler = true
vim.opt.cmdheight = 1
vim.opt.hid = true

vim.opt.backspace = {'eol', 'start', 'indent'}
vim.opt.whichwrap:append("<,>,h,l")

vim.opt.lazyredraw = true

vim.opt.list = true
vim.opt.listchars:append({
    lead = '·',
    trail = '·',
    eol = '↴'
})
