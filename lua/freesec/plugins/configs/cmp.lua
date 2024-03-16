return {
	"hrsh7th/nvim-cmp",
	dependencies = {
		"hrsh7th/cmp-cmdline",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-nvim-lua",
		"hrsh7th/cmp-nvim-lsp-signature-help",
        { "saadparwaiz1/cmp_luasnip", dependencies = { "L3MON4D3/LuaSnip" } },
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
        "petertriho/cmp-git",
	},
	event = { "InsertEnter", "CmdlineEnter" },
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local luasnip = require("luasnip")

		local formatForTailwindCSS = function(entry, vim_item)
			if vim_item.kind == "Color" and entry.completion_item.documentation then
				local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
				if r then
					local color = string.format("%02x", r) .. string.format("%02x", g) .. string.format("%02x", b)
					local group = "Tw_" .. color
					if vim.fn.hlID(group) < 1 then
						vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
					end
					vim_item.kind = "●" -- or "■" or anything
					vim_item.kind_hl_group = group
					return vim_item
				end
			end
			-- vim_item.kind = icons[vim_item.kind] and (icons[vim_item.kind] .. vim_item.kind) or vim_item.kind
			-- or just show the icon
			vim_item.kind = lspkind.symbolic(vim_item.kind) and lspkind.symbolic(vim_item.kind) or vim_item.kind
			return vim_item
		end

		-- Snippets
		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()
		require("luasnip.loaders.from_vscode").lazy_load({ paths = "./snippets" })

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
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<C-y>"] = cmp.mapping.confirm({ select = false }), -- confirm completion
				["<CR>"] = cmp.mapping.confirm({ select = false }), -- confirm completion
                 -- Cody completion
                ["<C-a>"] = cmp.mapping.complete {
                    config = {
                        sources = {
                            { name = "cody" },
                        },
                    },
                },
                -- luasnip mappings
				["<Tab>"] = function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					else
						-- tabout, replace with fallback() to go back to default
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true), "")
					end
				end,
				["<S-Tab>"] = function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						-- tabout, replace with fallback() to go back to default
						vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true), "")
					end
				end,
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "cody" },
				{ name = "nvim_lua" },
				{ name = "nvim_lsp" },
				{ name = "nvim_lsp_signature_help" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
				{ name = "crates" },
			}),
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },
            -- configure lspkind for vs-code like pictograms in completion menu
            formatting = {
				fields = { "abbr", "kind", "menu" },
				expandable_indicator = true,
				format = lspkind.cmp_format({
					mode = "symbol_text",
					maxwidth = 50,
					symbol_map = {
						Cody = "󰧑 ",
						tabnine = "󰧑 ",
						-- Cody = "",
						-- tabnine = "",
					},
					before = function(entry, vim_item)
						vim_item.menu = "(" .. vim_item.kind .. ")"
						vim_item.dup = ({
							nvim_lsp = 0,
							path = 0,
						})[entry.source.name] or 0
						vim_item = formatForTailwindCSS(entry, vim_item) -- for tailwind css autocomplete
						return vim_item
					end,
				}),
			},
		})
        cmp.setup.filetype('gitcommit', {
            sources = cmp.config.sources({
                { name = 'git' },
            }, {
                    { name = 'buffer' },
                })
        })
        require("cmp_git").setup()

        -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' }
            }
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

        -- adds () afte completing functions  
        -- (https://github.com/hrsh7th/nvim-cmp/wiki/Advanced-techniques#add-parentheses-after-selecting-function-or-method-item)
        local cmp_autopairs = require('nvim-autopairs.completion.cmp')
        cmp.event:on(
            'confirm_done',
            cmp_autopairs.on_confirm_done()
        )

	end,
}
