local function tscopeconf()
  local telescope = require("telescope")
  local nut = require("nvim-utils")

  telescope.setup({
    extensions = {
      ["ui-select"] = {
        require("telescope.themes").get_cursor(),
      },
    },
  })

  -- enable extensions
  pcall(telescope.load_extension, "fzf")
  pcall(telescope.load_extension, "ui-select")

  local builtin = require("telescope.builtin")

  local function find_files()
    builtin.find_files({ hidden = true })
  end
  local function git_files()
    builtin.git_files({ hidden = true, show_untracked = true })
  end
  local function fuzzy_in_buf()
    builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
      winblend = 10,
      previewer = false,
    }))
  end
  local function live_grep()
    builtin.live_grep({
      grep_open_files = true,
      prompt_title = "Live Grep in Open Files",
    })
  end
  nut.tkmap({
    { "<leader>sh", builtin.help_tags, "[S]earch [H]elp" },
    { "<leader>sk", builtin.keymaps, "[S]earch [K]eymaps" },
    { "<leader>sf", builtin.find_files, "[S]earch [F]iles" },
    { "<leader>ss", builtin.builtin, "[S]earch [S]elect Telescope" },
    { "<leader>sw", builtin.grep_string, "[S]earch current [W]ord" },
    { "<leader>sg", builtin.live_grep, "[S]earch by [G]rep" },
    { "<leader>sd", builtin.diagnostics, "[S]earch [D]iagnostics" },
    { "<leader>sl", builtin.loclist, "[S]earch [L]oclist" },
    { "<leader>sq", builtin.quickfix, "[S]earch [Q]uickfix" },
    { "<leader>sr", builtin.resume, "[S]earch [R]esume" },
    { "<leader>s.", builtin.oldfiles, '[S]earch Recent Files ("." for repeat)' },
    { "<leader><leader>", builtin.buffers, "[ ] Find existing buffers" },
    { "<leader>vh", builtin.help_tags, "[V]iew [H]elp" },
    { "<leader>pf", find_files, "Search [p] [F]iles (include hidden)" },
    { "<C-p>", git_files, "Show files tracked by git (include hidden)" },
    { "<leader>/", fuzzy_in_buf, "[/] Fuzzily search in current buffer" },
    { "<leader>s/", live_grep, "[S]earch [/] in Open Files" },
  })
end

return tscopeconf
