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
    "nvim-neo-tree/neo-tree.nvim",
    lazy = false,
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons",
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim",
    },
    cmd = "Neotree",
    keys = {
      { "\\", ":Neotree reveal<CR>", desc = "NeoTree reveal", silent = true },
    },
    opts = {
      filesystem = {
        window = {
          mappings = {
            ["\\"] = "close_window",
          },
        },
        hijack_netrw_behavior = "open_current",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    config = true,
    opts = {
      signs = {
        add = { text = "+" },
        change = { text = "~" },
        delete = { text = "_" },
        topdelete = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
  },
  { "nvim-tree/nvim-web-devicons",  lazy = true },
  { "romgrk/fzy-lua-native",        lazy = true, config = false },
  { "kyazdani42/nvim-web-devicons", lazy = true, config = false },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        theme = "horizon",
      },
      sections = {
        lualine_a = {
          { "mode", right_padding = 2 },
        },
        lualine_b = { "filename", "branch" },
        lualine_c = { "diagnostics" },
        lualine_x = {},
        lualine_y = { "fileformat", "progress" },
        lualine_z = {
          "filetype",
          { "location", left_padding = 2 },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = {
        "lazy",
        "mason",
        "neo-tree",
        "quickfix",
      },
    },
  },

  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local icons = vim.g.custom_icons.diagnostic
          local ret = (diag.error and icons.Error .. diag.error .. " " or "")
              .. (diag.warning and icons.Warn .. diag.warning or "")
          return vim.trim(ret)
        end,
        separator_style = "slant",
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
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
