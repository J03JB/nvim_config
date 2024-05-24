local map = require("jb.utils").map
local themes = require("telescope.themes")
local M = {}

function M.dotfiles()
	require("telescope.builtin").find_files(themes.get_dropdown({
		winblend = 10,
		prompt_title = "< dotfiles >",
		cwd = "$HOME/Dev/dotfiles/",
		hidden = true,
		previewer = false,
	}))
end

map("n", "<leader>fd", '<cmd>lua require"jb.telescope-custom".dotfiles()<cr>')

function M.grep_last_search()
	require("telescope.builtin").grep_string({
		search = vim.fn.getreg("/"):gsub("\\<", ""):gsub("\\>", ""):gsub("\\C", ""),
		word_match = "-w",
		path_display = { "shorten" },
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.75,
			height = 0.4,
			prompt_position = "bottom",
		},
		initial_mode = "normal",
		-- previewer = false,
	})
end

map("n", "<leader>f/", '<cmd>lua require"jb.telescope-custom".grep_last_search()<cr>')

function M.edit_zsh()
	require("telescope.builtin").find_files({
		shorten_path = false,
		prompt_title = "~ dotfiles ~",
		cwd = "~/.config/zsh/",
		hidden = true,

		layout_strategy = "horizontal",
		layout_config = {
			preview_width = 0.55,
		},
	})
end

map("n", "<leader>ez", '<cmd>lua require"jb.telescope-custom".edit_zsh()<cr>')

function M.edit_neovim()
	local opts

	opts = {
		prompt_title = "< nvim config >",
		shorten_path = false,
		cwd = "~/.config/nvim",

		layout_strategy = "flex",
		layout_config = {
			width = 0.9,
			height = 0.8,

			horizontal = {
				width = { padding = 0.15 },
			},
			vertical = {
				preview_height = 0.75,
			},
		},

		mappings = {
			i = {
				["<C-y>"] = false,
			},
		},
	}

	require("telescope.builtin").find_files(opts)
end

map("n", "<leader>ev", '<cmd>lua require"jb.telescope-custom".edit_neovim()<cr>')

return M
