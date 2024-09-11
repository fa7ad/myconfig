return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = { highlight = { enable = true } },
  },
  { "nvim-treesitter/nvim-treesitter-context", lazy = true, config = true },
}
