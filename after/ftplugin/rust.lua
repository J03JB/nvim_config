local bufnr = vim.api.nvim_get_current_buf()

-- Code action
vim.keymap.set("n", "<leader>ga", function()
	vim.cmd.RustLsp("codeAction") -- supports rust-analyzer's grouping
end, { silent = true, buffer = bufnr })

-- rust hover actions
vim.keymap.set(
	"n",
	"K", -- Override Neovim's built-in hover keymap with rustaceanvim's hover actions
	function()
		vim.cmd.RustLsp({ "hover", "actions" })
	end,
	{ silent = true, buffer = bufnr }
)

-- Open docs.rs
vim.keymap.set("n", "<leader>od", function()
	vim.cmd.RustLsp("openDocs")
end, { silent = true, buffer = bufnr })
