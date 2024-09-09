vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

vim.keymap.set("n", "<leader>w", ":w<CR>")
vim.keymap.set("n", "<leader>q", ":q<CR>")

-- vim.keymap.set("n", "<C-e>", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("v", ">", [[>gv]], {
  noremap = true,
})
vim.keymap.set("v", "<", [[<gv]], {
  noremap = true,
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

vim.api.nvim_create_user_command('W', 'w', { bang = true })
vim.api.nvim_create_user_command('Q', 'q', { bang = true })

-- vim.keymap.set("n", ":W", [[:w<CR>]], {
--   noremap = true,
-- })
--
-- vim.keymap.set("n", ":Q", [[:q<CR>]], {
--   noremap = true,
-- })

-- BROKEN FOR NOW,
-- TODO: Figure out how to port over the vimscript function to Lua

-- Visual mode pressing * or # searches for the current selection
-- Super useful! From an idea by Michael Naumann
-- vim.keymap.set("v", "*", ":<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>", {
--   silent = true,
--   noremap = true,
-- })
-- vim.keymap.set("v", "#", ":<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>", {
--   silent = true,
--   noremap = true,
-- })
