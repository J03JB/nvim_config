return {
    "OXY2DEV/markview.nvim",
    lazy = false,      -- Recommended
    -- ft = "markdown" -- If you decide to lazy-load anyway

    dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
    },

    opts = {
        -- Filetypes where the plugin is enabled
        filetypes = { "markdown", "quarto", "rmd" },
        -- Highlight groups to use
        -- "dynamic" | "light" | "dark"
        highlight_groups = "dynamic",
        modes = { "n", "no", "c" },
        initial_state = false
    }
}
