require("nvim-possession").setup()

init = function()
	local possession = require("nvim-possession")
	vim.keymap.set("n", "<leader>sl", function()
		possession.list()
	end)
	vim.keymap.set("n", "<leader>sn", function()
		possession.new()
	end)
	vim.keymap.set("n", "<leader>su", function()
		possession.update()
	end)
end
