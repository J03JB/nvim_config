local actions = require("telescope.actions")

-- Global remapping
------------------------------
-- '--color=never',
require("telescope").setup({
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		packer = {
			theme = "ivy",
			layout_config = {
				height = 0.5,
			},
		},
		file_browser = {
			theme = "ivy",
			hijack_netrw = true,
			cwd_to_path = true,
		},
		luasnip = {
			theme = "ivy",
		},
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				-- even more opts
			}),
		},
	},
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--no-heading",
			"--with-filename",
			"--hidden",
			"--line-number",
			"--column",
			"--smart-case",
		},
		prompt_prefix = " 🔎 ",
		-- prompt_prefix = "  ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.75,
			prompt_position = "bottom",
			preview_cutoff = 120,
			horizontal = { mirror = false },
			vertical = { mirror = true },
		},
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		file_ignore_patterns = { "go/", "node_modules/", ".gem", "Pictures" },
		generic_sorter = require("telescope.sorters").get_fzy_sorter,
		path_display = { "full" },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		use_less = true,
		set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
		file_previewer = require("telescope.previewers").vim_buffer_cat.new,
		grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
		qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
		-- Developer configurations: Not meant for general override
		buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
		mappings = {
			i = {
				["<C-n>"] = actions.cycle_history_next,
				["<C-p>"] = actions.cycle_history_prev,
				["<C-c>"] = actions.close,
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
				-- To disable a keymap, put [map] = false
				-- So, to not map "<C-n>", just put
				-- ["<c-x>"] = false,
				["<esc>"] = actions.close,
				-- Otherwise, just set the mapping to the function that you want it to be.
				-- ["<C-i>"] = actions.select_horizontal,

				-- Add up multiple actions
				["<CR>"] = actions.select_default + actions.center,

				-- You can perform as many actions in a row as you like
				-- ["<CR>"] = actions.select_default + actions.center + my_cool_custom_action,
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})
require("telescope").load_extension("fzf")
require("telescope").load_extension("packer")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("ui-select")
require("telescope").load_extension("luasnip")
require("telescope").load_extension("possession")
