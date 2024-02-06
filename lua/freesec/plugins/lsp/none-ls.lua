return {
	"nvimtools/none-ls.nvim",
	event = { "BufReadPre", "BufNewFile" },
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
		null_ls.setup({
			sources = {
				null_ls.builtins.diagnostics.eslint,
				null_ls.builtins.diagnostics.jsonlint,
				null_ls.builtins.diagnostics.markdownlint.with({ filetypes = { "markdown", "vimwiki" } }),
				null_ls.builtins.formatting.autopep8,
				null_ls.builtins.formatting.black,
				null_ls.builtins.formatting.markdownlint.with({ filetypes = { "markdown", "vimwiki" } }),
				null_ls.builtins.formatting.prettier.with({
					filetypes = { "html", "jsonc", "markdown", "javascript", "json", "toml", "yaml", "markdown" },
				}),
				null_ls.builtins.formatting.rustfmt,
				null_ls.builtins.formatting.jq,
				null_ls.builtins.formatting.shfmt,
				null_ls.builtins.formatting.stylua.with({ filetypes = { "lua" } }),
				null_ls.builtins.formatting.yamlfmt.with({ filetypes = { "yaml" } }),
				null_ls.builtins.code_actions.gitsigns,
				null_ls.builtins.code_actions.refactoring,
			},
		})

		local opts = { silent = false }
		vim.api.nvim_set_keymap("n", "<A-f>", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
		vim.api.nvim_set_keymap("n", "<leader>F", "<cmd>lua vim.lsp.buf.format()<CR>", opts)
	end,
}
