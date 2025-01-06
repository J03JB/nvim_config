-- Lua_ls {{{
vim.lsp.config["lua_ls"] = {
    cmd = { "lua-language-server" },
	filetypes = { "lua" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
				},
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}
-- }}}
