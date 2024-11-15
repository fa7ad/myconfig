local nut = require("nvim-utils")
-- exit
nut.create_cmd("W", "w", { bang = true, desc = "Force Write" })
nut.create_cmd("Q", "q", { bang = true, desc = "Force Quit" })

nut.kmap("<leader>w", ":w<CR>", "Save")
nut.kmap("<leader>Q", ":qa<CR>", "Quit all")

-- bad habits
nut.kmap("Q", "<Nop>", "Disable Q")
nut.kmap("q", "<Nop>", "Disable recording")
nut.kmap("<C-c>", "<Esc>", "Exit insert mode", "i")

-- search
nut.kmap("<Esc>", "<cmd>nohlsearch<CR>", "Clear search highlights")
nut.kmap("<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], "Search and replace word under cursor")

-- unfold and keep cursor in the middle on find-next
nut.kmap("n", "nzzzv", "Next search result")
nut.kmap("N", "Nzzzv", "Previous search result")

-- move line up-down
nut.kmap("J", ":m '>+1<CR>gv=gv", "Move line down", "v")
nut.kmap("K", ":m '<-2<CR>gv=gv", "Move line up", "v")
-- indent
nut.kmap("<", "<gv", "Indent left", "v")
nut.kmap(">", ">gv", "Indent right", "v")
-- Keep cursor in place when joining lines
nut.kmap("J", "mzJ`z", "Join lines")

-- Scroll but keep cursor in the middle
nut.kmap("<C-d>", "<C-d>zz", "Scroll down")
nut.kmap("<C-u>", "<C-u>zz", "Scroll up")

-- paste but don't yank
nut.kmap("<leader>p", [["_dP]], "Paste without yanking", "x")
-- delete but no yank
nut.kmap("<leader>d", [["_d]], "Delete without yanking", { "n", "v" })

-- Navigate splits
nut.kmap("<C-h>", "<C-w><C-h>", "Move focus to the left window")
nut.kmap("<C-l>", "<C-w><C-l>", "Move focus to the right window")
nut.kmap("<C-j>", "<C-w><C-j>", "Move focus to the lower window")
nut.kmap("<C-k>", "<C-w><C-k>", "Move focus to the upper window")

-- Navigate buffers
nut.kmap("<leader>l", ":bnext<CR>", "Next buffer")
nut.kmap("<leader>h", ":bprevious<CR>", "Prev buffer")
