return {
    "mrcjkb/rustaceanvim",
    version = "^4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
    },
    ft = { "rust" },

    config = function()
        vim.g.rustaceanvim = {
            inlay_hints = {
            	highlight = "NonText",
            },
            tools = {
                hover_actions = {
                	auto_focus = false,
                },
            },
            settings = {
                ["rust-analyzer"] = {
                    imports = {
                        granularity = {
                            group = "module",
                        },
                        prefix = "self",
                    },
                    root_pattern = { "Cargo.toml", "rust-project.json" },
                    cargo = {
                        allfeatures = true,
                        loadOutDirsFromCheck = true,
                        runBuildScripts = true,
                    },
                    checkOnSave = { -- Add clippy lints for Rust
                        allfeatures = true,
                        command = "clippy",
                        extraArgs = { "--no-deps" },
                    },
                    procMacro = {
                        enable = false,
                        ignored = {
                            ["async-trait"] = { "async_trait" },
                            ["napi-derive"] = { "napi" },
                            ["async-recursion"] = { "async_recursion" },
                        },
                    },
                },
            },
            lens = {
                enable = true,
            },
            server = {
            },
        }
    end,
}
