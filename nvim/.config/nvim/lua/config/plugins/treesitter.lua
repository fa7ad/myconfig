return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = { highlight = { enable = true } },
  },
  { "nvim-treesitter/nvim-treesitter-context", lazy = true, config = true },
  { "ckolkey/ts-node-action", lazy = true, config = true}
}
