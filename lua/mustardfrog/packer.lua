-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  -- themes
  -- use '/home/chaeng/fun/scooby_blue'
  -- use 'barrientosvctor/abyss.nvim'
  -- use 'olimorris/onedarkpro.nvim'
  -- use {
    --     'uloco/bluloco.nvim',
    --     requires = { 'rktjmp/lush.nvim' }
    -- }
  use { 'rktjmp/lush.nvim' }
  use 'luisiacc/gruvbox-baby'
  use 'morhetz/gruvbox'

  use {
    'olivercederborg/poimandres.nvim',
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end
  }
  use({
    'rose-pine/neovim',
    as = 'rose-pine',
    -- require('rose-pine/neovim').setup({
    --     -- dark_variant = 'main',
    --     dark_variant = 'dawn',
    -- }),
    config = function()
      -- vim.o.background='light'
      -- vim.cmd('colorscheme rose-pine')
    end
  })
  use 'folke/tokyonight.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }
  use "rebelot/kanagawa.nvim"
  -- use 'cocopon/iceberg.vim'

  use 'norcalli/nvim-colorizer.lua'
  use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
  use 'nvim-treesitter/nvim-treesitter-context'
  use('nvim-treesitter/playground')
  use "lukas-reineke/indent-blankline.nvim"

  use('theprimeagen/harpoon')
  use('mbbill/undotree')
  use('tpope/vim-fugitive')
  -- use 'habamax/vim-godot'

  use 'simrat39/rust-tools.nvim'
  use 'Exafunction/codeium.vim'
  -- 'VonHeikemen/lsp-zero.nvim',

  -- LSP Support
  use('neovim/nvim-lspconfig')
  use('onsails/lspkind.nvim')

  use('williamboman/mason.nvim')
  use('williamboman/mason-lspconfig.nvim')
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { { 'nvim-lua/plenary.nvim' } }
  }

  -- Autocompletion
  use('hrsh7th/nvim-cmp')
  use('hrsh7th/cmp-buffer')
  use('hrsh7th/cmp-path')
  use('saadparwaiz1/cmp_luasnip')
  use('hrsh7th/cmp-cmdline')
  use('hrsh7th/cmp-nvim-lsp')
  use('hrsh7th/cmp-nvim-lua')

  use "windwp/nvim-ts-autotag"
  -- Snippets
  use('L3MON4D3/LuaSnip')
  use('rafamadriz/friendly-snippets')

  -- Debugging
  use 'rcarriga/nvim-dap-ui'
  use 'mfussenegger/nvim-dap'
  use 'theHamsta/nvim-dap-virtual-text'
  use 'nvim-telescope/telescope-dap.nvim'
  use 'leoluz/nvim-dap-go'
  -- use "folke/neodev.nvim"

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  use { "max397574/better-escape.nvim", config = function()
    require("better_escape").setup()
  end, }

  use 'nvim-tree/nvim-web-devicons'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icons
    },
    -- tag = 'nightly' -- optional, updated every week. (see issue #1193)
  }
end)
