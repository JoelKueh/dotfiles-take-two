local setup = require('setup.file')

return {
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		config = setup.setup_treesitter
	},
	-- telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = setup.setup_telescope
	},
	-- persistnace
	{
		"folke/persistence.nvim",
		event = { "BufReadPre", "BufNewFile" },
		opts = {
			-- add any custom options here
		},
		config = setup.setup_persistence
	},
}
