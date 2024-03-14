return {
	"kosayoda/nvim-lightbulb",
    lazy = true,
	opts = {
		sign = {
			enabled = true,
			-- Priority of the gutter sign
			priority = 20,
		},
		status_text = {
			enabled = true,
			-- Text to provide when code actions are available
			text = "status_text",
			-- Text to provide when no actions are available
			text_unavailable = "",
		},
		autocmd = {
			enabled = true,
			-- see :help autocmd-pattern
			pattern = { "*" },
			-- see :help autocmd-events
			events = { "CursorHold", "CursorHoldI", "LspAttach" },
		},
	},
}
