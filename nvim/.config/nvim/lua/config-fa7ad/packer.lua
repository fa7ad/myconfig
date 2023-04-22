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
        transparent = true
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
      pcall(vim.cmd, 'TSUpdate')
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
          pcall(vim.cmd, 'MasonUpdate')
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
    'ray-x/go.nvim',
    requires = {
      { 'ray-x/guihua.lua' },
      { 'nvim-treesitter/nvim-treesitter' }
    }
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
    "terrortylor/nvim-comment",
    config = function()
      require('nvim_comment').setup()
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

  if packer_bootstrap then
    require('packer').sync()
  end
end)
