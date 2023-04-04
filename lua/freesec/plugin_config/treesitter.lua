require("nvim-treesitter.configs").setup({
	ensure_installed = { "rust", "toml", "c", "lua", "vim", "help", "javascript", "typescript", "python" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = true,
	},
	rainbow = {
		enable = true,
		query = "rainbow-parens",
		-- extended = true,
		strategy = require("ts-rainbow").strategy.global,
	},
	indent = {
		enable = false,
	},
	refactor = {
		highlight_definitions = {
			enable = true,
		},
	},
	autotag = {
		enable = true,
	},
	context_commentstring = {
		enable = true,
	},
	textobjects = {
		select = {
			enable = true,
			keymaps = {
				["af"] = "@function.outer",
				["if"] = "@function.inner",
				["ac"] = "@class.outer",
				["ic"] = "@class.inner",
			},
		},
	},
})
