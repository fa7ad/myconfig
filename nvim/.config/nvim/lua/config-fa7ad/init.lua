require("config-fa7ad.set")
require("config-fa7ad.remap")
require("config-fa7ad.packer")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1


local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

augroup('setHardTab', { clear = true })
autocmd('Filetype', {
  group = 'setHardTab',
  pattern = { 'go' },
  command = 'setlocal noexpandtab shiftwidth=4 tabstop=4'
})

augroup('setShortIndent', { clear = true })
autocmd('Filetype', {
  group = 'setShortIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
    'yaml', 'lua', 'coffeescript', 'ruby'
  },
  command = 'setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab'
})
