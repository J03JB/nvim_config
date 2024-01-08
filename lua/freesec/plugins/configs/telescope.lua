return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"tsakirist/telescope-lazy.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
	},

	config = function()
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
						prompt_position = "bottom",
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
				lazy = {
					theme = "ivy",
					layout_config = {
						height = 0.5,
					},
				},
				["ui-select"] = {
					require("telescope.themes").get_dropdown({
						-- layout_config = {
						-- prompt_position = "top",
						-- },
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
					prompt_position = "top",
					preview_cutoff = 120,
					horizontal = { mirror = false },
					vertical = { mirror = false },
				},
				file_sorter = require("telescope.sorters").get_fzy_sorter,
				file_ignore_patterns = { "gtk/**/*", ".git/", "go/", "node_modules/", ".gem/", "Pictures" },
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
		require("telescope").load_extension("harpoon")
		require("telescope").load_extension("lazy")

		-- custom previews
		require("freesec.telescope-custom")

        -- Keymaps 
		local map = require("freesec.utils").map

		map("n", "<leader>bb", ":Telescope buffers theme=dropdown<CR>")
		map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>")
		map("n", "<leader>fc", ":Telescope git_commits<cr>")
		map("n", "<leader>fd", '<cmd>lua require"freesec.telescope-custom".dotfiles()<cr>')
		map("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")
		map("n", "<leader>fg", ":Telescope git_files<CR>")
		map("n", "<leader>fh", ":Telescope help_tags<CR>")
		map("n", "<leader>flh", ":Telescope lazy<CR>")
		map("n", "<leader>fm", ":Telescope harpoon marks theme=dropdown<CR>")
		map("n", "<leader>fp", ":Telescope find_files<CR>")
		map("n", "<leader>fq", ":Telescope quickfix<CR>")
		map("n", "<leader>fr", ":Telescope oldfiles <CR>")
		map("n", "<leader>fs", ":Telescope grep_string<cr>")
		map("n", "<leader>fw", ":Telescope live_grep<CR>")
		map("n", "<leader>fx", ":Telescope git_status<cr>")
		map("n", "<leader>tr", ":Telescope resume<CR>")
	end,
}
