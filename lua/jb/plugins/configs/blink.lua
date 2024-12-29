return {
	"saghen/blink.cmp",

	dependencies = {
		{
			"saghen/blink.compat",
			opts = {},
			version = "*",
		},
		{ "rafamadriz/friendly-snippets" },
		{ "giuxtaposition/blink-cmp-copilot" },
		{ "folke/lazydev.nvim" },
	},
	-- use a release tag to download pre-built binaries
	version = "v0.*",
	opts = {
		keymap = {
            ['<Tab>'] = { 'select_next', 'fallback' },
            ['<S-Tab>'] = { 'select_prev', 'fallback' },
            ['<CR>'] = { 'accept', 'fallback' },

			cmdline = {
				preset = "super-tab",
			},
		},

		enabled = function()
			return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
		end,

		completion = {
			list = {
				max_items = 200,
				-- selection = "auto_insert",
				selection = function(ctx)
					return ctx.mode == "cmdline" and "auto_insert" or "preselect"
				end,
			},
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				auto_show = true,
				draw = {
					-- columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
					columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
				},
			},
			-- Show documentation when selecting a completion item
			documentation = { auto_show = true, auto_show_delay_ms = 500 },

			ghost_text = {
				enabled = true,
			},
		},

		-- Experimental signature help support
		signature = {
			enabled = true,
		},

		sources = {
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					enabled = true,
					score_offset = 1000,
					async = true,
					transform_items = function(_, items)
						local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
						local kind_idx = #CompletionItemKind + 1
						CompletionItemKind[kind_idx] = "Copilot"
						for _, item in ipairs(items) do
							item.kind = kind_idx
						end
						return items
					end,
				},
				lazydev = {
					name = "lazydev",
					module = "lazydev.integrations.blink",
					score_offset = 100,
				},
			},
			default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot" },
		},

		appearance = {
			kind_icons = {
				Copilot = "",
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
			},
		},
	},
	opts_extend = { "sources.default" },
}
