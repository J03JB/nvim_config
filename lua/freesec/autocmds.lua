local groups = {
	filetype = {
		-- set spell for markdown, txt and git commit
		{ "FileType", "gitcommit,markdown,txt", "setlocal spell" },

		-- don't continue comment on next line
		{ "FileType", "*", "setlocal formatoptions-=cro" },
	},
	hl_yank = {
		-- Highlight text after yanking
		{
			"TextYankPost",
			"*",
			[[lua require('vim.highlight').on_yank({ higroup = 'Substitute', timeout = 500 })]],
		},
	},
    q_to_quit = {
		-- close windows with 'q'
		{ "FileType", "qf,git,tsplayground,fugitive*,checkhealth,help", [[ nnoremap <buffer> q :close<CR> | set nobuflisted ]] },
    },
	freesec = {
		-- resizes splits when terminal gets resized
		{ "WinResized", "*", "wincmd =" },

		-- Hide cursorline in insert mode
		{ "InsertLeave,WinEnter", "*", "set cursorline" },
		{ "InsertEnter,WinLeave", "*", "set nocursorline" },

		-- Restore cursor position when opening file
		{ "BufReadPost", "*", 'silent! normal! g`"zv' },

		-- open help in vertical split instead of horizontal
		{ "BufWinEnter", "*", [[if &buftype == 'help' | wincmd L | endif]] },

		-- close neovim if quickfix is the last window
        { "WinEnter", "*", [[  if winnr('$') == 1 && &buftype == "quickfix"|q|endif ]] },
	},
}

require("freesec.utils").create_augroups(groups)
