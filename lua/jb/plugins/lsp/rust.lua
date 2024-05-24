return {
    "mrcjkb/rustaceanvim",
    version = "^4",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "mfussenegger/nvim-dap",
    },
    ft = { "rust" },

    config = function()
        local lspconfig = require("jb.plugins.lsp.lspconfig")
        vim.g.rustaceanvim = {
            -- inlay_hints = {
            -- 	highlight = "NonText",
            -- },
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
                on_attach = function(client, bufnr)
                    lspconfig.on_attach(client, bufnr)
                    --     local opts = { noremap = true, silent = true }
                    --     local keymap = vim.keymap

                    --     keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions
                    --     keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration
                    --     keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations
                    --     keymap.set("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
                    --     keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references
                    --     keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions
                    --     keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor
                    --     keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection
                    --     keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line
                    --     keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file
                    --     keymap.set("n", "<leader>lh", "<cmd>lua require('jb.plugins.lsp.lspconfig').inlay_toggle()<CR>)", opts)
                    --     keymap.set("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
                    --     keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
                    --     keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
                    --     keymap.set("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
                    --     keymap.set("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
                end,
            },
        }
    end,
}
