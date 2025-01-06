-- Marksman {{{
vim.lsp.config["marksman"] = {
	cmd = { "marksman", "server" },
	filetypes = { "markdown" },
}

-- }}}
-- ctags {{{
vim.lsp.config["ctags-lsp"] = {
    cmd = { "ctags-lsp" },
}
-- }}}

