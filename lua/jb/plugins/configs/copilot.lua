return {
	{
		"zbirenbaum/copilot.lua",
        enabled = false,
		cmd = "Copilot",
		event = "InsertEnter",
		build = ":Copilot auth",
		opts = {
			suggestion = { enabled = false },
			panel = { enabled = false },
		},
	},
	{
		"CopilotC-Nvim/CopilotChat.nvim",
		lazy = true,
		event = "VeryLazy",
		enabled = false,
		branch = "main",
		dependencies = {
			{ "zbirenbaum/copilot.lua" },
			{ "nvim-lua/plenary.nvim" },
		},
		opts = {
			debug = false, -- Enable debugging
		},
		config = function(_, opts)
			require("CopilotChat").setup(opts)
		end,
		keys = {}
	},
}
