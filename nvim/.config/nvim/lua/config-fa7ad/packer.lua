local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  use {
    'navarasu/onedark.nvim',
    config = function()
      require('onedark').setup {
        style = 'darker',
        -- transparent = true
      }
      require('onedark').load()
    end
  }

  use {
    "folke/trouble.nvim",
    requires = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("trouble").setup {
        icons = true
      }
    end
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = function()
      pcall(function() vim.cmd [[TSUpdate]] end)
    end
  }
  use "nvim-treesitter/playground"
  use "nvim-treesitter/nvim-treesitter-context"

  use {
    'toppair/reach.nvim',
    config = function()
      require('reach').setup {
        notifications = true
      }
    end
  }

  use "mbbill/undotree"
  use "tpope/vim-fugitive"

  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },
      {
        'williamboman/mason.nvim',
        run = function()
          pcall(function() vim.cmd [[MasonUpdate]] end)
        end
      },
      { 'williamboman/mason-lspconfig.nvim' },
      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },
      { 'hrsh7th/cmp-buffer' },
      { 'hrsh7th/cmp-path' },
      { 'hrsh7th/cmp-nvim-lsp' },
      { 'hrsh7th/cmp-nvim-lua' },
      { 'L3MON4D3/LuaSnip' }
    }
  }

  use {
    "jose-elias-alvarez/null-ls.nvim",
    config = function()
      require("null-ls").setup()
    end,
    requires = { "nvim-lua/plenary.nvim" },
  }

  use {
    'ray-x/go.nvim',
    requires = {
      { 'ray-x/guihua.lua' },
      { 'nvim-treesitter/nvim-treesitter' }
    },
    config = function()
      require('go').setup()
    end
  }

  use {
    "folke/todo-comments.nvim",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("todo-comments").setup {}
    end
  }


  use {
    "folke/zen-mode.nvim",
    config = function()
      require("zen-mode").setup {
        plugins = {
          gitsigns = {
            enabled = true
          }
        }
      }
    end
  }

  use {
    "folke/twilight.nvim",
    config = function()
      require("twilight").setup {}
    end
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use "gelguy/wilder.nvim"
  use 'romgrk/fzy-lua-native'
  use 'kyazdani42/nvim-web-devicons'
  use 'nixprime/cpsm'
  use "lambdalisue/suda.vim"

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }

  use 'johnfrankmorgan/whitespace.nvim'

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  use {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()
    end
  }

  use({
    "kylechui/nvim-surround",
    tag = "*",
    config = function()
      require("nvim-surround").setup()
    end
  })

  use {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {}
  }

  use 'lbrayner/vim-rzip'

  if packer_bootstrap then
    require('packer').sync()
  end
end)
