-- DEBUG:
-- vim.g.vscode = true
if vim.g.vscode then
  require("config-vscode")
else
  vim.loader.enable()
  require("config-fa7ad")
end
