return {
	"mrcjkb/rustaceanvim",
	version = "^3",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"mfussenegger/nvim-dap",
	},
	ft = { "rust" },
	config = function()
		vim.g.rustaceanvim = {
			inlay_hints = {
				highlight = "NonText",
			},
			tools = {
				hover_actions = {
					auto_focus = true,
				},
			},
			settings = {
				["rust-analyzer"] = {
					imports = {
						granularity = {
							group = "module",
						},
						prefix = "self",
					},
					project_root = "rust-analyzer.json",
					cargo = {
						features = { "ssr" },
						loadOutDirsFromCheck = true,
						buildScripts = {
							enable = true,
						},
					},
					check = {
						features = { "ssr" },
					},
					-- Add clippy lints for Rust.
					checkOnSave = {
						features = { "ssr" },
						command = "clippy",
						extraArgs = { "--no-deps" },
					},
					procMacro = {
						enable = false,
					},
				},
			},
			-- server = {
			-- 	on_attach = function(client, bufnr)
			-- 		require("lsp-inlayhints").on_attach(client, bufnr)
			-- 	end,
			-- },
		}
	end,
}
