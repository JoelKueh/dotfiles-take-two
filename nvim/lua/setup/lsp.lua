local M = {}

function M.setup_lsp()
	local lspconf = require("lspconfig")
	local mason = require("mason")
	local masonconf = require("mason-lspconfig")

	mason.setup()
	masonconf.setup()

	lspconf.rust_analyzer.setup({})
	lspconf.clangd.setup({
		cmd = {
			'clangd',
			'--query-driver=/usr/bin/g++'
		},
		filetypes = { "c", "cpp" },
	})
	lspconf.lua_ls.setup({
		on_init = function(client)
			local path = client.workspace_folders[1].name
			if vim.loop.fs_stat(path..'/.luarc.json')
				or vim.loop.fs_stat(path..'/.luarc.jsonc') then
				return
			end

			client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
				runtime = {
					version = 'LuaJIT'
				},
				workspace = {
					checkThirdParty = false,
					library = {
						vim.env.VIMRUNTIME
					}
				}
			})
		end,
		settings = {
			Lua = {}
		}
	})
end

function M.setup_cmp()
	local cmp = require("cmp")

	vim.opt.completeopt = { "menu", "menuone" }

	cmp.setup({
		snippet = {
			expand = function(args)
				require('luasnip').lsp_expand(args.boxy)
			end,
		},
		window = {

		},
		mapping = cmp.mapping.preset.insert({
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			['<C-b>'] = cmp.mapping.scroll_docs(-4),
			['<C-f>'] = cmp.mapping.scroll_docs(4),
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-e>'] = cmp.mapping.abort(),
			['<C-y>'] = cmp.mapping.confirm({ select = true }),
		}),
		sources = {
			{ name = "nvim_lsp" },
			{ name = "luasnip" },
			{ name = "buffer" },
			{ name = "path" },
		}
	})
end

return M
