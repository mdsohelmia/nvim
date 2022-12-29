-- Install packer
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


-- Initialize packer
local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	-- Rooter
	use({
		'airblade/vim-rooter',
		setup = function()
			vim.g.rooter_manual_only = 1
		end,
		config = function()
			vim.cmd('Rooter')
		end,
	})
	-- colorschema
	use "gruvbox-community/gruvbox" -- Best Color Ever
	use({
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
		tag = 'nightly'
	})
	use 'nvim-tree/nvim-web-devicons'
	use 'nvim-lualine/lualine.nvim'
	use 'karb94/neoscroll.nvim'
	-- Treesitter
	use 'nvim-treesitter/nvim-treesitter'
	use "nvim-treesitter/nvim-treesitter-textobjects"
	use "nvim-treesitter/playground"
	use "sbdchd/neoformat" -- formatting the text
	-- start screen
	use 'glepnir/dashboard-nvim'
	-- Telescope Requirements
	use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/plenary.nvim' } } }
	use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
	-- completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'
	use 'saadparwaiz1/cmp_luasnip'
	use "rafamadriz/friendly-snippets"
	use "epilande/vim-react-snippets" -- react Snippets
	use {
		"windwp/nvim-autopairs",
		config = function() require("nvim-autopairs").setup {} end
	}
	use "onsails/lspkind.nvim"
	-- sql
	use 'shmup/vim-sql-syntax'
	-- golang
	use { 'fatih/vim-go', run = ':GoUpdateBinaries' }
	-- language server
	use 'neovim/nvim-lspconfig'
	use 'ap/vim-css-color'

	-- WEBDEV
	use "jiangmiao/auto-pairs"
	use "maxmellon/vim-jsx-pretty"
	use "mattn/emmet-vim"

	use({
		'phpactor/phpactor',
		branch = 'master',
		ft = 'php',
		run = 'composer install --no-dev -o',
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
