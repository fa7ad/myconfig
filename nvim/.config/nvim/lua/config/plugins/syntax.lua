return {
  -- Lua configured for nvim
  {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
  },
  { 'Bilal2453/luvit-meta',                    lazy = true },


  -- THE MAIN LSP CONFIG
  -- LSP: Language Server Protocol
  {
    'neovim/nvim-lspconfig',
    dependencies = {
      -- NOTE: Must be loaded before dependants
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',
      'WhoIsSethDaniel/mason-tool-installer.nvim',
      -- Useful status updates for LSP.
      { 'j-hui/fidget.nvim',       opts = {} },
      'hrsh7th/cmp-nvim-lsp'
    },
    config = require('config.setupfn.lspsetup')
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
    build = ':lua require("go.install").update_all_sync()',
  },

  -- FMT: Formatting
  {
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = 'n',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local enabled_ft = { go = true, lua = true }
        local lsp_format_opt
        if enabled_ft[vim.bo[bufnr].filetype] then
          lsp_format_opt = 'fallback'
        else
          lsp_format_opt = 'never'
        end
        return {
          timeout_ms = 500,
          lsp_format = lsp_format_opt,
        }
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        javascript = { "prettierd", "prettier", stop_after_first = true },
      },
    },
  },

  -- CMP: Autocomplete
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      {
        "L3MON4D3/LuaSnip",
        build = function()
          if vim.fn.executable("make") == 0 then
            return
          end
          return "make install_jsregexp"
        end,
        dependencies = {
          {
            'rafamadriz/friendly-snippets',
            config = function()
              require('luasnip.loaders.from_vscode').lazy_load()
            end,
          },
        }
      },
      'saadparwaiz1/cmp_luasnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
    },
    config = require('config.setupfn.cmpsetup')
  },

  -- TS: TreeSitter
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = "nvim-treesitter.configs",
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc',
        'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc', 'ruby',
        'javascript', 'typescript', 'css', 'scss', 'json', 'toml', 'yaml',
        'go', 'gomod', 'gosum' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    }
  },
  { "nvim-treesitter/nvim-treesitter-context", lazy = true, config = true },
  { "ckolkey/ts-node-action",                  lazy = true, config = true },

  -- LINT: Fix code errors
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    opts = {}
  },
  {
    'mfussenegger/nvim-lint',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = lint.linters_by_ft or {}

      lint.linters_by_ft['dockerfile'] = nil
      lint.linters_by_ft['text'] = nil
      lint.linters_by_ft['javascript'] = { 'eslint' }
      lint.linters_by_ft['typescript'] = { 'eslint' }
      lint.linters_by_ft['go'] = { 'golangcilint' }

      -- react aliases
      lint.linters_by_ft['javascriptreact'] = lint.linters_by_ft['javascript']
      lint.linters_by_ft['typescriptreact'] = lint.linters_by_ft['typescript']

      local lint_augroup = vim.api.nvim_create_augroup('lint', { clear = true })
      vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
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
