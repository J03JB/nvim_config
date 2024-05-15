return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("oil").setup {
				-- Skip the confirmation popup for simple operations
				skip_confirm_for_simple_edits = true,
				keymaps = {
					["q"] = "actions.close",
				},
			}
			vim.keymap.set("n", "-", "<cmd>Oil<CR>")
			vim.keymap.set("n", "<leader>e", "<cmd>lua require'oil'.toggle_float()<CR>")
		end,
	},
}
