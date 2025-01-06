return {

	"folke/trouble.nvim",

	keys = {
		{ "tt", "<cmd>Trouble diagnostics toggle<cr>", desc = "[T]rouble Diagnostics" },
		{ "tb", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "[B]uffer Diagnostics" },
		{ "ts", "<cmd>Trouble symbols toggle focus=false<cr>", desc = "[S]ymbols (Trouble)" },
		{ "td", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", desc = "[D]efinitions / references" },
		{ "tl", "<cmd>Trouble loclist toggle<cr>", desc = "[L]ocation List" },
		{ "tq", "<cmd>Trouble qflist toggle<cr>", desc = "[Q]uickfix List" },
		{
			"]t",
			function()
				require("trouble").is_open()
				require("trouble").next({ skip_groups = true, jump = true })
			end,
			desc = "Jump to next error",
		},
		{
			"[t",
			function()
				require("trouble").is_open()
				require("trouble").prev({ skip_groups = true, jump = true })
			end,
			desc = "Jump to prev error",
		},
	},

	opts = {
		position = "bottom", -- position of the list can be: bottom, top, left, right
		height = 10, -- height of the trouble list when position is top or bottom
		width = 50, -- width of the list when position is left or right
		mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
		group = true, -- group results by file
		padding = true, -- add an extra new line on top of the list
		auto_close = true,
		auto_jump = true,
	},
}
