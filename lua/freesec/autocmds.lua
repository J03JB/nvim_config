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
		{ "BufReadPost", "*", 'silent! normal! g`"zv' },
		-- don't continue comment on next line
		{ "FileType", "*", "setlocal formatoptions-=cro" },
		-- open help in vertical split instead of horizontal
		{ "BufWinEnter", "*", [[if &buftype == 'help' | wincmd L | endif]] },
		-- resizes splits when terminal gets resized
		{ "WinResized", "*", "wincmd =" },
		-- set spell for markdown, txt and git commit
		{ "FileType", "gitcommit,markdown,txt", "setlocal spell" },
        -- close quickfix with 'q'
        { "FileType", "qf", [[ nnoremap <buffer> q :close<CR> | set nobuflisted ]], },
        -- cloe neovim if quickfix is the last window
		{
			"WinEnter",
			"*",
			[[  if winnr('$') == 1 && &buftype == "quickfix"|q|endif ]],
		},
	},
})
