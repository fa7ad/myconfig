return {
  {
    "nvim-telescope/telescope.nvim",
    branch = "0.1.x",
    dependencies = { "nvim-lua/plenary.nvim",
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },
      {
        'nvim-tree/nvim-web-devicons',
        enabled = vim.g.have_nerd_font,
      },
    },
    config = function()
      local telescope = require("telescope")
      local nut = require("nvim-utils")

      telescope.setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_cursor(),
          }
        }
      })

      -- enable extensions
      pcall(telescope.load_extension, "fzf")
      pcall(telescope.load_extension, "ui-select")

      local builtin = require("telescope.builtin")

      nut.tkmap {
        { '<leader>sh',       builtin.help_tags,   '[S]earch [H]elp' },
        { '<leader>sk',       builtin.keymaps,     '[S]earch [K]eymaps' },
        { '<leader>sf',       builtin.find_files,  '[S]earch [F]iles' },
        { '<leader>ss',       builtin.builtin,     '[S]earch [S]elect Telescope' },
        { '<leader>sw',       builtin.grep_string, '[S]earch current [W]ord' },
        { '<leader>sg',       builtin.live_grep,   '[S]earch by [G]rep' },
        { '<leader>sd',       builtin.diagnostics, '[S]earch [D]iagnostics' },
        { '<leader>sr',       builtin.resume,      '[S]earch [R]esume' },
        { '<leader>s.',       builtin.oldfiles,    '[S]earch Recent Files ("." for repeat)' },
        { '<leader><leader>', builtin.buffers,     '[ ] Find existing buffers' },
        { '<leader>vh',       builtin.help_tags,   '[V]iew [H]elp' },
        { '<leader>pf',
          function()
            builtin.find_files({ hidden = true })
          end,
          'Search [p] [F]iles (include hidden)' },
        { '<C-p>',
          function()
            builtin.git_files({ hidden = true, show_untracked = true })
          end,
          'Show files tracked by git (include hidden)' },
        { '<leader>/',
          function()
            builtin.current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
              winblend = 10,
              previewer = false,
            })
          end,
          '[/] Fuzzily search in current buffer' },
        {
          '<leader>s/',
          function()
            builtin.live_grep {
              grep_open_files = true,
              prompt_title = 'Live Grep in Open Files',
            }
          end,
          '[S]earch [/] in Open Files'
        }
      }
    end
  },
}
