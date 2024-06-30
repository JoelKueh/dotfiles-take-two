local builtin = require('telescope.builtin')
local setup = require('setup.file')

return {
	-- nvim-treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })()
		end,
		config = function()
			setup.setup_treesitter()
		end
	},
	-- telescope
	{
		'nvim-telescope/telescope.nvim',
		dependencies = { 'nvim-lua/plenary.nvim' },
		config = function()
			setup.setup_telescope()
		end,
		keys = {
			-- File pickers
			{ '<leader>pf', builtin.find_files },
			{ '<leader>ps', builtin.live_grep },
			{ '<leader>pb', builtin.buffers },

			-- Lsp pickers
			{ '<leader>pe', builtin.diagnostics },
			{ '<leader>pr', builtin.lsp_references },
			{ '<leader>pi', builtin.lsp_incoming_calls },
			{ '<leader>po', builtin.lsp_outgoing_calls },

			-- Utility pickers
			{ '<leader>pg', builtin.live_grep },
			{ '<leader>pc', builtin.colorscheme },
		}
	},
	-- persistnace
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
		opts = {
			-- add any custom options here
		}
	},
}
