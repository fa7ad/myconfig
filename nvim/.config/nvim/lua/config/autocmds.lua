local utils = require("nvim-utils")
local augroup, autocmd = utils.augroup, utils.autocmd

-- Highlight on yank
autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = augroup('nv-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Hard tab for go, make, etc
autocmd("Filetype", {
  group = augroup("hard-tab", { clear = true }),
  pattern = { "go", "makefile" },
  command = "setlocal noexpandtab shiftwidth=4 tabstop=4",
  desc = "Use hard tabs for go and make",
})

-- Soft, short width tabs for other languages
autocmd("Filetype", {
  group = augroup("compact-spacetabs", { clear = true }),
  pattern = {
    "xml",
    "html",
    "xhtml",
    "css",
    "scss",
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "toml",
    "yaml",
    "lua",
    "ruby",
  },
  command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab",
  desc = "Use 2-space indent for most languages",
})
