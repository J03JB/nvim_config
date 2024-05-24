local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	install = {
		colorscheme = { "cyberdream" },
	},
	spec = {
		{ import = "jb.plugins" },
		{ import = "jb.plugins.lsp" },
		{ import = "jb.plugins.configs" },
	},
    dev = {
        path = "~/Dev/Plugins",
        fallback = false,
    },
	change_detection = {
		enabled = true,
		notify = false,
	},
	performance = {
		rtp = {
			-- disable some rtp plugins
			disabled_plugins = {
				"gzip",
				"matchit",
				-- "matchparen",
				-- "netrwPlugin",
				"tarPlugin",
				"tohtml",
				"tutor",
				"vimball",
				"vimballPlugin",
				"zipPlugin",
			},
		},
	},
})

-- keymaps
local map = require("jb.utils").map

map("n", "<Leader>l", ":Lazy<CR>")
map("n", "<Leader>ls", ":Lazy sync<CR>")
