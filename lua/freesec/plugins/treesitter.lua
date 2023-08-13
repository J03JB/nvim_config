require("nvim-treesitter.configs").setup({
    ensure_installed = { "rust", "toml", "c", "lua", "vim", "vimdoc", "javascript", "typescript", "python" },
    sync_install = false,
    auto_install = true,
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    indent = {
        enable = true,
    },
    refactor = {
        highlight_definitions = {
            enable = true,
        },
    },
    autotag = {
        enable = true,
    },
    context_commentstring = {
        enable = true,
    },
    rainbow = {
        enable = true,
        disable = { "zig", "jsx", "cpp" },
        -- Which query to use for finding delimiters
        query = "rainbow-parens",
        -- Highlight the entire buffer all at once
        strategy = require("ts-rainbow").strategy.global,
    },
    textobjects = {
        select = {
            enable = true,
            keymaps = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
            },
        },
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            node_incremental = "v",
            node_decremental = "V",
        },
    },
    tree_setter = {
        enable = true,
    }
})
