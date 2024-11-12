if not vim.g.vscode then
  require("config.settings")
  require("config.keymaps")
  require("config.autocmds")
  require("config.all-plugins")
end
if vim.g.neovide then
  require("config.neovide")
end