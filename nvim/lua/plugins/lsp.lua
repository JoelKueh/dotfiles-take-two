local lsp = require('setup.lsp')

return {
	-- LuaSnip
	{
		"L3MON4D3/LuaSnip",
		version = "v2.*",
		dependencies = {
			'saadparwaiz1/cmp_luasnip'
		}
	},
	-- nvim-cmp
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-omni"
		},
		config = function()
			lsp.setup_cmp()
		end,
	},
	-- lspconfig
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim"
		},
		config = function()
			lsp.setup_lsp()
		end,
	},
}
