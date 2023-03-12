require("nvim-treesitter.configs").setup({
	ensure_installed = { "rust", "toml", "c", "lua", "vim", "help", "javascript", "typescript", "python" },
	sync_install = false,
	auto_install = true,
	highlight = {
		enable = true,
		language_tree = true,
	},
	rainbow = {
		enable = true,
		-- extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
		max_file_lines = 1000, -- Do not enable for files with more than 1000 lines, int
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
