local types = require("cmp.types")
local cmp = require("cmp")

cmp.setup({
    performance = {
        debounce = 150,
    },
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
		end,
	},
	sorting = {
		priority_weight = 100,
	},
	window = {
		-- completion = cmp.config.window.bordered(),
		documentation = {
			border = vim.g.floating_window_border_dark,
		},
	},
	confirmation = {
		default_behavior = types.cmp.ConfirmBehavior.Insert,
		get_commit_characters = function(commit_characters)
			return commit_characters
		end,
	},
	min_length = 0, -- allow for `from package import _` in Python
	mapping = {
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping.confirm({
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		}),
		["<Tab>"] = function()
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) ~= 0 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-expand-or-jump)", true, true, true), "")
			else
				-- tabout, replace with fallback() to go back to default
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true), "")
			end
		end,
		["<S-Tab>"] = function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#available"](1) ~= 0 then
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(vsnip-jump-prev)", true, true, true), "")
			else
				-- tabout, replace with fallback() to go back to default
				vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true), "")
			end
		end,
	},
	formatting = {
		format = function(entry, vim_item)
			local icons = require("freesec.kind").icons
			vim_item.kind = icons[vim_item.kind]
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				emoji = "[Emoji]",
				path = "[Path]",
				calc = "[Calc]",
				cmp_tabnine = "[Tabnine]",
				vsnip = "[Vsnip]",
				luasnip = "[Luasnip]",
				buffer = "[Buffer]",
				latex_symbols = "[LaTeX]",
			})[entry.source.name]
			vim_item.dup = ({
				buffer = 1,
				path = 1,
				nvim_lsp = 0,
			})[entry.source.name] or 0
			return vim_item
		end,
	},
	sources = {
		{ name = "nvim_lsp", max_item_count = 20, priority_weight = 100 },
		{ name = "vsnip", priority_weight = 100 },
		{ name = "buffer", max_item_count = 5, priority_weight = 100 },
		{ name = "path", priority_weight = 110 },
		{ name = "emoji", priority_weight = 10 },
		{ name = "nvim_lua", priority_weight = 90 },
		{ name = "nvim_lsp_signature_help" },
		{ name = "crates" },
	},
})

-- If you want insert `(` after select function or method item
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

-- `:` cmdline setup.
cmp.setup.cmdline(":", {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = "path" },
	}, {
		{
			name = "cmdline",
			option = {
				ignore_cmds = { "Man", "!" },
			},
		},
	}),
})
