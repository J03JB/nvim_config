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
        if client:supports_method("textDocument/declaration") then
            vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = true })
        end
        vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = true })
		vim.keymap.set("n", "[d", function() vim.diagnostic.jump({count=-1, float=true}) end)
		vim.keymap.set("n", "]d", function() vim.diagnostic.jump({count=1, float=true}) end)
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
	[vim.diagnostic.severity.HINT] = " ",
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
    capabilities = require("blink.cmp").get_lsp_capabilities(),
	root_markers = { ".git" },
})

-- TODO: make this into a function
-- Enable servers
lsp.enable('lua_ls')
lsp.enable("pyright")
lsp.enable('gopls')
lsp.enable("tailwindcss")
lsp.enable("yamlls")
lsp.enable("ts_ls")
lsp.enable("eslint")
lsp.enable("jsonls")
lsp.enable("bashls")
lsp.enable("marksman")
