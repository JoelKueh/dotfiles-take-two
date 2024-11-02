local M = {}

function M.setup_lsp()
	local lspconf = require("lspconfig")
	local mason = require("mason")
	local masonconf = require("mason-lspconfig")
	local capabilities = vim.lsp.protocol.make_client_capabilities()
	capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

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
	lspconf.cmake.setup({})
	lspconf.gdscript.setup(capabilities)
	lspconf.csharp_ls.setup({})
	--lspconf.omnisharp.setup({})
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

function M.setup_knap()
	local knap = require("knap")

	local function map(mode, l, r, desc)
		vim.keymap.set(mode, l, r, { buffer = buffer, desc = desc })
	end

	map("n", "<leader>li", knap.process_once, "Knap Process Once")
	map("n", "<leader>lc", knap.close_viewer, "Knap Close")
	map("n", "<leader>ll", knap.toggle_autopreviewing, "Knap Toggle Autopreview")
	map("n", "<leader>lf", knap.forward_jump, "Knap Forward Jump")

	--local gknapsettings = {
	--	texoutputext = "pdf",
	--	textopdf = "pdflatex -synctex=1 -halt-on-error -interaction=batchmode %docroot%",
	--	textopdfviewerlaunch = "mupdf %outputfile%",
	--	textopdfviewerrefresh = "kill -HUP %pid%"
	--}
	--vim.g.knap_settings = gknapsettings
end

return M
