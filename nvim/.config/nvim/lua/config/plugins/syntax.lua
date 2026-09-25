return {
  -- Lua configured for nvim
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },

  -- THE MAIN LSP CONFIG
  -- LSP: Language Server Protocol
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- NOTE: Must be loaded before dependants
      "mason-org/mason.nvim",
      "mason-org/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      -- Useful status updates for LSP.
      { "j-hui/fidget.nvim", opts = {} },
    },
    config = require("config.setupfn.lspsetup"),
  },
  -- Better Go integration than gopls?
  {
    "ray-x/go.nvim",
    dependencies = {
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    config = true,
    init = function()
      local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})

      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          require("go.format").goimport()
        end,
        group = format_sync_grp,
      })
    end,
    event = { "CmdlineEnter" },
    ft = { "go", "gomod" },
  },

  -- FMT: Formatting
  {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true, lsp_format = "fallback" })
        end,
        mode = "n",
        desc = "[F]ormat buffer",
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local enabled_ft = { go = true, lua = true }
        local lsp_format_opt
        if enabled_ft[vim.bo[bufnr].filetype] then
          lsp_format_opt = "fallback"
        else
          lsp_format_opt = "never"
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  -- CMP: Autocomplete
  {
    "saghen/blink.cmp",
    version = "1.*",
    event = "InsertEnter",
    dependencies = { "rafamadriz/friendly-snippets", "folke/lazydev.nvim" },
    opts = {
      keymap = { preset = "default" },
      sources = {
        default = { "lazydev", "lsp", "path", "snippets", "buffer" },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },
    },
  },

  -- TS: TreeSitter
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      local filetypes = {
        "bash",
        "c",
        "diff",
        "html",
        "lua",
        "markdown",
        "markdown_inline",
        "query",
        "vim",
        "help", -- vimdoc parser
        "ruby",
        "javascript",
        "typescript",
        "css",
        "scss",
        "json",
        "toml",
        "yaml",
        "go",
        "gomod",
        "gosum",
      }
      require("nvim-treesitter").install(vim.tbl_map(function(ft)
        return ft == "help" and "vimdoc" or ft
      end, filetypes))

      -- ponytail: dropped the old additional_vim_regex_highlighting workaround for
      -- ruby's queries; re-add if gaps show up in ruby highlighting
      vim.api.nvim_create_autocmd("FileType", {
        pattern = filetypes,
        callback = function(args)
          vim.treesitter.start()
          if args.match ~= "ruby" then
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end,
  },
  { "nvim-treesitter/nvim-treesitter-context", lazy = true, config = true },
  { "ckolkey/ts-node-action", lazy = true, config = true },

  -- LINT: Fix code errors
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    opts = {},
  },
  {
    "mfussenegger/nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = lint.linters_by_ft or {}

      lint.linters_by_ft["dockerfile"] = nil
      lint.linters_by_ft["text"] = nil
      lint.linters_by_ft["javascript"] = { "eslint" }
      lint.linters_by_ft["typescript"] = { "eslint" }
      lint.linters_by_ft["go"] = { "golangcilint" }

      -- react aliases
      lint.linters_by_ft["javascriptreact"] = lint.linters_by_ft["javascript"]
      lint.linters_by_ft["typescriptreact"] = lint.linters_by_ft["typescript"]

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          if vim.opt_local.modifiable:get() then
            lint.try_lint()
          end
        end,
      })
    end,
  },
}
