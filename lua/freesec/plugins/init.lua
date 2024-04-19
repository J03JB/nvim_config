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
	"folke/tokyonight.nvim",
    "J03JB/cyberdream.nvim",

	-----------------------------------------------------------------------------------------------
	-- Quality of Life
	-----------------------------------------------------------------------------------------------
	{ "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },
	-- { "saecki/crates.nvim", event = { "BufRead Cargo.toml" } },
	{ "aouelete/sway-vim-syntax", ft = "sway" },
	{ "fladson/vim-kitty" },
    {
        "sindrets/diffview.nvim",
        keys ={
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
	{ dir = "~/Dev/Plugins/teleprompt.nvim" },
    {
        dir = "~/Dev/Plugins/gitbar.nvim",
        dependencies = "MunifTanjim/nui.nvim"
    },
    {
        'freesec/pasta.nvim',
        dir = "~/Dev/Plugins/pasta.nvim" ,
        dev = true,
        init = function()
            require('pasta').setup()
        end,
    },
}

return M
