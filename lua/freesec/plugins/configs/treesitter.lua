return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		dependencies = {
				"nvim-treesitter/nvim-treesitter-textobjects",
				"windwp/nvim-ts-autotag",
				"jose-elias-alvarez/nvim-lsp-ts-utils",
				"JoosepAlviste/nvim-ts-context-commentstring",
				"nvim-treesitter/nvim-treesitter-context",
		},
        event = { "BufEnter" },
		config = function()
			local treesitter = require("nvim-treesitter.configs")

			treesitter.setup({
				ensure_installed = { "rust", "toml", "c", "lua", "vim", "vimdoc", "javascript", "typescript", "python" },
				ignore_install = {},
				sync_install = false,
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = {
					enable = true,
				},
				modules = {},
				refactor = {
					highlight_definitions = {
						enable = true,
					},
				},
				autotag = {
					enable = true,
				},
                -- context_commentstring = {
                --     enable = true,
                --     enable_autocmd = true,
                -- },
				textobjects = {
					select = {
						enable = true,
						keymaps = {
							["af"] = "@function.outer",
							["if"] = "@function.inner",
							["ab"] = "@block.outer",
							["ib"] = "@block.inner",
							["ac"] = "@class.outer",
							["ic"] = "@class.inner",
							["is"] = "@statements.inner",
							["as"] = "@statements.outer",
						},
					},
				},
				incremental_selection = {
					enable = true,
					keymaps = {
						node_incremental = "v",
						node_decremental = "V",
					},
				},
			})

			-- commentstring disable autocmd
			require("ts_context_commentstring").setup({
				enable_autocmd = false,
                config = {},
                languages = {},
                commentary_integration = {},
			})
			vim.g.skip_ts_context_commentstring_module = true
		end,
	},
}
