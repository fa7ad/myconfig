function Split(inputstr, sep)
  if sep == nil then
    sep = "%s"
  end
  local t = {}
  for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
    table.insert(t, str)
  end
  return t
end

-- set
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
vim.opt.undodir = os.getenv("HOME") .. "/.cache/vscode-nvim"
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
vim.opt.colorcolumn = { "80", "120" }
vim.opt.isfname:append("@-@")

vim.opt.wildmenu = true
vim.opt.wildmode = "list:longest,full"
vim.opt.wildignore = '*.o,*~,*.pyc,*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store,*/node_modules/*'

vim.opt.ruler = true
vim.opt.cmdheight = 1
vim.opt.hid = true

vim.opt.backspace = { 'eol', 'start', 'indent' }
vim.opt.whichwrap:append("<,>,h,l")

vim.opt.lazyredraw = true

vim.opt.list = true
-- set

-- REMAP --
vim.g.mapleader = ","

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", ">", [[>gv]], {
  noremap = true
})
vim.keymap.set("v", "<", [[<gv]], {
  noremap = true
})

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("x", "<leader>p", [["_dP]])

vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("i", "<C-c>", "<Esc>")

-- WARN: Seems to break some plugins
-- vim.keymap.set("n", ";", ":")
vim.keymap.set({ "n", "v" }, "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":wq<CR>")

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader><leader>", [[:so<CR>]])
vim.keymap.set("n", "<leader><CR>", [[:noh<CR>]])

vim.api.nvim_create_user_command('W', 'w', {
  bang = true
})
vim.api.nvim_create_user_command('Q', 'q', {
  bang = true
})
-- /REMAP --
-- PACKER --

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/vpack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

Packer = require('packer')

Packer.reset()

Packer.init({
  package_root = vim.fn.stdpath('data') .. '/site/vpack'
})

Packer.use 'wbthomason/packer.nvim'

Packer.use {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  requires = { { 'nvim-lua/plenary.nvim' } }
}

Packer.use "mbbill/undotree"

Packer.use {
  "folke/todo-comments.nvim",
  requires = "nvim-lua/plenary.nvim",
  config = function()
    require("todo-comments").setup {}
  end
}

Packer.use {
  "folke/twilight.nvim",
  config = function()
    require("twilight").setup {}
  end
}

Packer.use {
  'numToStr/Comment.nvim',
  config = function()
    require('Comment').setup()
  end
}

Packer.use 'romgrk/fzy-lua-native'

-- Packer.use {
--   "windwp/nvim-autopairs",
--   config = function()
--     require("nvim-autopairs").setup()
--   end
-- }

Packer.use({
  "kylechui/nvim-surround",
  tag = "*",
  config = function()
    require("nvim-surround").setup()
  end
})

if packer_bootstrap then
  Packer.sync()
end

-- /PACKER --

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

Augroup = vim.api.nvim_create_augroup
Autocmd = vim.api.nvim_create_autocmd
