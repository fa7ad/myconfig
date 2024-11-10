-- exit
vim.api.nvim_create_user_command("W", "w", { bang = true, desc = "Force Write" })
vim.api.nvim_create_user_command("Q", "q", { bang = true, desc = "Force Quit" })
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit" })
vim.keymap.set("n", "<leader>Q", ":qa<CR>", { desc = "Quit all" })

-- bad habits
vim.keymap.set("i", "<C-c>", "<Esc>", { desc = "Exit insert mode" })
vim.keymap.set("n", "Q", "<nop>", { desc = "Disable Q" })

-- search
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { desc = "Search and replace word under cursor" })
-- unfold and keep cursor in the middle on find-next
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result" })

-- move line up-down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })
-- indent
vim.keymap.set("v", "<", "<gv", { desc = "Indent left" })
vim.keymap.set("v", ">", ">gv", { desc = "Indent right" })
-- Keep cursor in place when joining lines
vim.keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- Scroll but keep cursor in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up" })

-- paste but don't yank
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })
-- delete but no yank
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Navigate splits
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Navigate buffers
vim.keymap.set('n', '<leader>l', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>h', ':bprevious<CR>', { desc = 'Prev buffer' })

-- DIAGNOSTICS
vim.keymap.set('n', '<leader>F', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quick[F]ix list' })
vim.keymap.set('n', '<C-k>', '<cmd>cnext<CR>zz', { desc = 'Next on quickfix list' })
vim.keymap.set('n', '<C-j>', '<cmd>cprev<CR>zz', { desc = 'Prev on quickfix list' })
vim.keymap.set('n', '<leader>k', '<cmd>lnext<CR>zz', { desc = 'Next location list' })
vim.keymap.set('n', '<leader>j', '<cmd>lprev<CR>zz', { desc = 'Prev location list' })

-- LSPs
-- covered by conform: see ./plugins/syntax.lua
-- vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, { desc = "Format buffer" }) 

-- vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Smart rename" })
