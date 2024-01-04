return {

    "j-hui/fidget.nvim",
	event = "LspAttach",
	lazy = true,

	config = function()
		require("fidget").setup()
	end,
}
