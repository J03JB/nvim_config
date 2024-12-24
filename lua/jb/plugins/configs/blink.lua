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
	},
	-- use a release tag to download pre-built binaries
	version = "v0.*",
	opts = {
		keymap = {
			preset = "default",
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return cmp.select_and_accept()
					end
				end,
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = { "snippet_backward", "fallback" },
			cmdline = {
				preset = "super-tab",
			},
		},

		-- Enables keymaps, completions and signature help when true
		enabled = function()
			return vim.bo.buftype ~= "prompt" and vim.b.completion ~= false
		end,

		snippets = {
			expand = function(snippet)
				vim.snippet.expand(snippet)
			end,
			active = function(filter)
				return vim.snippet.active(filter)
			end,
			jump = function(direction)
				vim.snippet.jump(direction)
			end,
		},

		completion = {
			keyword = {
				range = "prefix",
				regex = "[-_]\\|\\k",
				exclude_from_prefix_regex = "[\\-]",
			},

			list = {
				max_items = 200,
				selection = "auto_insert",
			},

			accept = {
				auto_brackets = {
					enabled = true,
				},
			},

			menu = {
				auto_show = true,
				draw = {
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
				},
			},

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
			},
			default = { "copilot", "lsp", "path", "snippets", "buffer" },
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
