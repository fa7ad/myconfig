if vim.g.vscode then
  return
end
local nvimTree = require("nvim-tree")
local nvimTreeApi = require("nvim-tree.api")

nvimTree.setup({
  sort_by = "case_sensitive",
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = false,
    custom = { "^.git$" }
  },
  actions = {
    open_file = {
      quit_on_open = true,
    }
  }
})

vim.keymap.set("n", "<C-e>", nvimTreeApi.tree.toggle,
  { silent = true, noremap = true }
)
