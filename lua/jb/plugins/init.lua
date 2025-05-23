local M = {
	-----------------------------------------------------------------------------------------------
	-- Global plugins
	-----------------------------------------------------------------------------------------------
	"nvim-lua/plenary.nvim",
	{ "nvim-tree/nvim-web-devicons", lazy = false },

	-----------------------------------------------------------------------------------------------
	--  Colorschemes
	-----------------------------------------------------------------------------------------------
	"navarasu/onedark.nvim",
	"folke/tokyonight.nvim",
	"oxfist/night-owl.nvim",
	"HoNamDuong/hybrid.nvim",
	{
		"J03JB/cyberdream.nvim",
		-- dir = "~/Dev/cyberdream.nvim/",
		-- dev = true,
	},

	-----------------------------------------------------------------------------------------------
	-- Quality of Life
	-----------------------------------------------------------------------------------------------
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	{ "mbbill/undotree" },
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<space>vv", ":DiffviewOpen ", desc = "Open DiffView" },
		},
	},

	-----------------------------------------------------------------------------------------------
	-- Which Key
	-----------------------------------------------------------------------------------------------
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},

}

return M
