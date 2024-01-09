return {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.stdpath("config") .. "/lua"] = true,
				},
			},
            hint = {
                enable = false,
                arrayIndex = "Disable",
                await = true,
                paraName = "Disable",
                paramType = false,
                semicolon = "All",
                setType = false,
            },
		},
	},
}
