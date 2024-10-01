return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
      {
        "<leader>pf",
        function()
          require("telescope.builtin").find_files()
        end,
      },
      {
        "<C-p>",
        function()
          require("telescope.builtin").git_files()
        end,
      },
      {
        "<leader>ps",
        function()
          require("telescope.builtin").grep_string({ search = vim.fn.input("Grep > ") })
        end,
      },
      {

        "<leader>vh",
        function()
          require("telescope.builtin").help_tags()
        end,
      },
    },
  },
}
