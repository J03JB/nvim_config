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
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup({
				---Render style
				---@usage 'background'|'foreground'|'virtual'
				render = "virtual",
				---Set virtual symbol (requires render to be set to 'virtual')
				virtual_symbol = "■",
				---Highlight named colors, e.g. 'green'
				enable_named_colors = true,
				---Highlight tailwind colors, e.g. 'bg-blue-500'
				enable_tailwind = true,
			})
		end,
	},
}

return M
