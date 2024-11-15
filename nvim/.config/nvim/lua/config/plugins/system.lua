return {
  {
    "lbrayner/vim-rzip",
    lazy = false,
    init = function()
      vim.g.rzipPlugin_extra_ext = "*.odt"
    end,
  },
  {
    "famiu/bufdelete.nvim",
    cmd = { "Bdelete" },
    keys = {
      { "<leader>q", "<cmd>Bdelete<CR>", desc = "Delete buffer" },
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        cond = function()
          return vim.fn.executable("make") == 1
        end,
      },
      { "nvim-telescope/telescope-ui-select.nvim" },
      {
        "nvim-tree/nvim-web-devicons",
        enabled = vim.g.have_nerd_font,
      },
    },
    config = require("config.setupfn.tscopeconf"),
  },
}
