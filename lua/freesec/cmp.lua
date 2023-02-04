-- nvim-cmp config.
-- Vsnip Stuff from: https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings
local types = require("cmp.types")
local has_words_before = function()
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp = require("cmp")
local cmp_compare = require("freesec.cmp_compare")

cmp.setup({
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
		end,
	},
	sorting = {
		priority_weight = 100,
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			require("cmp-under-comparator").under,
			cmp_compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
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
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif vim.fn["vsnip#available"](1) == 1 then
				feedkey("<Plug>(vsnip-expand-or-jump)", "")
			elseif has_words_before() then
				cmp.complete()
			else
				fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
			end
		end, { "i", "s" }),
		["<S-Tab>"] = cmp.mapping(function()
			if cmp.visible() then
				cmp.select_prev_item()
			elseif vim.fn["vsnip#jumpable"](-1) == 1 then
				feedkey("<Plug>(vsnip-jump-prev)", "")
			end
		end, { "i", "s" }),
		["<CR>"] = function(fallback)
			if cmp.visible() then
				return cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Insert,
					select = true,
				})(fallback)
			else
				return fallback()
			end
		end,
		["<C-Space>"] = cmp.mapping.complete(),
		-- use escape to close completion window
		["<ESC>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.abort()
			else
				return fallback()
			end
		end),
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
