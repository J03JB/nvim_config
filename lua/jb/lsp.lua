local lsp = vim.lsp

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client:supports_method("textDocument/implementation") then
			vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = true })
		end
		if client:supports_method("textDocument/inlayHint") then
			vim.lsp.inlay_hint.enable(true)
		end
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

		if client.server_capabilities.documentHighlightProvider then
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = args.buf,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = args.buf,
				callback = vim.lsp.buf.clear_references,
			})
		end
	end,
})

-- Diagnostic Settings
-- Change the Diagnostic symbols in the sign column (gutter)
local deez_icons = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.HINT] = "󰠠 ",
	[vim.diagnostic.severity.INFO] = " ",
}

-- Apply diagnostics settings
vim.diagnostic.config({
	float = { border = vim.g.floating_window_border, source = "if_many" },
	signs = { text = deez_icons },
	virtual_text = true,
})

-- LSP setup
lsp.config("*", {
	capabilities = {
		textDocument = {
			semanticTokens = {
				multilineTokenSupport = true,
			},
		},
	},
	root_markers = { ".git" },
})

-- Lua Lsp {{
lsp.config["lua_ls"] = {
	cmd = { "lua-language-server" },
	filetypes = { "lua" },
	root_markers = { ".git" },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					-- [vim.fn.stdpath("config") .. "/lua"] = true,
				},
				checkThirdParty = false,
			},
			telemetry = { enable = false },
		},
	},
}
lsp.enable("lua_ls")
-- }}

-- Pyright lsp {{
lsp.config["pyright"] = {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				diagnosticMode = "openFilesOnly",
				useLibraryCodeForTypes = true,
			},
		},
	},
}
lsp.enable("pyright")
-- }}

-- Marksman {{{
lsp.config["marksman"] = {
	cmd = { "marksman", "server" },
	filetypes = { "markdown" },
}
lsp.enable("marksman")
-- }}}

-- Gopls {{{
lsp.config["gopls"] = {
	cmd = { "gopls" },
	root_markers = { ".git", "go.mod", "go.work" },
	filetypes = { "go", "gomod", "gowork", "gotmpl" },
	settings = {
		gopls = {
			completeUnimported = true,
			usePlaceholders = true,
			analyses = {
				unusedparams = true,
			},
			["ui.inlayhint.hints"] = {
				compositeLiteralFields = true,
				constantValues = true,
				parameterNames = true,
				rangeVariableTypes = true,
			},
		},
	},
}
lsp.enable("gopls")
-- }}}

-- Bash Lsp {{
vim.lsp.config["bashls"] = {
	cmd = { "bash-language-server", "start" },
	filetypes = { "sh", "bash" },
}
vim.lsp.enable("bashls")
-- }}

-- Typescript server {{{
lsp.config["ts_ls"] = {
	init_options = { hostInfo = "neovim" },
	cmd = { "typescript-language-server", "--stdio" },
	filetypes = { "javascript", "javascriptreact", "javascript.jsx", "typescript", "typescriptreact", "typescript.tsx" },
	single_file_support = true,
}
lsp.enable("ts_ls")
-- }}}

-- Yamlls {{{
lsp.config["yamlls"] = {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yaml.docker-compose", "yaml.gitlab" },
	settings = {
		redhat = {
			telemetry = {
				enabled = false,
			},
		},
	},
}
lsp.enable("yamlls")
-- }}}

-- Eslint {{
lsp.config["eslint"] = {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	root_markers = { "package.json", "package-lock.json" },
	filetypes = {
		"typescript",
		"typescriptreact",
		"typescript.tsx",
		"javascript",
		"javascriptreact",
		"javascript.jsx",
	},
	single_file_support = true,
}
lsp.enable("eslint")
-- }}

-- Tailwindcss {{
lsp.config["tailwindcss"] = {
	cmd = { "tailwindcss-language-server", "--stdio" },
	filetypes = {
		-- 	"gohtml",
		-- 	"gohtmltmpl",
		"html",
		"css",
		-- 	"rust",
	},
	userLanguages = {
		rust = "html",
		rs = "html",
	},
	root_markers = { "tailwind.config.js", "tailwind.config.cjs", "tailwind.config.mjs", "tailwind.config.ts" },
	{
		settings = {
			tailwindCSS = {
				classAttributes = { "class", "className", "class:list", "classList", "ngClass" },
				includeLanguages = {
					eelixir = "html-eex",
					eruby = "erb",
					htmlangular = "html",
					templ = "html",
				},
				lint = {
					cssConflict = "warning",
					invalidApply = "error",
					invalidConfigPath = "error",
					invalidScreen = "error",
					invalidTailwindDirective = "error",
					invalidVariant = "error",
					recommendedVariantOrder = "warning",
				},
				validate = true,
			},
		},
	},
}
lsp.enable("tailwindcss")
-- }}
