local M = {

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {},
	},

	{
		"laytan/cloak.nvim",

		config = function()
			local cloak = require("cloak")
			cloak.setup({
				enabled = true,
				cloak_character = "*",
				highlight_group = "Comment",
				cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
				try_all_patterns = true,
				patterns = {
					{
						file_pattern = ".env*",
						cloak_pattern = "=.+",
						replace = nil,
					},
				},
			})
		end,
	},
}

return M
