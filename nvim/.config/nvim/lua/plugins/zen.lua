return {
    "folke/zen-mode.nvim",
    config = function()
        local zenMode = require("zen-mode")
        zenMode.setup({
            plugins = {
                gitsigns = {
                    enabled = true
                }
            }
        })
        vim.keymap.set("n", "<leader>zz", function()
            require("zen-mode").setup {
                window = {
                    width = 90,
                    options = {}
                }
            }
            vim.wo.wrap = false
            vim.wo.number = true
            vim.wo.rnu = true
            zenMode.toggle()
        end)

        vim.keymap.set("n", "<leader>zZ", function()
            zenMode.setup {
                window = {
                    width = 80,
                    options = {}
                }
            }
            zenMode.toggle()
            vim.wo.wrap = false
            vim.wo.number = false
            vim.wo.rnu = false
            vim.opt.colorcolumn = "0"
        end)
    end
}

