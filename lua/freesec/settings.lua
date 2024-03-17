-- ###################################################################################
--		 _____        __   __   _
--		/ ___/ ___   / /_ / /_ (_)____   ____ _ _____
--		\__ \ / _ \ / __// __// // __ \ / __ `// ___/
--		___/ //  __// /_ / /_ / // / / // /_/ /(__  )
--	/____/ \___/ \__/ \__//_//_/ /_/ \__, //____/
--	             								  /____/
--
-- ###################################################################################

local opt = vim.opt

vim.g.mapleader = " "  -- set leader to <space>

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.autoindent = true
opt.autoread = true -- Reload file if changed outside vim
opt.autowrite = true
opt.autowriteall = true
opt.background = "dark" -- Dark background
opt.backup = false -- No backup file
opt.clipboard = { "unnamed" } -- Copy paste between vim and everything else
opt.cmdheight = 2 -- More space for displaying messages
opt.cursorline = true -- Highlight current line
opt.diffopt = "vertical" -- Diff in vertical split
opt.encoding = "utf-8"
opt.expandtab = true
opt.hidden = true -- Buffer switching without saving
opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- But sensitice if includes capital letter
opt.inccommand = "split" --Show live results of substitute
opt.incsearch = true -- Show results as you search
opt.lazyredraw = true -- Only redraw when need to
opt.list = true
opt.listchars = {
	nbsp = "⦸",
	tab = "  ",
	extends = "»",
	precedes = "«",
	trail = "·",
}
opt.mouse = "a" -- enable mouse
opt.number = true
opt.relativenumber = true
opt.swapfile = false
opt.scrolloff = 8 -- Lines to scroll when cursor leaves screen
opt.shiftwidth = 4
opt.showbreak = "↳ " -- Show cool character on line wrap
opt.fillchars = { eob = " " } -- Suppress ~ at EndOfBuffer
opt.showcmd = true
opt.showmatch = true -- Highlight matching parentheses, etc.
opt.showmode = true -- shows mode in cmd line. (insert, visual etc.)
opt.sidescroll = 5 -- Lines to scroll horizontally
opt.signcolumn = "yes:1"
opt.smarttab = true
opt.smartindent = true
opt.splitright = true -- Open new split to the right
opt.softtabstop = 4
opt.suffixesadd = { ".md", ".js", ".ts", ".tsx" } -- File extensions not required when opening with `gf`
opt.tabstop = 4
opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms
opt.termguicolors = true
-- opt.guicursor = "i:block"
opt.undodir = vim.fn.expand("~/.config/nvim/backups")
opt.undofile = true
opt.updatetime = 100 -- Trigger cursorhold faster
opt.wrap = false -- wrap lines
opt.writebackup = false
opt.completeopt = "menu,menuone,noselect"
opt.confirm = true

-- TODO: look into this!!
-- vim.g.clipboard = {
--     name = "OSC 52",
--     copy = {
--         ['+'] = require('vim.ui.clipboard.osc52').copy('+'),
--     },
-- }
-- vim.loader.enable()

-- Messages
opt.shortmess = table.concat({
	"f",
	"i",
	"l",
	"n",
	"x",
	"t",
	"T",
	"o",
	"O",
	"F", -- Defaults
	"a", -- Use abbreviations in messages ([RO] intead of [readonly])
	"c", -- Do not show ins-completion-menu messages (match 1 of 2)
})

vim.g.floating_window_border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
vim.g.floating_window_border_dark = {
	{ "╭", "FloatBorderDark" },
	{ "─", "FloatBorderDark" },
	{ "╮", "FloatBorderDark" },
	{ "│", "FloatBorderDark" },
	{ "╯", "FloatBorderDark" },
	{ "─", "FloatBorderDark" },
	{ "╰", "FloatBorderDark" },
	{ "│", "FloatBorderDark" },
}

-- fix common typo in cmd line
vim.cmd([[
cnoreabbrev Wq wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
]])
-- Python Path
if vim.fn.has("mac") == 1 then
	vim.g.python3_host_prog = "/usr/local/bin/python3"
else
	vim.g.python3_host_prog = "/usr/bin/python"
end

-----------------------------------------------------------------------------------------
-- Neovide settings for macOS
-----------------------------------------------------------------------------------------
if vim.g.neovide then
	vim.g.neovide_confirm_quit = true
	vim.g.neovide_cursor_animate_command_line = false
	vim.g.neovide_input_macos_alt_is_meta = true
	vim.g.neovide_input_use_logo = 1
	vim.keymap.set("v", "<D-c>", '"+y') -- Copy
	vim.keymap.set("n", "<D-v>", '"+P') -- Paste normal mode
	vim.keymap.set("v", "<D-v>", '"+P') -- Paste visual mode
	vim.keymap.set("c", "<D-v>", "<C-R>+") -- Paste command mode
	vim.keymap.set("i", "<D-v>", '<ESC>l"+Pli') -- Paste insert mode
	-- set dir to $HOME when Neovide opens.
	vim.api.nvim_create_autocmd({ "VimEnter" }, { pattern = "*", command = ":cd $HOME " })
end

DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
