-- Tailwindcss {{{
vim.lsp.config["tailwindcss"] = {
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
-- }}}
