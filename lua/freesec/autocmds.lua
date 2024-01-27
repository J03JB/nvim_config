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
		{ "BufRead", "*", [[call setpos(".", getpos("'\""))]] },
		-- Format Json files using `jq`
		{ "BufWritePost", "*.json", ":%!jq ." },
		-- don't continue comment on next line
		{ "FileType", "*", "setlocal formatoptions-=cro" },
		-- open help in vertical split instead of horizontal
		{ "BufWinEnter", "*", [[if &buftype == 'help' | wincmd L | endif]] },
		-- resizes splits when terminal gets resized
		{
			"WinResized",
			"*",
			"wincmd =",
		},
		-- set spell for markdown, txt and git commit
		{
			"FileType",
			"gitcommit,markdown,txt",
			"setlocal spell",
		},
	},
})
