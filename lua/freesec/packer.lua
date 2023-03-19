-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return require("packer").startup(function(use)
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	-----------------------------------------------------------------------------------------------
	-- Telescope
	-----------------------------------------------------------------------------------------------
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		requires = { { "nvim-lua/plenary.nvim" } },
	})
	use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
	use("nvim-telescope/telescope-packer.nvim")
	use("nvim-telescope/telescope-file-browser.nvim")
	use("nvim-telescope/telescope-ui-select.nvim")

	-----------------------------------------------------------------------------------------------
	-- Quality of Life
	-----------------------------------------------------------------------------------------------
	use("folke/which-key.nvim")
	use("kdav5758/TrueZen.nvim")
	use("terrortylor/nvim-comment")
	use("tpope/vim-surround")
	use("windwp/nvim-autopairs")
	use("lukas-reineke/indent-blankline.nvim")
	use("numToStr/FTerm.nvim")
	use("mbbill/undotree")
	use("brenoprata10/nvim-highlight-colors")
	use("davidgranstrom/nvim-markdown-preview")
	use("simrat39/rust-tools.nvim")
	use("preservim/tagbar")

	-----------------------------------------------------------------------------------------------
	-- Theming
	-----------------------------------------------------------------------------------------------
	use("navarasu/onedark.nvim")
	use("folke/tokyonight.nvim")

	-----------------------------------------------------------------------------------------------
	-- Sessions
	-----------------------------------------------------------------------------------------------
	use({
		"jedrzejboczar/possession.nvim",
		requires = { "nvim-lua/plenary.nvim" },
	})

	-----------------------------------------------------------------------------------------------
	-- formatting
	-----------------------------------------------------------------------------------------------
	use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })

	-----------------------------------------------------------------------------------------------
	-- Bufferline
	-----------------------------------------------------------------------------------------------
	use("akinsho/nvim-bufferline.lua")

	-----------------------------------------------------------------------------------------------
	-- Debugging
	-----------------------------------------------------------------------------------------------
	use("mfussenegger/nvim-dap")

	-----------------------------------------------------------------------------------------------
	-- Lualine
	-----------------------------------------------------------------------------------------------
	use("hoob3rt/lualine.nvim")
	use("arkav/lualine-lsp-progress")

	-----------------------------------------------------------------------------------------------
	-- Treesitter
	-----------------------------------------------------------------------------------------------
	use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-ts-autotag")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("jose-elias-alvarez/nvim-lsp-ts-utils")

	-----------------------------------------------------------------------------------------------
	-- Aerial.nvim
	-----------------------------------------------------------------------------------------------
	use("stevearc/aerial.nvim")

	-----------------------------------------------------------------------------------------------
	-- Git
	-----------------------------------------------------------------------------------------------
	use("lewis6991/gitsigns.nvim")
	use("tpope/vim-fugitive")
	use("rawnly/gist.nvim")

	-----------------------------------------------------------------------------------------------
	-- LSP
	-----------------------------------------------------------------------------------------------
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v1.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
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
	})

	-----------------------------------------------------------------------------------------------
	-- cmp extras
	-----------------------------------------------------------------------------------------------
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/cmp-vsnip")
	use("lukas-reineke/cmp-under-comparator")
	use("hrsh7th/cmp-nvim-lsp-signature-help")

	-----------------------------------------------------------------------------------------------
	-- tabout
	-----------------------------------------------------------------------------------------------
	use({
		"abecodes/tabout.nvim",
		wants = { "nvim-treesitter" }, -- or require if not used so far
		after = { "nvim-cmp" }, -- if a completion plugin is using tabs load it before
	})

	-----------------------------------------------------------------------------------------------
	-- NvimTree
	-----------------------------------------------------------------------------------------------
	use({
		"nvim-tree/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icon
		},
	})
end)
