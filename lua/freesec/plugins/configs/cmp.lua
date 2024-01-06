return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"lukas-reineke/cmp-rg",
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"L3MON4D3/LuaSnip", -- snippet engine
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},

	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
                -- manually start completion for Cody
				-- ["<C-m>"] = cmp.mapping.complete({
				-- 	config = {
				-- 		sources = {
				-- 			{ name = "cody" },
				-- 		},
				-- 	},
				-- }),
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = function()
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						-- tabout, replace with fallback() to go back to default
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true), "")
					end
				end,
				["<S-Tab>"] = function()
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						-- tabout, replace with fallback() to go back to default
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true), "")
					end
				end,
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "rg", keyword_length = 3 },
				{ name = "nvim_lsp", max_item_count = 20, priority_weight = 100 },
				{ name = "cody" },
				{ name = "vsnip", priority_weight = 100 },
				{ name = "luasnip", priority_weight = 100 },
				{ name = "buffer", keyword_length = 3, max_item_count = 5, priority_weight = 100 },
				{ name = "path", priority_weight = 110 },
				{ name = "nvim_lua", priority_weight = 90 },
				{ name = "nvim_lsp_signature_help" },
				{ name = "crates" },
			}),
			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					-- maxwidth = 50,
					ellipsis_char = "...",
					menu = {
						cody = "[cody]",
					},
				}),
			},

			--       formatting = {
			-- format = function(entry, vim_item)
			-- 	 local icons = require("freesec.kind").icons
			-- 			 vim_item.kind = icons[vim_item.kind]
			-- 			 vim_item.menu = ({
			-- 				 nvim_lsp = "[LSP]",
			-- 				 emoji = "[Emoji]",
			-- 				 path = "[Path]",
			-- 				 calc = "[Calc]",
			-- 				 cmp_tabnine = "[Tabnine]",
			-- 				 vsnip = "[Vsnip]",
			-- 				 luasnip = "[Luasnip]",
			-- 				 buffer = "[Buffer]",
			-- 				 latex_symbols = "[LaTeX]",
			-- 			 })[entry.source.name]
			-- 			 vim_item.dup = ({
			-- 				 buffer = 1,
			-- 				 path = 1,
			-- 				 nvim_lsp = 0,
			-- 			 })[entry.source.name] or 0
			-- 			 return vim_item
			-- end,
			--         },
		})
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
	end,
}
