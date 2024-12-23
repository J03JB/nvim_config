
return {
	"saghen/blink.cmp",
	lazy = false, -- lazy loading handled internally
    dependencies = {
        {
            "saghen/blink.compat",
            opts = {},
            version = '*',
        },
        { "rafamadriz/friendly-snippets" },
    },
	-- use a release tag to download pre-built binaries
	version = "v0.*",
    config = {
        keymap = {
            preset = 'default',
            ['<Tab>'] = {
                function(cmp)
                    if cmp.snippet_active() then return cmp.accept()
                    else return cmp.select_and_accept() end
                end,
                'snippet_forward',
                'fallback'
            },
            ['<S-Tab>'] = { 'snippet_backward', 'fallback' },
            cmdline = {
                preset = 'super-tab'
            }
        },

        -- Enables keymaps, completions and signature help when true
        enabled = function() return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false end,

        snippets = {
            expand = function(snippet) vim.snippet.expand(snippet) end,
            active = function(filter) return vim.snippet.active(filter) end,
            jump = function(direction) vim.snippet.jump(direction) end,
        },

        completion = {
            keyword = {
                range = 'full',
                regex = '[-_]\\|\\k',
                exclude_from_prefix_regex = '[\\-]',
            },

            list = {
                max_items = 200,
                selection = 'auto_insert',
            },

            accept = {
                -- Create an undo point when accepting a completion item
                create_undo_point = true,
                -- Experimental auto-brackets support
                auto_brackets = {
                    -- Whether to auto-insert brackets for functions
                    enabled = true,
                    -- Default brackets to use for unknown languages
                    default_brackets = { '(', ')' },
                    -- Overrides the default blocked filetypes
                    override_brackets_for_filetypes = {},
                    -- Synchronously use the kind of the item to determine if brackets should be added
                    kind_resolution = {
                        enabled = true,
                        blocked_filetypes = { 'typescriptreact', 'javascriptreact', 'vue' },
                    },
                    -- Asynchronously use semantic token to determine if brackets should be added
                    semantic_token_resolution = {
                        enabled = true,
                        blocked_filetypes = {},
                        -- How long to wait for semantic tokens to return before assuming no brackets should be added
                        timeout_ms = 400,
                    },
                },
            },

            menu = {
                enabled = true,
                min_width = 15,
                max_height = 10,
                border = "none",
                winblend = 0,
                winhighlight = 'Normal:BlinkCmpMenu,FloatBorder:BlinkCmpMenuBorder,CursorLine:BlinkCmpMenuSelection,Search:None',
                scrolloff = 2,
                scrollbar = true,
                direction_priority = { 's', 'n' },

                auto_show = true,

                -- Controls how the completion items are rendered on the popup window
                draw = {
                    align_to_component = 'label', -- or 'none' to disable
                    padding = 1,
                    gap = 1,
                    treesitter = { 'lsp' },

                    -- columns = { { 'kind_icon' }, { 'label', 'label_description', gap = 1 } },
                    -- for a setup similar to nvim-cmp: https://github.com/Saghen/blink.cmp/pull/245#issuecomment-2463659508
                    -- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", gap = 1, "kind" } },
                    columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },

                    -- Definitions for possible components to render. Each component defines:
                    --   ellipsis: whether to add an ellipsis when truncating the text
                    --   width: control the min, max and fill behavior of the component
                    --   text function: will be called for each item
                    --   highlight function: will be called only when the line appears on screen
                    components = {
                        kind_icon = {
                            ellipsis = false,
                            text = function(ctx) return ctx.kind_icon .. ctx.icon_gap end,
                            -- highlight = function(ctx)
                                -- return require('blink.cmp.completion.windows.render.tailwind').get_hl(ctx) or 'BlinkCmpKind' .. ctx.kind
                            -- end,
                        },

                        kind = {
                            ellipsis = false,
                            width = { fill = true },
                            text = function(ctx) return ctx.kind end,
                            -- highlight = function(ctx)
                                -- return require('blink.cmp.completion.windows.render.tailwind').get_hl(ctx) or 'BlinkCmpKind' .. ctx.kind
                            -- end,
                        },

                        label = {
                            width = { fill = true, max = 60 },
                            text = function(ctx) return ctx.label .. ctx.label_detail end,
                            highlight = function(ctx)
                                -- label and label details
                                local highlights = {
                                    { 0, #ctx.label, group = ctx.deprecated and 'BlinkCmpLabelDeprecated' or 'BlinkCmpLabel' },
                                }
                                if ctx.label_detail then
                                    table.insert(highlights, { #ctx.label, #ctx.label + #ctx.label_detail, group = 'BlinkCmpLabelDetail' })
                                end

                                -- characters matched on the label by the fuzzy matcher
                                for _, idx in ipairs(ctx.label_matched_indices) do
                                    table.insert(highlights, { idx, idx + 1, group = 'BlinkCmpLabelMatch' })
                                end

                                return highlights
                            end,
                        },

                        label_description = {
                            width = { max = 30 },
                            text = function(ctx) return ctx.label_description end,
                            highlight = 'BlinkCmpLabelDescription',
                        },

                        source_name = {
                            width = { max = 30 },
                            text = function(ctx) return ctx.source_name end,
                            highlight = 'BlinkCmpSource',
                        },
                    },
                },
            },

            documentation = {
                -- Controls whether the documentation window will automatically show when selecting a completion item
                auto_show = true,
                -- Delay before showing the documentation window
                auto_show_delay_ms = 200,
                -- Delay before updating the documentation window when selecting a new item,
                -- while an existing item is still visible
                update_delay_ms = 50,
                -- Whether to use treesitter highlighting, disable if you run into performance issues
                treesitter_highlighting = true,
            },
            -- Displays a preview of the selected item on the current line
            ghost_text = {
                enabled = true,
            },
        },

        -- Experimental signature help support
        signature = {
            enabled = true,
            trigger = {
                blocked_trigger_characters = {},
                blocked_retrigger_characters = {},
                -- When true, will show the signature help window when the cursor comes after a trigger character when entering insert mode
                show_on_insert_on_trigger_character = true,
            },
            window = {
                min_width = 1,
                max_width = 100,
                max_height = 10,
                border = 'padded',
                winblend = 0,
                winhighlight = 'Normal:BlinkCmpSignatureHelp,FloatBorder:BlinkCmpSignatureHelpBorder',
                scrollbar = false, -- Note that the gutter will be disabled when border ~= 'none'
                -- Which directions to show the window,
                -- falling back to the next direction when there's not enough space,
                -- or another window is in the way
                direction_priority = { 'n', 's' },
                -- Disable if you run into performance issues
                treesitter_highlighting = true,
            },
        },

        fuzzy = {
            -- when enabled, allows for a number of typos relative to the length of the query
            -- disabling this matches the behavior of fzf
            use_typo_resistance = true,
            -- frecency tracks the most recently/frequently used items and boosts the score of the item
            use_frecency = true,
            -- proximity bonus boosts the score of items matching nearby words
            use_proximity = true,
            -- controls which sorts to use and in which order, falling back to the next sort if the first one returns nil
            -- you may pass a function instead of a string to customize the sorting
            sorts = { 'score', 'sort_text' },

            prebuilt_binaries = {
                -- Whether or not to automatically download a prebuilt binary from github. If this is set to `false`
                -- you will need to manually build the fuzzy binary dependencies by running `cargo build --release`
                download = true,
                -- When downloading a prebuilt binary, force the downloader to resolve this version. If this is unset
                -- then the downloader will attempt to infer the version from the checked out git tag (if any).
                --
                -- Beware that if the FFI ABI changes while tracking main then this may result in blink breaking.
                force_version = nil,
                -- When downloading a prebuilt binary, force the downloader to use this system triple. If this is unset
                -- then the downloader will attempt to infer the system triple from `jit.os` and `jit.arch`.
                -- Check the latest release for all available system triples
                --
                -- Beware that if the FFI ABI changes while tracking main then this may result in blink breaking.
                force_system_triple = nil,
                -- Extra arguments that will be passed to curl like { 'curl', ..extra_curl_args, ..built_in_args }
                extra_curl_args = {}
            },
        },

        sources = {
            default = { "lsp", "path", "snippets", "buffer", "cody" },
             providers = {
                cody = {
                    name = 'cody', -- IMPORTANT: use the same name as you would for nvim-cmp
                    module = 'blink.compat.source',
                    opts = {  impersonate_nvim_cmp = true, },
                },
            },
        },

    appearance = {
        highlight_ns = vim.api.nvim_create_namespace('blink_cmp'),
            use_nvim_cmp_as_default = true,
            nerd_font_variant = 'mono',
            kind_icons = {
                Text = "",
                Method = "",
                Function = "",

                Constructor = "",
                Field = "",
                Variable = "",
                Property = "ﰠ",

                Class = "ﴯ",
                Interface = "",
                Struct = "",
                Module = "",

                Unit = "",
                Value = "",
                Enum = "",
                EnumMember = "",

                Keyword = "",
                Constant = "",


                Snippet = "",
                Color = "",
                File = "",
                Reference = "",
                Folder = "",
                Event = "",
                Operator = "",
                TypeParameter = "",

                Cody = "󰧑 ",
            },
        },
    }
}
