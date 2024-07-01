
local M = {}

function M.setup_undotree()
	require('undotree')
	vim.keymap.set('n', '<leader>u', require('undotree').toggle, {
		noremap = true,
		silent = true,
		desc = "Toggle undotree"
	})
end

return M

