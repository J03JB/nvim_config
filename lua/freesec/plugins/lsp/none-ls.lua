return {
	"nvimtools/none-ls.nvim", -- configure formatters & linters
	lazy = true,
	event = { "BufReadPre", "BufNewFile" }, -- to enable uncomment this
	dependencies = { "jay-babu/mason-null-ls.nvim" },

	config = function()
		local mason_null_ls = require("mason-null-ls")

		local null_ls = require("null-ls")

		mason_null_ls.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"black", -- python formatter
				"pylint", -- python linter
				"eslint_d", -- js linter
			},
		})
		-- local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.formatting.autopep8,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.prettier.with({ filetypes = { "json", "toml", "yaml", "markdown" } }),
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.jq,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.code_actions.gitsigns,
			},
			-- on_attach = function(client, bufnr)
			-- 	if client.supports_method("textDocument/formatting") then
			-- 		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			-- 		vim.api.nvim_create_autocmd("BufWritePre", {
			-- 			group = augroup,
			-- 			buffer = bufnr,
			-- 			callback = function()
			-- 				vim.lsp.buf.format({ bufnr = bufnr })
			-- 			end,
			-- 		})
			-- 	end
			-- end,
		})

		local opts = { silent = false }
		vim.api.nvim_set_keymap("n", "<A-f>", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>F", "<cmd>lua vim.lsp.buf.format()<CR>", opts)

		-- local lsp_formatting = function(bufnr)
		-- 	vim.lsp.buf.format({
		-- 		filter = function(client)
		-- 			return client.name == "null-ls"
		-- 		end,
		-- 		bufnr = bufnr,
		-- 	})
	end,
}