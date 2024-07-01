
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
end

function M.setup_telescope()
	local builtin = require("telescope.builtin")

	-- File pickers
	vim.keymap.set("n", '<leader>pf', builtin.find_files, {
		desc="Fuzzy find files"
	})
	vim.keymap.set("n", '<leader>ps', builtin.live_grep, {
		desc="Fuzzy live grep"
	})
	vim.keymap.set("n", '<leader>pb', builtin.buffers, {
		desc="Fuzzy open buffers"
	})

	-- Lsp pickers
	vim.keymap.set("n", '<leader>pe', builtin.diagnostics, {
		desc="Fuzzy lsp diagnostics"
	})
	vim.keymap.set("n", '<leader>pr', builtin.lsp_references, {
		desc="Fuzzy lsp references"
	})
	vim.keymap.set("n", '<leader>pi', builtin.lsp_incoming_calls, {
		desc="Fuzzy lsp incoming"
	})
	vim.keymap.set("n", '<leader>po', builtin.lsp_outgoing_calls, {
		desc="Fuzzy lsp outgoing"
	})

	-- Utility pickers
	vim.keymap.set("n", '<leader>pc', builtin.colorscheme, {
		desc="Fuzzy colorscheme"
	})

	-- Git pickers
	vim.keymap.set("n", '<leader>pg', builtin.git_files, {
		desc="Fuzzy live grep"
	})
end

function M.setup_persistence()
	-- restore the session for the current directory
	vim.api.nvim_set_keymap("n", "<leader>qs",
		[[<cmd>lua require("persistence").load()<cr>]], {
		desc = "Restore directory session"
	})
	-- restore the last session
	vim.api.nvim_set_keymap("n", "<leader>ql",
		[[<cmd>lua require("persistence").load({ last = true })<cr>]], {
		desc = "Restore last session"
	})
	-- stop Persistence => session won't be saved on exit
	vim.api.nvim_set_keymap("n", "<leader>qd",
		[[<cmd>lua require("persistence").stop()<cr>]], {
		desc = "Stop persistence"
	})
end

return M
