return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
    build = ':Copilot auth',
    opts = {
        suggestion = { enabled = false },
        panel = { enabled = false },
    }
}
