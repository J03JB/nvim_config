	local servers = {
		"html",
		"vimls",
		"jsonls",
		"ts_ls",
		"htmx",
		"yamlls",
		"gopls",
}
    	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename



-- github repo with vi,.lsp:
    -- https://github.com/LJFRIESE/nvim
