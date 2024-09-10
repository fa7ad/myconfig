return {
  {
    'folke/trouble.nvim',
    dependencies = {'nvim-tree/nvim-web-devicons'},
    opts = {icons = true},
    keys = {
      "<leader>xq",
      "<cmd>TroubleToggle quickfix<cr>",
      silent = true,
      noremap = true,
      desc = "TroubleQF"
    }
  }
}
