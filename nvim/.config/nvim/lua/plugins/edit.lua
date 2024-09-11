return {
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },
  { "numToStr/Comment.nvim", opts = {} },
  {
    "johnfrankmorgan/whitespace.nvim",
    opts = {
      -- `highlight` configures which highlight is used to display
      -- trailing whitespace
      highlight = "DiffDelete",
      -- `ignored_filetypes` configures which filetypes to ignore when
      -- displaying trailing whitespace
      ignored_filetypes = { "TelescopePrompt", "Trouble", "help" },
      -- `ignore_terminal` configures whether to ignore terminal buffers
      ignore_terminal = true,
    },
    init = function()
      -- remove trailing whitespace with a keybinding
      vim.keymap.set("n", "<Leader>t", require("whitespace-nvim").trim)
    end,
  },
  { "windwp/nvim-autopairs", opts = {} },
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {},
  },
  {
    "mbbill/undotree",
    config = true,
    keys = { { "<leader>u", "<cmd>UndotreeToggle" } },
  },
}
