local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

local plugins = {
	-----------------------------------------------------------------------------------------------
	-- Telescope
	-----------------------------------------------------------------------------------------------
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		dependencies = { { "nvim-lua/plenary.nvim" } },
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"nvim-telescope/telescope-file-browser.nvim",
	"nvim-telescope/telescope-ui-select.nvim",

	-----------------------------------------------------------------------------------------------
	-- Quality of Life
	-----------------------------------------------------------------------------------------------
	"folke/which-key.nvim",
	"kdav5758/TrueZen.nvim",
	"terrortylor/nvim-comment",
	"tpope/vim-surround",
	"windwp/nvim-autopairs",
	"lukas-reineke/indent-blankline.nvim",
	"numToStr/FTerm.nvim",
	"mbbill/undotree",
	"brenoprata10/nvim-highlight-colors",
	"davidgranstrom/nvim-markdown-preview",
	"simrat39/rust-tools.nvim",
	"preservim/tagbar",
	"folke/todo-comments.nvim",

	-----------------------------------------------------------------------------------------------
	-- Theming
	-----------------------------------------------------------------------------------------------
	"navarasu/onedark.nvim",
	"folke/tokyonight.nvim",

	-----------------------------------------------------------------------------------------------
	-- Sessions
	-----------------------------------------------------------------------------------------------
	{
		"jedrzejboczar/possession.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
	},

	-----------------------------------------------------------------------------------------------
	-- formatting
	-----------------------------------------------------------------------------------------------
	{ "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },

	-----------------------------------------------------------------------------------------------
	-- Bufferline
	-----------------------------------------------------------------------------------------------
	{
		"akinsho/bufferline.nvim",
		version = "v3.*",
	},

	-----------------------------------------------------------------------------------------------
	-- Debugging
	-----------------------------------------------------------------------------------------------
	"mfussenegger/nvim-dap",
	"folke/trouble.nvim",
	"rcarriga/nvim-dap-ui",
	"mfussenegger/nvim-dap-python",
	"theHamsta/nvim-dap-virtual-text",
	"nvim-telescope/telescope-dap.nvim",

	-----------------------------------------------------------------------------------------------
	-- Lualine
	-----------------------------------------------------------------------------------------------
	"nvim-lualine/lualine.nvim",
	"arkav/lualine-lsp-progress",

	-----------------------------------------------------------------------------------------------
	-- Treesitter
	-----------------------------------------------------------------------------------------------
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	"nvim-treesitter/playground",
	"p00f/nvim-ts-rainbow",
	"windwp/nvim-ts-autotag",
	"JoosepAlviste/nvim-ts-context-commentstring",
	"jose-elias-alvarez/nvim-lsp-ts-utils",

	-----------------------------------------------------------------------------------------------
	-- Git
	-----------------------------------------------------------------------------------------------
	"lewis6991/gitsigns.nvim",
	"tpope/vim-fugitive",

	-----------------------------------------------------------------------------------------------
	-- LSP
	-----------------------------------------------------------------------------------------------
	{
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{
				-- Optional
				"williamboman/mason.nvim",
				build = function()
					pcall(vim.cmd, "MasonUpdate")
				end,
			},
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Optional
			{ "hrsh7th/cmp-path" }, -- Optional
			{ "hrsh7th/cmp-nvim-lua" }, -- Optional

			-- Snippets
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Optional
			{ "hrsh7th/vim-vsnip" },
		},
	},

	-----------------------------------------------------------------------------------------------
	-- cmp extras
	-----------------------------------------------------------------------------------------------
	"hrsh7th/cmp-cmdline",
	"hrsh7th/cmp-vsnip",
	"lukas-reineke/cmp-under-comparator",
	"hrsh7th/cmp-nvim-lsp-signature-help",

	-----------------------------------------------------------------------------------------------
	-- tabout
	-----------------------------------------------------------------------------------------------
	"abecodes/tabout.nvim",
	-----------------------------------------------------------------------------------------------
	-- NvimTree
	-----------------------------------------------------------------------------------------------
	"nvim-tree/nvim-tree.lua",
	"nvim-tree/nvim-web-devicons", -- optional, for file icon
}

local opts = {}

require("lazy").setup(plugins, opts)