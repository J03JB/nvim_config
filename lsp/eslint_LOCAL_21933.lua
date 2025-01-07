-- Eslint {{{
vim.lsp.config["eslint"] = {
	cmd = { "vscode-eslint-language-server", "--stdio" },
	root_markers = { "package.json", "package-lock.json" },
	filetypes = {
		"javascript",
		"javascriptreact",
	},
	single_file_support = true,
}
-- }}}
