return {

	"j-hui/fidget.nvim",

	event = "LspAttach",

	config = function()
		require("fidget").setup({
			progress = {
				poll_rate = 100,
				ignore_done_already = true,
				display = {
					done_ttl = 0.5,
					-- Icon shown when LSP progress tasks are in progress
					-- progress_icon = { pattern = "meter", period = 2 },
					progress_icon = { pattern = "dots", period = 2 },
				},
			},
			notification = {
				-- override_vim_notify = true,
			},
		})
	end,
}
