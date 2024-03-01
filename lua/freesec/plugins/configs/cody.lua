return {
	"sourcegraph/sg.nvim",
    event = "insertEnter",

    dependencies = "nvim-lua/plenary.nvim",

	config = function()
		require("sg").setup({
			on_attach = require("freesec.plugins.lsp.lspconfig").on_attach,
			enable_cody = true,
		})
	end,

    vim.keymap.set("v", "<space>ca", ":CodyAsk "),

	-- Toggle cody chat
	vim.keymap.set("n", "<space>co", function()
		require("sg.cody.commands").toggle()
	end),

	vim.keymap.set("n", "<space>cn", function()
		local name = vim.fn.input("chat name: ")
		require("sg.cody.commands").chat(name)
	end),

	vim.keymap.set("n", "<space>sc", function()
		require("sg.extensions.telescope").fuzzy_search_results()
	end),

    -- this is ugly af!
    vim.keymap.set("v", "<space>cd", function()
        local buf = vim.api.nvim_get_current_buf()
        local start = vim.fn.line("v")
        local eline = vim.fn.line(".")
        local msg = vim.fn.getreg('"')
        require("sg.cody.commands").do_task(buf, start, eline, msg )
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), 'n', true)
    end)

}
