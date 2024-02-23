return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"tsakirist/telescope-lazy.nvim",
		{ "nvim-telescope/telescope-ui-select.nvim" },
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
		"debugloop/telescope-undo.nvim",
	},

	lazy = true,

	keys = {
		{ "<leader>bb", "<cmd>Telescope buffers theme=dropdown<CR>",       desc = "show buffers" },
		{ "<leader>fb", "<cmd>Telescope current_buffer_fuzzy_find<CR>",    desc = "search buffer" },
		{ "<leader>fc", "<cmd>Telescope commands<cr>",                     desc = "Telescope commands" },
		{ "<leader>fd", '<cmd>lua require"freesec.telescope-custom".dotfiles()<cr>', desc = "show dotfiles" },
		{ "<leader>ff", "<cmd>Telescope find_files hidden=true<CR>",       desc = "find files" },
		{ "<leader>fg", "<cmd>Telescope git_files<CR>",                    desc = "search git files" },
		{ "<leader>fh", "<cmd>Telescope help_tags<CR>",                    desc = "search help files" },
		{ "<leader>fk", "<cmd>Telescope keymaps<CR>",                      desc = "show keymaps" },
		{ "<leader>fl", "<cmd>Telescope lazy<CR>",                         desc = "show installed plugins" },
		{ "<leader>fm", "<cmd>Telescope harpoon marks theme=dropdown<CR>", desc = "show harpoon marks" },
		{ "<leader>fM", "<cmd>Telescope man_pages<CR>",                    desc = "search man pages" },
		{ "<leader>fp", "<cmd>Telescope find_files<CR>",                   desc = "find files" },
		{ "<leader>fq", "<cmd>Telescope quickfix<CR>",                     desc = "search quickfix" },
		{ "<leader>fr", "<cmd>Telescope oldfiles <CR>",                    desc = "show recent files" },
		{ "<leader>fR", "<cmd>Telescope registers<CR>",                    desc = "show registers" },
		{ "<leader>fs", "<cmd>Telescope grep_string<cr>",                  desc = "search word under cursor" },
		{ "<leader>fu", "<cmd>Telescope undo<CR>",                         desc = "show undo list" },
		{ "<leader>fw", "<cmd>Telescope live_grep<cr>",                    desc = "Live grep" },
		{ "<leader>fx", "<cmd>Telescope git_status<cr>",                   desc = "git status" },
		{ "<leader>gc", "<cmd>Telescope git_commits<cr>",                  desc = "show git commits" },
		{ "<leader>ss", "<cmd>Telescope spell_suggest theme=dropdown<cr>", desc = "spellig suggestions" },
		{ "<leader>tr", "<cmd>Telescope resume<CR>",                       desc = "" },
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
						prompt_position = "top",
					},
					winblend = 20,
				},
				buffers = {
					theme = "dropdown",
					previewer = false,
					initial_mode = "normal",
					mappings = {
						i = {
							["<C-d>"] = actions.delete_buffer,
						},
						n = {
							["dd"] = actions.delete_buffer,
						},
					},
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
					theme = "dropdown",
					winblend = 10,
				},
				undo = {
					layout_config = {
						height = 0.75,
						width = 0.75,
						prompt_position = "bottom",
					},
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
				preview = { treesitter = false },
				file_sorter = require("telescope.sorters").get_fzy_sorter,
				file_ignore_patterns = {
					"%.git/",
					"node_modules/",
					"%.npm/",
					"__pycache__/",
					"%[Cc]ache/",
					"%.dropbox/",
					"%.dropbox_trashed/",
					"%.local/share/Trash/",
					"%.py[c]",
					"%.sw.?",
					"~$",
					"%.tags",
					"%.gemtags",
					"%.tmp",
					"%.plist$",
					"%.pdf$",
					"%.jpg$",
					"%.JPG$",
					"%.jpeg$",
					"%.png$",
					"%.class$",
					"%.pdb$",
					"%.dll$",
				},
				generic_sorter = require("telescope.sorters").get_fzy_sorter,
				path_display = { "full" },
				winblend = 10,
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
		require("telescope").load_extension("fzf")
		require("telescope").load_extension("ui-select")

		-- custom previews
		require("freesec.telescope-custom")
	end,
}
