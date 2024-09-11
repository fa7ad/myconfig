require("config.set")
require("config.remap")
require("config.lazy")

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

local setHardTab = augroup("setHardTab", { clear = true })
autocmd("Filetype", {
  group = setHardTab,
  pattern = { "go" },
  command = "setlocal noexpandtab shiftwidth=4 tabstop=4",
})

local setShortIndent = augroup("setShortIndent", { clear = true })
autocmd("Filetype", {
  group = setShortIndent,
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
    "yaml",
    "lua",
    "ruby",
  },
  command = "setlocal shiftwidth=2 tabstop=2 softtabstop=2 expandtab",
})

function FormatAndFixJs()
  vim.lsp.buf.format()
  vim.cmd("EslintFixAll")
end

local formatAndFix = augroup("formatAndFix", { clear = true })
autocmd("Filetype", {
  group = formatAndFix,
  pattern = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
  },
  command = 'lua vim.keymap.set("n", "<leader>f", FormatAndFixJs, { noremap = true })',
})
