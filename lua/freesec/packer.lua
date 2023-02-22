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

    -- Telescope
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.1",
        -- or                            , branch = '0.1.x',
        requires = { { "nvim-lua/plenary.nvim" } },
    })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use("nvim-telescope/telescope-packer.nvim")
    use("nvim-telescope/telescope-file-browser.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")
    use({
        "benfowler/telescope-luasnip.nvim",
        module = "telescope._extensions.luasnip", -- if you wish to lazy-load
    })

    -- Quality of Life
    use("navarasu/onedark.nvim")
    use("folke/which-key.nvim")
    use("kdav5758/TrueZen.nvim")
    use("terrortylor/nvim-comment")
    use("tpope/vim-surround")
    use("numToStr/FTerm.nvim")
    use("windwp/nvim-autopairs")
    use("lukas-reineke/indent-blankline.nvim")
    use("davidgranstrom/nvim-markdown-preview")
    -- use("norcalli/nvim-colorizer.lua")
    -- use('NvChad/nvim-colorizer.lua')
    use('brenoprata10/nvim-highlight-colors')
    use({
        "jedrzejboczar/possession.nvim",
        requires = { "nvim-lua/plenary.nvim" },
    })
    -- formatting
    use({ "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim" } })

    -- Bufferline
    use("akinsho/nvim-bufferline.lua")

    -- Lualine
    use("hoob3rt/lualine.nvim")
    use("arkav/lualine-lsp-progress")

    -- Treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
    use("nvim-treesitter/playground")
    use("p00f/nvim-ts-rainbow")
    use("windwp/nvim-ts-autotag")
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use("jose-elias-alvarez/nvim-lsp-ts-utils")

    -- Git
    use("lewis6991/gitsigns.nvim")

    -- LSP
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
            { "saadparwaiz1/cmp_luasnip" }, -- Optional
            { "hrsh7th/cmp-nvim-lua" }, -- Optional

            -- Snippets
            { "L3MON4D3/LuaSnip" }, -- Required
            { "rafamadriz/friendly-snippets" }, -- Optional
            { "hrsh7th/vim-vsnip" },
        },
    })

    -- cmp extras
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/cmp-vsnip")
    use("lukas-reineke/cmp-under-comparator")

    -- NvimTree
    use({
        "nvim-tree/nvim-tree.lua",
        requires = {
            "kyazdani42/nvim-web-devicons", -- optional, for file icon
        },
    })
end)
