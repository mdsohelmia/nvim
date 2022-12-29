-- autocomplete
-- language servers
lspconfig = require('lspconfig')
-- html
lspconfig.html.setup {}

-- css
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

lspconfig.cssls.setup {
	capabilities = capabilities,
}

lspconfig.tsserver.setup {}

lspconfig.gopls.setup {
	lspconfig.gopls.setup {
		cmd = { "gopls", "serve" },
		settings = {
			analyses = {
				unusedparams = true
			},
			staticcheck = true
		}
	}
}


lspconfig.rust_analyzer.setup({
	settings = {
		["rust-analyzer"] = {
			imports = {
				granularity = {
					group = "module",
				},
				prefix = "self",
			},
			cargo = {
				buildScripts = {
					enable = true,
				},
			},
			procMacro = {
				enable = true
			},
		}
	}
})


lspconfig.sqls.setup {
	settings = {
		sqls = {
			lowercaseKeywords = true,
			connections = {}
		}
	},
	on_attach = function(client, buffer)
		require('sqls').on_attach(client, buffer)
	end
}
lspconfig.sumneko_lua.setup({
	capabilities = capabilities,
	-- cmd = { '/opt/lua-language-server/bin/lua-language-server', '-E', '/opt/lua-language-server/bin/main.lua' },
	cmd = { 'lua-language-server' },
	settings = {
		Lua = {
			runtime = {
				version = 'LuaJIT',
				-- path = runtime_path,
			},
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				-- ['undefined-global'] = false,
				globals = { 'vim' },
			},
			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file('', true),
			},
			telemetry = { enable = false },
		},
	},
})
