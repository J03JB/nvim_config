<<<<<<< HEAD:lsp/eslint.lua
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
||||||| 20a35da:lsp/javascript.lua
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

-- {{{
vim.lsp.config["jsonls"] = {
    cmd = { "vscode-json-language-server", "--stdio" },
    filetypes = { "json", "jsonc" },
}
-- }}}
=======
>>> a4f067524c90f6d7dfcb19e7f76ab9557bbc265c:lsp/javascript.lua
