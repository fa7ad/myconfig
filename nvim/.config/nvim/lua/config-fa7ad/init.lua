require("config-fa7ad.set")
require("config-fa7ad.remap")
require("config-fa7ad.packer")

local augroup = vim.api.nvim_create_augroup
local BufGrpGroup = augroup('BufGrp', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = BufGrpGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1