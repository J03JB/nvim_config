-- ###################################################################################
--	     ______        __             _____        __
--      / ____/____   / /____   _____/ ___/ _____ / /_   ___   ____ ___   ___
--	   / /    / __ \ / // __ \ / ___/\__ \ / ___// __ \ / _ \ / __ `__ \ / _ \
--	  / /___ / /_/ // // /_/ // /   ___/ // /__ / / / //  __// / / / / //  __/
--	  \____/ \____//_/ \____//_/   /____/ \___//_/ /_/ \___//_/ /_/ /_/ \___/
--
-- ###################################################################################
local M = {}

function M.onedark()
	require("onedark").setup({
		style = "darker", -- 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
		highlight_linenumber = true,
		term_colors = true,
		code_style = {
			comments = "italic",
			key_words = "italic,bold",
			variables = "italic",
		},
		-- Plugins Config --
		diagnostics = {
			darker = true, -- darker colors for diagnostic
			undercurl = true, -- use undercurl instead of underline for diagnostics
			background = false, -- use background color for virtual text
		},
	})

	require("onedark").load()
end

function M.cyberdream()
	require("cyberdream").setup({
		italic_comments = true,

		theme = {
			highlights = {
				-- CursorLine = { bg = "#232223" },
				-- CursorColumn = { bg = "#232223" },
				-- LspInfoBorder = { fg = "#3c4048" },
			},
		},
	})

	vim.cmd.colorscheme("cyberdream")
end

-- M.onedark()
M.cyberdream()

return M
