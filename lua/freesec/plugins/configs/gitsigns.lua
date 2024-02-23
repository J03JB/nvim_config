return {
	"lewis6991/gitsigns.nvim",
	event = { "BufRead", "BufNewFile" },
	config = function()
		local map = require("freesec.utils").map
		require("gitsigns").setup({
			signs = {
				add = { text = "+" },
				change = { text = "|" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			numhl = true,
			linehl = false,
			watch_gitdir = {
				interval = 1000,
			},
			current_line_blame = true,
			sign_priority = 6,
			update_debounce = 100,
			attach_to_untracked = true,
			status_formatter = nil, -- Use default
			preview_config = {
				border = "rounded",
				style = "minimal",
				relative = "cursor",
				row = 0,
				col = 1,
			},
		})

		-- Keymaps.
		map("n", "]g",         '<cmd>lua require"gitsigns".next_hunk()<CR>')
		map("n", "[g",         '<cmd>lua require"gitsigns".prev_hunk()<CR>')
		map("x", "ih",         '<cmd>lua require"gitsigns".select_hunk()<CR>')
		map("n", "<leader>hb", '<cmd>lua require"gitsigns".blame_line()<CR>')
		map("n", "<leader>hd", "<cmd>Gitsigns diffthis<CR>")
		map("n", "<leader>hD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
		map("n", "<leader>hp", '<cmd>lua require"gitsigns".preview_hunk()<CR>')
		map("n", "<leader>hr", '<cmd>lua require"gitsigns".reset_hunk()<CR>')
		map("n", "<leader>hR", '<cmd>lua require"gitsigns".reset_buffer()<CR>')
		map("n", "<leader>hs", '<cmd>lua require"gitsigns".stage_hunk()<CR>')
		map("n", "<leader>hu", '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>')
		map("n", "<leader>sh", '<cmd>lua require"gitsigns".select_hunk()<CR>')
		map("n", "<leader>td", "<cmd>Gitsigns toggle_deleted<CR>")
	end,
}
