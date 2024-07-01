local setup = require('setup.bulk')

return {
	-- the colorscheme should be available when starting Neovim
	{
		"gbprod/nord.nvim",
		lazy = false, -- make sure we load this during startup if it is your main colorscheme
		priority = 1000, -- make sure to load this before all the other start plugins
		config = function()
			-- load the colorscheme here
			vim.cmd([[colorscheme nord]])
		end,
	},

	{
		"dstein64/vim-startuptime",
		cmd = "StartupTime",
		-- init is called during startup. Configuration for vim plugins typically should be set in an init function
		init = function()
			vim.g.startuptime_tries = 10
		end,
	},

	-- if some code requires a module from an unloaded plugin, it will be automatically loaded.
	-- So for api plugins like devicons, we can always set lazy=true
	{ "nvim-tree/nvim-web-devicons", lazy = true },

	-- you can use the VeryLazy event for things that can
	-- load later and are not important for the initial UI
	{ "stevearc/dressing.nvim", event = "VeryLazy" },

	-- undotree
	{
		"jiaoshijie/undotree",
		dependencies = "nvim-lua/plenary.nvim",
		config = setup.setup_undotree
	},
	{ "folke/which-key.nvim" },
}

