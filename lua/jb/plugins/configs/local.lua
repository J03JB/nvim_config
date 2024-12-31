-----------------------------------------------------------------------------------------------
-- Plugin Dev
-----------------------------------------------------------------------------------------------
local M = {
	{ dir = "~/Dev/Plugins/teleprompt.nvim" },
	{
		dir = "~/Dev/Plugins/gitbar.nvim",
		dependencies = { "MunifTanjim/nui.nvim" },
		dev = true,
},
	{
		"J03JB/pasta.nvim",
		dir = "~/Dev/Plugins/pasta.nvim",
		init = function()
			require("pasta").setup()
		end,
	},
}

return M
