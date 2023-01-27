-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require("lsp-zero")
lsp.preset("lsp-compe")
-- lsp.preset("recommended")

lsp.ensure_installed({
	"tsserver",
	"eslint",
	"sumneko_lua",
	"rust_analyzer",
	"pyright",
})

-- Fix Undefined global 'vim'
lsp.configure("sumneko_lua", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

local cmp = require("cmp")
local cmp_compare = require("freesec.cmp_compare")
local types = require("cmp.types")
local has_words_before = function()
	local line, col = table.unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end
local feedkey = function(key, mode)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

local cmp_config = lsp.defaults.cmp_config({
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
		cmp_mappings,
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
	},
	formatting = {
		format = function(entry, vim_item)
			local icons = require("freesec.kind").icons
			vim_item.kind = icons[vim_item.kind]
			vim_item.menu = ({
				nvim_lsp = "(LSP)",
				emoji = "(Emoji)",
				path = "(Path)",
				calc = "(Calc)",
				cmp_tabnine = "(Tabnine)",
				vsnip = "(Snippet)",
				luasnip = "(Luasnip)",
				buffer = "(Buffer)",
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
		{ name = "buffer", max_item_count = 5, priority_weight = 70 },
		{ name = "path", priority_weight = 110 },
		{ name = "emoji", priority_weight = 10 },
		{ name = "nvim_lua", priority_weight = 90 },
		{ name = "nvim_lsp_signature_help" },
	},
})

local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done({ map_char = { tex = "" } }))

cmp.setup(cmp_config)

-- local cmp_sources = lsp.defaults.cmp_sources()
-- table.insert(cmp_sources, { name = "vsnip" })

-- lsp.setup_nvim_cmp({
-- snippet = {
-- 	-- REQUIRED - you must specify a snippet engine
-- 	expand = function(args)
-- 		vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
-- 	end,
-- },
-- mapping = cmp_mappings,
-- sources = cmp_sources,
-- preselect = "none",
-- formatting = {
-- 	-- changing the order of fields so the icon is the first
-- 	fields = { "abbr", "menu", "kind" },
--         req
-- 	-- here is where the change happens
-- 	format = function(entry, item)
-- 		local menu_icon = {
-- 			nvim_lsp = "λ",
-- 			luasnip = "⋗",
-- 			buffer = "Ω",
-- 			path = "🖫",
-- 			nvim_lua = "Π",
-- 		}

-- 		item.menu = menu_icon[entry.source.name]
-- 		return item
-- 	end,
-- },
-- })

lsp.on_attach(function(client, bufnr)
	local opts = { buffer = bufnr, remap = false }

	vim.keymap.set("n", "<leader>df", "<cmd>LspZeroFormat<cr>", { buffer = bufnr, desc = "LSP: Document Format" })
	vim.keymap.set("n", "gd", function()
		vim.lsp.buf.definition()
	end, opts)
	vim.keymap.set("n", "K", function()
		vim.lsp.buf.hover()
	end, opts)
	vim.keymap.set("n", "<space>ca", function()
		vim.lsp.buf.code_action()
	end, opts)
	vim.keymap.set("n", "<leader>vd", function()
		vim.diagnostic.open_float()
	end, opts)
	vim.keymap.set("n", "[d", function()
		vim.diagnostic.goto_next()
	end, opts)
	vim.keymap.set("n", "]d", function()
		vim.diagnostic.goto_prev()
	end, opts)
end)

lsp.setup()

vim.diagnostic.config({
	virtual_text = true,
})
