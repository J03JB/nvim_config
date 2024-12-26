local M = {

	"neovim/nvim-lspconfig",

	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		{ "antosha417/nvim-lsp-file-operations", config = true },
        { "saghen/blink.cmp" },
	},
}
local function lsp_keymaps(bufnr)
	local opts = { noremap = true, silent = true }
	local keymap = vim.keymap -- for conciseness
	-- set keybinds
	keymap.set("n", "gd",         "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
	keymap.set("n", "gD",         vim.lsp.buf.declaration, opts) -- go to declaration
	keymap.set("n", "gi",         "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
	keymap.set("n", "gr",         vim.lsp.buf.references, opts)
	keymap.set("n", "gR",         "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
	keymap.set("n", "gt",         "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
	keymap.set("n", "K",          vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
	keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
	keymap.set("n", "<leader>d",  vim.diagnostic.open_float, opts) -- show diagnostics for line
	keymap.set("n", "<leader>D",  "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
	keymap.set("n", "<leader>lh", "<cmd>lua require('jb.plugins.lsp.lspconfig').inlay_toggle()<CR>)", opts)
	keymap.set("n", "<leader>q",  vim.diagnostic.setloclist, opts)
	keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
	keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
	keymap.set("n", "[d",         vim.diagnostic.goto_prev, opts)
	keymap.set("n", "]d",         vim.diagnostic.goto_next, opts)
    -- figure this out for deprecated above
	-- keymap.set("n", "[d",         vim.diagnostic.jump({count=-1, float=true }), opts)
	-- keymap.set("n", "]d",         vim.diagnostic.jump({count=1, float=true }), opts)
end

M.on_attach = function(client, bufnr)
	lsp_keymaps(bufnr)

	if client.supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true)
	end

	if client.server_capabilities.documentHighlightProvider then
		vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
			buffer = bufnr,
			callback = vim.lsp.buf.document_highlight,
		})

		vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
			buffer = bufnr,
			callback = vim.lsp.buf.clear_references,
		})
	end
end

-- Diagnostic Settings
-- Add border to floating windows for lsp diagnostics
local border = vim.g.floating_window_border

local handlers = {
	["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border }),
	["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border }),
}

-- Change the Diagnostic symbols in the sign column (gutter)
local deez_icons = {
	[vim.diagnostic.severity.ERROR] = " ",
	[vim.diagnostic.severity.WARN] = " ",
	[vim.diagnostic.severity.HINT] = "󰠠 ",
	[vim.diagnostic.severity.INFO] = " ",
}

-- Apply diagnostics settings
vim.diagnostic.config({
	float = { border = border, source = "if_many" },
	signs = { text = deez_icons },
})

function M.config()
	local lspconfig = require("lspconfig")
	local servers = {
		"html",
		"pyright",
		"bashls",
		"eslint",
		"lua_ls",
		"tailwindcss",
		"vimls",
		"jsonls",
		"marksman",
		"ts_ls",
		"htmx",
		"yamlls",
		"gopls",
	}

    local capabilities = require('blink.cmp').get_lsp_capabilities()

	for _, server in ipairs(servers) do
		local opts = {
			on_attach = M.on_attach,

			capabilities = capabilities,
			handlers = handlers,
		}

		local require_ok, settings = pcall(require, "jb.lspsettings." .. server)
		if require_ok then
			---@diagnostic disable-next-line: cast-local-type
			opts = vim.tbl_deep_extend("force", settings, opts)
		end

		lspconfig[server].setup(opts)
	end
end

return M
