local actions = require("telescope.actions")

-- Global remapping
------------------------------
-- '--color=never',
require("telescope").setup({
	pickers = {
		find_files = {
			layout_config = {
				height = 0.75,
				width = 0.75,
			},
		},
		oldfiles = {
			theme = "dropdown",
			previewer = false,
			layout_config = {
				prompt_position = "bottom",
			},
			winblend = 20,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
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
		["ui-select"] = {
			require("telescope.themes").get_dropdown({
				layout_config = {
					prompt_position = "top",
				},
			}),
		},
	},
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--with-filename",
			"--hidden",
			"--line-number",
			"--smart-case",
			"--column",
		},
		prompt_prefix = "  ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.75,
			-- prompt_position = "bottom",
			preview_cutoff = 120,
			horizontal = { mirror = false },
			vertical = { mirror = false },
		},
		file_sorter = require("telescope.sorters").get_fzy_sorter,
		file_ignore_patterns = { "gtk/**/*", ".git", "go/", "node_modules/", ".gem", "Pictures" },
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
				["<esc>"] = actions.close,
				["<CR>"] = actions.select_default + actions.center,
			},
			n = {
				["<C-j>"] = actions.move_selection_next,
				["<C-k>"] = actions.move_selection_previous,
			},
		},
	},
})
require("telescope").load_extension("ui-select")
require("telescope").load_extension("fzf")
require("telescope").load_extension("file_browser")
require("telescope").load_extension("possession")
