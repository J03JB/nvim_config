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
	spec = {
		-- { import = "freesec.Lazy" },
		-- { import = "freesec.Lazy.lsp" },
		{ import = "freesec.plugins" },
		{ import = "freesec.plugins.lsp" },
		{ import = "freesec.plugins.configs" },
	},
})

-- keymaps
local map = require("freesec.utils").map

map("n", "<Leader>ls", ":Lazy sync <CR>")
