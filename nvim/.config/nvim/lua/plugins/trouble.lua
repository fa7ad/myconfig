return {{
    'folke/trouble.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {
        icons = true
    },
    init = function(mod)
        vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>", {
            silent = true,
            noremap = true
        })
    end
}}
