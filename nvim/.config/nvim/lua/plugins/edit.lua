return {
  {
    "folke/todo-comments.nvim",
    dependencies = {"nvim-lua/plenary.nvim"},
    opts = {}
  },
  {'numToStr/Comment.nvim', opts = {}},
  {
    'johnfrankmorgan/whitespace.nvim',
    opts = {
      -- `highlight` configures which highlight is used to display
      -- trailing whitespace
      highlight = 'DiffDelete',
      -- `ignored_filetypes` configures which filetypes to ignore when
      -- displaying trailing whitespace
      ignored_filetypes = {'TelescopePrompt', 'Trouble', 'help'},
      -- `ignore_terminal` configures whether to ignore terminal buffers
      ignore_terminal = true
    },
    init = function()
      -- remove trailing whitespace with a keybinding
      vim.keymap.set('n', '<Leader>t', require('whitespace-nvim').trim)
    end
  },
  {"windwp/nvim-autopairs", opts = {}},
  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    opts = {}
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",

    config = function()
      local highlight = {
        "RainbowRed",
        "RainbowYellow",
        "RainbowBlue",
        "RainbowOrange",
        "RainbowGreen",
        "RainbowViolet",
        "RainbowCyan",
        "CursorColumn",
        "Whitespace"
      }
      local hooks = require "ibl.hooks"
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", {fg = "#E06C75"})
        vim.api.nvim_set_hl(0, "RainbowYellow", {fg = "#E5C07B"})
        vim.api.nvim_set_hl(0, "RainbowBlue", {fg = "#61AFEF"})
        vim.api.nvim_set_hl(0, "RainbowOrange", {fg = "#D19A66"})
        vim.api.nvim_set_hl(0, "RainbowGreen", {fg = "#98C379"})
        vim.api.nvim_set_hl(0, "RainbowViolet", {fg = "#C678DD"})
        vim.api.nvim_set_hl(0, "RainbowCyan", {fg = "#56B6C2"})
      end)

      local ibl = require("ibl")
      local config = {
        indent = {highlight = highlight},
        whitespace = {highlight = highlight, remove_blankline_trail = false},
        scope = {highlight = highlight}
      }
      ibl.setup(config)
      vim.g.rainbow_delimiters = {highlight = highlight}

      hooks.register(hooks.type.SCOPE_HIGHLIGHT,
                     hooks.builtin.scope_highlight_from_extmark)
    end
  },
  {
    "mbbill/undotree",
    config = true,
    keys = {{"<leader>u", "<cmd>UndotreeToggle"}}
  }
}
