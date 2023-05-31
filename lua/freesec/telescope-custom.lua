local map = require("freesec.utils").map
local M = {}

function M.dotfiles()
	require("telescope.builtin").find_files({
		prompt_title = "< config >",
		prompt_prefix = "🔍",
		cwd = "$HOME/Dev/dotfiles/",
		hidden = true,
	})
end

map("n", "<leader>fd", '<cmd>lua require"freesec.telescope-custom".dotfiles()<cr>')

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

map("n", "<leader>f/", '<cmd>lua require"freesec.telescope-custom".grep_last_search()<cr>')

return M
