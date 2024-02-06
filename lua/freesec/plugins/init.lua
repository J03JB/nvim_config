local M = {
	-----------------------------------------------------------------------------------------------
	-- Global plugins
	-----------------------------------------------------------------------------------------------
	"nvim-lua/plenary.nvim",
	{ "nvim-tree/nvim-web-devicons", lazy = false },

	-----------------------------------------------------------------------------------------------
	--  Colorschemes
	-----------------------------------------------------------------------------------------------
	"EdenEast/nightfox.nvim",
	"navarasu/onedark.nvim",
	"projekt0n/caret.nvim",
	"folke/tokyonight.nvim",
	"scottmckendry/cyberdream.nvim",
	{ "catppuccin/nvim", name = "catppuccin" },

	-----------------------------------------------------------------------------------------------
	-- Quality of Life
	-----------------------------------------------------------------------------------------------
	{
		"brenoprata10/nvim-highlight-colors",
		config = function()
			require("nvim-highlight-colors").setup()
		end,
	},
	{ "lukas-reineke/indent-blankline.nvim", event = "BufRead", main = "ibl", opts = {} },
	-- { "saecki/crates.nvim", event = { "BufRead Cargo.toml" } },
	{ "aouelete/sway-vim-syntax", ft = "sway" },
	{ "fladson/vim-kitty" },

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
        keys = {
            { "<leader>md", "<cmd>MarkdownPreview<CR>", desc = "toggle MarkdownPreview" },
        },
	},

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

	-----------------------------------------------------------------------------------------------
	-- Plugin Dev
	-----------------------------------------------------------------------------------------------
	{
		dir = "~/Dev/Plugins/",
	},
}

return M
