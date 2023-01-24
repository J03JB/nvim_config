require("indent_blankline").setup({
	filetype_exclude = {
		"vimwiki",
		"man",
		"gitmessengerpopup",
		"diagnosticpopup",
		"lspinfo",
		"packer",
		"checkhealth",
		"TelescopePrompt",
		"TelescopeResults",
		"",
	},
	buftype_exclude = { "terminal" },
	space_char_blankline = " ",
	show_foldtext = false,
	strict_tabs = true,
	debug = true,
	disable_with_nolist = true,
	max_indent_increase = 1,
	show_current_context = true,
	show_current_context_start = true,
})

vim.opt.list = true
vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append("eol:↴")
