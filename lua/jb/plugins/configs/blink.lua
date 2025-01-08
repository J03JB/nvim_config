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
		{ "mikavilpas/blink-ripgrep.nvim" },
	},
	-- use a release tag to download pre-built binaries
	version = "v0.*",
	opts = {
		keymap = {
			["<Tab>"] = {
				function(cmp)
					if cmp.snippet_active() then
						return cmp.accept()
					else
						return require("blink.cmp").select_next()
					end
				end,
				"snippet_forward",
				"fallback",
			},
			["<S-Tab>"] = { "select_prev", "snippet_forward", "fallback" },
			-- ['<CR>'] = { 'accept', 'fallback' },

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
				selection = {
                    preselect = true,
					auto_insert = true,
				},
			},
			accept = {
				auto_brackets = {
					enabled = true,
				},
			},
			menu = {
				auto_show = true,
				draw = {
					columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "source_name" } },
					-- columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
					treesitter = { "lsp" },
				},
			},
			-- Show documentation when selecting a completion item
			documentation = { window = { border = "rounded" }, auto_show = true, auto_show_delay_ms = 500 },

			ghost_text = {
				enabled = true,
			},
		},

		-- Experimental signature help support
		signature = {
			enabled = true,
			window = { border = "rounded" },
		},

		sources = {
			providers = {
				copilot = {
					name = "copilot",
					module = "blink-cmp-copilot",
					enabled = true,
					score_offset = -4,
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
				ripgrep = { max_items = 3, score_offset = -2, module = "blink-ripgrep", name = "ripgrep" },
			},
			default = { "lazydev", "lsp", "path", "snippets", "buffer", "copilot", "ripgrep" },
		},

		appearance = {
			kind_icons = require("jb.utils").icons.kind,
		},
	},
	opts_extend = { "sources.default" },
}
