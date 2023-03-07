-- require('nvim-autopairs').setup()
require("nvim-autopairs").setup({
	disable_filetype = { "TelescopePrompt" },
	disable_in_macro = false, -- disable when recording or executing a macro
	disable_in_visualblock = false, -- disable when insert after visual block mode
	ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
	enable_moveright = true,
	enable_afterquote = true, -- add bracket pairs after quote
	enable_check_bracket_line = true, --- check bracket in same line
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },
		javascript = { "string", "template_string" },
		java = false,
	},
	map_bs = true, -- map the <BS> key
	map_c_h = true, -- map <c-w> to delete a pair if possible
	-- map_cr = true,
})
-- local remap = vim.api.nvim_set_keymap
-- put this to setup function and press <a-e> to use fast_wrap
local npairs = require("nvim-autopairs")
npairs.setup({
	fast_wrap = {},
})

-- change default fast_wrap
npairs.setup({
	fast_wrap = {
		map = "<C-e>",
		chars = { "{", "[", "(", '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
		offset = 0, -- Offset from pattern match
		end_key = "$",
		keys = "qwertyuiopzxcvbnmasdfghjkl",
		check_comma = true,
		highlight = "Search",
		highlight_grey = "Comment",
	},
})
-- skip it, if you use another global object
_G.MUtils = {}

vim.g.completion_confirm_key = ""

MUtils.completion_confirm = function()
	if vim.fn.pumvisible() ~= 0 then
		if vim.fn.complete_info()["selected"] ~= -1 then
			require("completion").confirmCompletion()
			return npairs.esc("<c-y>")
		else
			vim.fn.nvim_select_popupmenu_item(0, false, false, {})
			require("completion").confirmCompletion()
			return npairs.esc("<c-n><c-y>")
		end
	else
		return npairs.check_break_line_char()
	end
end
