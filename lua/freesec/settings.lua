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

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.autoindent = true
opt.autoread = true
opt.autowrite = true
opt.autowriteall = true
opt.background = "dark"
opt.backup = false
opt.clipboard = {"unnamed", "unnamedplus"}
opt.cmdheight = 2
opt.cursorline = true -- Highlight current line
opt.diffopt = "vertical" -- Diff in vertical split
opt.encoding = "utf-8"
opt.expandtab = true
opt.hidden = true -- Buffer switching without saving
opt.ignorecase = true -- case insensitive search
opt.smartcase = true -- But sensitice if includes capital letter
opt.inccommand = "nosplit" --Show live results of substitute
opt.incsearch = true -- Show results as you search
opt.lazyredraw = true -- Only redraw when need to
opt.list = true
opt.listchars = {
    nbsp = "⦸",
    tab = "  ",
    extends = "»",
    precedes = "«",
    trail = "·"
}
opt.mouse = "a" -- enable mouse
opt.number = true
opt.relativenumber = true
opt.swapfile = false
opt.scrolloff = 8 -- Lines to scroll when cursor leaves screen
opt.shiftwidth = 4
opt.showbreak = "↳ " -- Show cool character on line wrap
opt.fillchars = {eob = " "} -- Suppress ~ at EndOfBuffer
opt.showcmd = true
opt.showmatch = true -- Highlight matching parentheses, etc.
opt.showmode = true -- shows mode in cmd line. (insert, visual etc.)
opt.sidescroll = 5 -- Lines to scroll horizontally
opt.signcolumn = "yes:1"
opt.smarttab = true
opt.smartindent = true
-- opt.spell = true
opt.splitright = true -- Open new split to the right
opt.softtabstop = 4
opt.suffixesadd = {".md", ".js", ".ts", ".tsx"} -- File extensions not required when opening with `gf`
opt.tabstop = 4
opt.timeoutlen = 500 -- By default timeoutlen is 1000 ms
opt.termguicolors = true
opt.undodir = vim.fn.expand("~/.config/nvim/backups")
opt.undofile = true
opt.updatetime = 100 -- Trigger cursorhold faster
opt.wrap = false -- wrap lines
opt.writebackup = false
vim.o.completeopt = "menu,menuone,noselect"
vim.o.confirm = true
-- Messages
opt.shortmess =
    table.concat(
    {
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
        -- 'I',  -- No splash screen
        -- 'W',  -- Don't print "written" when editing
        "a", -- Use abbreviations in messages ([RO] intead of [readonly])
        "c" -- Do not show ins-completion-menu messages (match 1 of 2)
    }
)

vim.g.floating_window_border = {"╭", "─", "╮", "│", "╯", "─", "╰", "│"}
vim.g.floating_window_border_dark = {
    {"╭", "FloatBorderDark"},
    {"─", "FloatBorderDark"},
    {"╮", "FloatBorderDark"},
    {"│", "FloatBorderDark"},
    {"╯", "FloatBorderDark"},
    {"─", "FloatBorderDark"},
    {"╰", "FloatBorderDark"},
    {"│", "FloatBorderDark"}
}
-- Sessions
vim.g.autoload_last_session = false

-- Python Path
if vim.fn.has("mac") == 1 then
    vim.g.python3_host_prog = "/usr/local/bin/python3"
else
    vim.g.python3_host_prog = "/usr/bin/python"
end

DATA_PATH = vim.fn.stdpath("data")
CACHE_PATH = vim.fn.stdpath("cache")
