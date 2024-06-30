
local M = {}

function M.setup_treesitter()
	local configs = require("nvim-treesitter.configs")

	configs.setup({
		ensure_installed = {
			"c",
			"lua",
			"vim",
			"vimdoc",
			"query",
			"elixir",
			"heex",
			"javascript",
			"html",
			"markdown"
		},
		sync_install = false,
	highlight = { enable = true },
		indent = { enable = true },
	})

	vim.keymap.set("n", "<leader>e", '<cmd>lua vim.diagnostic.open_float()<CR>', { noremap=true, silent=true} )
end

function M.setup_telescope()

end

return M
