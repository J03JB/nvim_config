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
    "sainnhe/sonokai",
	"folke/tokyonight.nvim",
	"oxfist/night-owl.nvim",
	"HoNamDuong/hybrid.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },
	{ "rose-pine/neovim", name = "rose-pine" },
	{
		"J03JB/cyberdream.nvim",
		-- dir = "~/Dev/cyberdream.nvim/",
		-- dev = true,
	},
    "timmypidashev/darkbox.nvim",

	-----------------------------------------------------------------------------------------------
	-- Quality of Life
	-----------------------------------------------------------------------------------------------
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- { "saecki/crates.nvim", event = { "BufRead Cargo.toml" } },
	{ "aouelete/sway-vim-syntax", ft = "sway" },
	{ "mbbill/undotree" },
	{ "fladson/vim-kitty" },
	{
		"sindrets/diffview.nvim",
		keys = {
			{ "<space>vv", ":DiffviewOpen ", desc = "Open DiffView" },
		},
	},
	-----------------------------------------------------------------------------------------------
	-- TrueZen
	-----------------------------------------------------------------------------------------------
	{
		"kdav5758/TrueZen.nvim",
		keys = {

			{ "<leader>tz", ":TZAtaraxis <CR>", desc = "TrueZen toggle" },
		},
	},

	-----------------------------------------------------------------------------------------------
	-- Which Key
	-----------------------------------------------------------------------------------------------
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
	},

	-----------------------------------------------------------------------------------------------
	-- Markdown Preview
	-----------------------------------------------------------------------------------------------
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
	},

    -- http-client
    { 'mistweaverco/kulala.nvim', opts = {} },

	-----------------------------------------------------------------------------------------------
	-- Vim-snippets implemented in Luasnip
	-----------------------------------------------------------------------------------------------
	-- {
	--     'mireq/luasnip-snippets',
	--     dependencies = {'L3MON4D3/LuaSnip'},
	--     event = "InsertEnter",
	--     init = function()
	--         require('luasnip_snippets.common.snip_utils').setup()
	--     end
	-- },

}

return M
