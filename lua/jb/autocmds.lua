local utils = require("jb.utils")
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
			[[lua require('vim.hl').on_yank({ higroup = 'Substitute', timeout = 500 })]],
		},
	},
    close_with_q = {
		-- close windows with 'q'
		{ "FileType", "qf,git,tsplayground,fugitive*,checkhealth,help,man,notify", [[ nnoremap <buffer> q :close<CR> | set nobuflisted ]] },
    },
    vim_resized = {
		-- resizes splits when terminal gets resized
		{ "WinResized", "*", "wincmd =" },
    },
	jb = {
		-- Hide cursorline in insert mode
		{ "InsertLeave,WinEnter", "*", "set cursorline" },
		{ "InsertEnter,WinLeave", "*", "set nocursorline" },

		-- Restore cursor position when opening file
		{ "BufReadPost", "*", 'silent! normal! g`"zv' },

		-- open help in vertical split instead of horizontal
		{ "BufWinEnter", "*", [[if &buftype == 'help' | wincmd L | endif]] },

		-- close neovim if quickfix is the last window
    { "WinEnter", "*", [[  if winnr('$') == 1 && &buftype == "quickfix"|q|endif ]] },
    { "TextYankPost", "*",  [[lua if vim.v.event.operator == 'y' then require('jb.utils').yank_shift() end]]  },
	},
}

require("jb.utils").create_augroups(groups)
