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
        tag = "0.1.5",
        dependencies = { { "nvim-lua/plenary.nvim", "tsakirist/telescope-lazy.nvim" } },
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-telescope/telescope-ui-select.nvim",
    -----------------------------------------------------------------------------------------------
    -- Quality of Life
    -----------------------------------------------------------------------------------------------
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
    },
    "kdav5758/TrueZen.nvim",
    "terrortylor/nvim-comment",
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
    },
    { "lukas-reineke/indent-blankline.nvim",      event = "VeryLazy", main = "ibl", opts = {} },
    "brenoprata10/nvim-highlight-colors",
    "simrat39/rust-tools.nvim",
    { "saecki/crates.nvim",  event = { "BufRead Cargo.toml" } },
    "ojroques/nvim-osc52",
    "abecodes/tabout.nvim",
    "ThePrimeagen/harpoon",
    "ibhagwan/fzf-lua",
    {
        "iamcco/markdown-preview.nvim",
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
    },
    {
        "kylechui/nvim-surround",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({})
        end,
    },

    -------
    -- Copilot
    -------
    "zbirenbaum/copilot.lua",

    -----------------------------------------------------------------------------------------------
    -- Tabnine
    -----------------------------------------------------------------------------------------------
    { "codota/tabnine-nvim", build = "./dl_binaries.sh" },

    -----------------------------------------------------------------------------------------------
    -- Lualine
    -----------------------------------------------------------------------------------------------
    "nvim-lualine/lualine.nvim",
    "arkav/lualine-lsp-progress",
    -----------------------------------------------------------------------------------------------
    -- Git
    -----------------------------------------------------------------------------------------------
    { "lewis6991/gitsigns.nvim",         event = { "BufRead", "BufNewFile" } },
    "tpope/vim-fugitive",
    -----------------------------------------------------------------------------------------------
    -- formatting
    -----------------------------------------------------------------------------------------------
    -- replace with `none-ls`
    { "jose-elias-alvarez/null-ls.nvim", dependencies = { "nvim-lua/plenary.nvim" } },
    -----------------------------------------------------------------------------------------------
    -- NvimTree
    -----------------------------------------------------------------------------------------------
    "nvim-tree/nvim-tree.lua",
    "nvim-tree/nvim-web-devicons", -- optional, for file icon
    -----------------------------------------------------------------------------------------------
    -- Theming
    -----------------------------------------------------------------------------------------------
    "EdenEast/nightfox.nvim",
    "navarasu/onedark.nvim",
    "projekt0n/caret.nvim",
    "folke/tokyonight.nvim",
    { "catppuccin/nvim",                 name = "catppuccin" },
    -----------------------------------------------------------------------------------------------
    -- Bufferline
    -----------------------------------------------------------------------------------------------
    {
        "akinsho/bufferline.nvim",
        version = "*",
    },
    -----------------------------------------------------------------------------------------------
    -- Debugging
    -----------------------------------------------------------------------------------------------
    "folke/trouble.nvim",
    -----------------------------------------------------------------------------------------------
    -- Treesitter
    -----------------------------------------------------------------------------------------------
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
    "windwp/nvim-ts-autotag",
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/nvim-treesitter-context",
    "jose-elias-alvarez/nvim-lsp-ts-utils",
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
            { "L3MON4D3/LuaSnip" },    -- Required
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
    "lukas-reineke/cmp-rg",

    -- sway syntax highlighting
    {
        "aouelete/sway-vim-syntax",
        ft = "sway",
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
