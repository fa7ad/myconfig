local function setup_lsp_keybinds(_, bufnr)
  local opts = { buffer = bufnr }

  vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<cr>", opts)
  vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<cr>", opts)
  vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
  vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", opts)
  vim.keymap.set("n", "go", "<cmd>lua vim.lsp.buf.type_definition()<cr>", opts)
  vim.keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<cr>", opts)
  vim.keymap.set("n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>", opts)
  vim.keymap.set("n", "<F2>", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
  vim.keymap.set({ "n", "x" }, "<F3>", "<cmd>lua vim.lsp.buf.format({async = true})<cr>", opts)
  vim.keymap.set("n", "<F4>", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
end

return {
  -- Setup Mason
  { "williamboman/mason.nvim", lazy = false, config = true },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = { { "L3MON4D3/LuaSnip" } },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        sources = { { name = "nvim_lsp" } },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
          ["<C-y>"] = cmp.mapping.confirm({ select = true }),
          ["<CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
          }),
        }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end,
  },

  -- Actual LSP Config
  {
    "neovim/nvim-lspconfig",
    cmd = { "LspInfo", "LspInstall", "LspStart" },
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp" },
      { "nvimtools/none-ls.nvim" },
      { "williamboman/mason.nvim" },
      { "jay-babu/mason-null-ls.nvim" },
      { "nvimtools/none-ls-extras.nvim" },
      { "VonHeikemen/lsp-zero.nvim", branch = "v4.x" },
      { "williamboman/mason-lspconfig.nvim", branch = "main" },
    },
    config = function()
      local lsp_zero = require("lsp-zero")
      local none_ls = require("null-ls")

      lsp_zero.extend_lspconfig({
        sign_text = { error = "✘", warn = "▲", hint = "⚑", info = "»" },
        lsp_attach = setup_lsp_keybinds,
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "eslint",
          "gopls",
          "lua_ls",
          "html",
          "docker_compose_language_service",
          "dockerls",
          "rust_analyzer",
        },

        handlers = {
          lsp_zero.default_setup,
          lua_ls = function()
            require("lspconfig").lua_ls.setup({
              settings = {
                Lua = {
                  telemetry = { enable = false },
                },
              },
            })
          end,
          eslint = function()
            require("lspconfig").eslint.setup({
              on_attach = function(_, bufnr)
                if vim.g.eslint_on_save == 1 then
                  vim.api.nvim_create_autocmd("BufWritePre", { buffer = bufnr, command = "EslintFixAll" })
                end
              end,
            })
          end,
        },
      })

      require("mason-null-ls").setup({
        ensure_installed = { "stylua", "jq" },
        handlers = {},
      })

      none_ls.setup({
        sources = {
          none_ls.builtins.code_actions.refactoring,
          none_ls.builtins.code_actions.ts_node_action,
          none_ls.builtins.completion.luasnip,
          none_ls.builtins.diagnostics.editorconfig_checker,
          none_ls.builtins.diagnostics.fish,
          none_ls.builtins.formatting.prettierd,
        },
      })
    end,
  },
}
