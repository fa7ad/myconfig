return {
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = { style = "darker" },
    init = function()
      require("onedark").load()
    end,
  },
  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      sort_by = "case_sensitive",
      renderer = { group_empty = true },
      filters = { dotfiles = false, custom = { "^.git$" } },
      actions = { open_file = { quit_on_open = true } },
    },
    keys = {
      {
        "<C-e>",
        "<cmd>NvimTreeToggle<cr>",
        desc = "NvimTree",
      },
    },
  },
  { "lewis6991/gitsigns.nvim", config = true },
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "romgrk/fzy-lua-native", lazy = true, config = false },
  { "kyazdani42/nvim-web-devicons", lazy = true, config = false },
  { "nixprime/cpsm", lazy = true, config = false },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "onedark",
        -- component_separators = '|',
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "" }, right_padding = 2 },
        },
        lualine_b = { "filename", "branch" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = { "fileformat", "filetype", "progress" },
        lualine_z = {
          { "location", separator = { right = "" }, left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      tabline = {
        lualine_a = { "buffers" },
        lualine_b = {},
        lualine_c = {},
        lualine_x = { "filename" },
        lualine_y = {},
        lualine_z = { "tabs" },
      },
      extensions = {},
    },
  },
  {
    "gelguy/wilder.nvim",
    lazy = false,
    config = function()
      local wilder = require("wilder")
      wilder.setup({
        modes = { ":", "/", "?" },
        next_key = "<Tab>",
        previous_key = "<S-Tab>",
        accept_key = "<C-y>",
        reject_key = "<C-e>",
      })

      wilder.set_option("use_python_remote_plugin", 0)

      wilder.set_option("pipeline", {
        wilder.branch(
          wilder.cmdline_pipeline({ fuzzy = 1, fuzzy_filter = wilder.lua_fzy_filter() }),
          wilder.vim_search_pipeline()
        ),
      })

      wilder.set_option(
        "renderer",
        wilder.renderer_mux({
          [":"] = wilder.popupmenu_renderer(wilder.popupmenu_border_theme({
            border = "rounded",
            reverse = 0,
            highlighter = wilder.lua_fzy_highlighter(),
            left = { " ", wilder.popupmenu_devicons() },
            right = { " ", wilder.popupmenu_scrollbar() },
            highlights = {
              accent = wilder.make_hl("WilderAccent", "Pmenu", {
                { a = 1 },
                { a = 1 },
                { foreground = "#f4468f" },
              }),
            },
          })),
          ["/"] = wilder.wildmenu_renderer({ highlighter = wilder.lua_fzy_highlighter() }),
        })
      )
    end,
  },
  {
    "folke/zen-mode.nvim",
    opts = { plugins = { gitsigns = { enabled = true } } },
    keys = {
      {
        "<leader>zz",
        function()
          local zenMode = require("zen-mode")
          zenMode.setup({ window = { width = 90, options = {} } })
          vim.wo.wrap = false
          vim.wo.number = true
          vim.wo.rnu = true
          zenMode.toggle()
        end,
      },
      {
        "<leader>zx",
        function()
          local zenMode = require("zen-mode")

          zenMode.setup({ window = { width = 80, options = {} } })
          zenMode.toggle()
          vim.wo.wrap = false
          vim.wo.number = false
          vim.wo.rnu = false
          vim.opt.colorcolumn = "0"
        end,
      },
    },
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      -- This module contains a number of default definitions
      local rainbow_delimiters = require("rainbow-delimiters")

      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = { [""] = "rainbow-delimiters", lua = "rainbow-blocks" },
        priority = { [""] = 110, lua = 210 },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    dependencies = {
      { "HiPhish/rainbow-delimiters.nvim" },
      { "navarasu/onedark.nvim" },
    },
    main = "ibl",
    -- opts = {},

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
        "Whitespace",
      }

      local hooks = require("ibl.hooks")
      local oc = require("onedark.palette").darker
      -- create the highlight groups in the highlight setup hook, so they are reset
      -- every time the colorscheme changes
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, "RainbowRed", { fg = oc.red })
        vim.api.nvim_set_hl(0, "RainbowYellow", { fg = oc.yellow })
        vim.api.nvim_set_hl(0, "RainbowBlue", { fg = oc.blue })
        vim.api.nvim_set_hl(0, "RainbowOrange", { fg = oc.orange })
        vim.api.nvim_set_hl(0, "RainbowGreen", { fg = oc.green })
        vim.api.nvim_set_hl(0, "RainbowViolet", { fg = oc.purple })
        vim.api.nvim_set_hl(0, "RainbowCyan", { fg = oc.cyan })
      end)

      require("ibl").setup({
        whitespace = { remove_blankline_trail = false },
        scope = { highlight = highlight },
      })

      vim.g.rainbow_delimiters = { highlight = highlight }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },
}
