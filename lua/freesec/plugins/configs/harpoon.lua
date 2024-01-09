return {
	"ThePrimeagen/harpoon",

	config = function()
		local mark = require("harpoon.mark")
		local ui = require("harpoon.ui")
		local tmux = require("harpoon.tmux")
        local fidget = require("fidget")

		vim.keymap.set("n", "<leader>a", function()
            mark.add_file()
            fidget.notify( "󱡅  marked file")
        end)

		vim.keymap.set("n", "<C-l>", ui.toggle_quick_menu)

		vim.keymap.set("n", "<leader>1", function()
			ui.nav_file(1)
		end)
		vim.keymap.set("n", "<leader>2", function()
			ui.nav_file(2)
		end)
		vim.keymap.set("n", "<leader>3", function()
			ui.nav_file(3)
		end)
		vim.keymap.set("n", "<leader>4", function()
			ui.nav_file(4)
		end)
		vim.keymap.set("n", "<A-[>", function()
			ui.nav_prev()
		end)
		vim.keymap.set("n", "<A-]>", function()
			ui.nav_next()
		end)
		vim.keymap.set("n", "<A-t>", function()
			tmux.gotoTerminal(1)
		end)

		-- Fix for macos and Alt key.
		vim.keymap.set("n", "‘", function()
			ui.nav_next()
		end)
		vim.keymap.set("n", "“", function()
			ui.nav_prev()
		end)
		vim.keymap.set("n", "†", function()
			tmux.gotoTerminal(1)
		end)
	end,
}
