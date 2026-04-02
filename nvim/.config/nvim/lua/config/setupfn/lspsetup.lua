-- config callback for lspconfig plugin
return function()
  vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("nv-lsp-attach", { clear = true }),
    callback = function(event)
      local map = function(keys, func, desc, mode)
        mode = mode or "n"
        vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
      end
      local builtin = require("telescope.builtin")

      map("gd", builtin.lsp_definitions, "[G]oto [D]efinition")
      map("gr", builtin.lsp_references, "[G]oto [R]eferences")
      map("gI", builtin.lsp_implementations, "[G]oto [I]mplementation")
      map("<leader>D", builtin.lsp_type_definitions, "Type [D]efinition")
      map("<leader>ds", builtin.lsp_document_symbols, "[D]ocument [S]ymbols")
      map("<leader>ws", builtin.lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
      map("<leader>rn", vim.lsp.buf.rename, "[R]e[n]ame")
      map("<leader>ca", vim.lsp.buf.code_action, "[C]ode [A]ction", { "n", "x" })
      map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
      map("K", vim.lsp.buf.hover, "Hover Documentation [K]")

      local client = vim.lsp.get_client_by_id(event.data.client_id)
      if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight) then
        local highlight_augroup = vim.api.nvim_create_augroup("nv-lsp-highlight", { clear = false })
        vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.document_highlight,
        })

        vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
          buffer = event.buf,
          group = highlight_augroup,
          callback = vim.lsp.buf.clear_references,
        })

        vim.api.nvim_create_autocmd("LspDetach", {
          group = vim.api.nvim_create_augroup("nv-lsp-detach", { clear = true }),
          callback = function(event2)
            vim.lsp.buf.clear_references()
            vim.api.nvim_clear_autocmds({ group = "nv-lsp-highlight", buffer = event2.buf })
          end,
        })
      end

      if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint) then
        map("<leader>th", function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
        end, "[T]oggle Inlay [H]ints")
      end
    end,
  })

  if vim.g.have_nerd_font then
    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.HINT] = "",
          [vim.diagnostic.severity.INFO] = "",
        },
      },
    })
  end

  -- Set cmp capabilities for all servers globally
  local capabilities = vim.tbl_deep_extend(
    "force",
    vim.lsp.protocol.make_client_capabilities(),
    require("cmp_nvim_lsp").default_capabilities()
  )
  vim.lsp.config('*', { capabilities = capabilities })

  -- Per-server config for servers that need custom settings
  vim.lsp.config('html', { filetypes = { "html", "twig" } })
  vim.lsp.config('bashls', { filetypes = { "sh", "zsh" } })
  vim.lsp.config('lua_ls', {
    settings = {
      Lua = {
        telemetry = { enable = false },
        completion = { callSnippet = "Replace" },
      },
    },
  })
  vim.lsp.config('basedpyright', {
    settings = {
      basedpyright = {
        analysis = {
          autoSearchPaths = true,
          useLibraryCodeForTypes = true,
          -- only lint open files; full workspace is slow and uv projects
          -- tend to have large dependency trees under .venv
          diagnosticMode = "openFilesOnly",
        },
      },
    },
    before_init = function(_, config)
      -- Detect uv's .venv in the project root and point basedpyright at it
      local venv = config.root_dir and (config.root_dir .. "/.venv")
      if venv and vim.fn.isdirectory(venv) == 1 then
        local python = venv .. "/bin/python"
        if vim.fn.executable(python) == 1 then
          config.settings.python = { pythonPath = python }
        end
      end
    end,
  })

  local servers = {
    "docker_compose_language_service", "dockerls", "gopls", "basedpyright",
    "rust_analyzer", "ts_ls", "html", "stimulus_ls", "bashls", "lua_ls",
  }
  local extra_tools = { "stylua", "prettier", "prettierd", "jq", "shfmt", "shellcheck", "eslint_d", "golangci-lint" }

  require("mason").setup()
  require("mason-tool-installer").setup({
    ensure_installed = vim.list_extend(vim.deepcopy(servers), extra_tools),
  })
  require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_enable = true,
  })
end
