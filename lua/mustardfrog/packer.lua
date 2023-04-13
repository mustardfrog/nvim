-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd.packadd('packer.nvim')

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

    -- themes
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
    -- use {
    --     'uloco/bluloco.nvim',
    --     requires = { 'rktjmp/lush.nvim' }
    -- }
    use { "catppuccin/nvim", as = "catppuccin" }
    -- use 'cocopon/iceberg.vim'

    use 'ap/vim-css-color'
    use({'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'})
    use 'nvim-treesitter/nvim-treesitter-context'
	use('nvim-treesitter/playground')

	use('theprimeagen/harpoon')
	use('mbbill/undotree')
	use('tpope/vim-fugitive')
    -- use 'habamax/vim-godot'

    use 'simrat39/rust-tools.nvim'

	use {
		'VonHeikemen/lsp-zero.nvim',
		requires = {
			-- LSP Support
			{'neovim/nvim-lspconfig'},
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-buffer'},
			{'hrsh7th/cmp-path'},
			{'saadparwaiz1/cmp_luasnip'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-nvim-lua'},

			-- Snippets
			{'L3MON4D3/LuaSnip'},
			{'rafamadriz/friendly-snippets'},
		}
	}

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
