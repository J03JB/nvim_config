return {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },

    keys = {
        { "<leader>md", "<cmd>Markview<CR>", desc = "Markdown Preview" }
    },

    opts = {
        -- Highlight groups to use
        -- "dynamic" | "light" | "dark"
        highlight_groups = "dynamic",
        previem = {
            modes = { "n", "no", "c" },
            initial_state = false,
            -- Filetypes where the plugin is enabled
            filetypes = { "markdown", "quarto", "rmd" },
        }
    }
}
