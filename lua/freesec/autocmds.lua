require("freesec.utils").create_augroups({
	setup = {
		-- Highlight text after yanking
		{
			"TextYankPost",
			"*",
			[[lua require('vim.highlight').on_yank({ higroup = 'Substitute', timeout = 200 })]],
		},
		-- Hide cursorline in insert mode
		{ "InsertLeave,WinEnter", "*", "set cursorline" },
		{ "InsertEnter,WinLeave", "*", "set nocursorline" },
		-- Restore cursor position when opening file
		-- { "BufRead", "*", [[call setpos(".", getpos("'\""))]] },
		-- Format Json files using `jq`
		{ "BufWritePost", "*.json", ":%!jq ." },
		-- don't continue comment on next line
		{ "FileType", "*", "setlocal formatoptions-=cro" },
		-- changes window-local to current directory (may remove.)
		-- { "BufEnter", "* silent!", "lcd %:p:h" },
	},
})
