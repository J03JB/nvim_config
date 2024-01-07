return {
	"tpope/vim-fugitive",

	config = function()
		local map = require("freesec.utils").map

		local gitfug = vim.api.nvim_create_augroup("gitfug", {})

		local autocmd = vim.api.nvim_create_autocmd
		autocmd("BufWinEnter", {
			group = gitfug,
			pattern = "*",
			callback = function()
				if vim.bo.ft ~= "fugitive" then
					return
				end

				local bufnr = vim.api.nvim_get_current_buf()
				local opts = { buffer = bufnr, remap = false }

				vim.keymap.set("n", "<leader>p", function()
					vim.cmd.Git("push")
				end, opts)

				vim.keymap.set("n", "<leader>c", function()
					vim.cmd.Git("commit")
				end, opts)

				vim.keymap.set("n", "<leader>P", function()
					vim.cmd.Git({ "pull", "--rebase" })
				end, opts)
			end,
		})
        -- open Git
		map("n", "<leader>gs", "<CMD>Git<CR>")
	end,
}
