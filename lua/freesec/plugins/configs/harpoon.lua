return {
	--     enabled = false,
	-- "ThePrimeagen/harpoon",

	--     keys = {
	--         { "<C-l>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>", desc = "Show harpoon menu"      },
	--         { "<leader>a", "<cmd>lua require('harpoon.mark').add_file()<CR>",    desc = "Add file to harpoon"    },
	--         { "<leader>1", "<cmd>lua require('harpoon.ui').nav_file(1)<CR>",     desc = "File 1 harpoon"         },
	--         { "<leader>2", "<cmd>lua require('harpoon.ui').nav_file(2)<CR>",     desc = "File 2 harpoon"         },
	--         { "<leader>3", "<cmd>lua require('harpoon.ui').nav_file(3)<CR>",     desc = "File 3 harpoon"         },
	--         { "<leader>4", "<cmd>lua require('harpoon.ui').nav_file(4)<CR>",     desc = "File 4 harpoon"         },
	--         { "<A-[>",     "<cmd>lua require('harpoon.ui').nav_prev()<CR>",      desc = "Previous mark  harpoon" },
	--         { "<A-]>",     "<cmd>lua require('harpoon.ui').nav_next()<CR>",      desc = "Next  mark  harpoon"    },
	--     },

	-- config = function()
	-- 	local ui = require("harpoon.ui")
	-- 	local tmux = require("harpoon.tmux")
	-- 	vim.keymap.set("n", "<A-t>", function()
	-- 		tmux.gotoTerminal(1)
	-- 	end)

	-- 	-- Fix for macos and Alt key.
	-- 	vim.keymap.set("n", "‘", function()
	-- 		ui.nav_next()
	-- 	end)
	-- 	vim.keymap.set("n", "“", function()
	-- 		ui.nav_prev()
	-- 	end)
	-- 	vim.keymap.set("n", "†", function()
	-- 		tmux.gotoTerminal(1)
	-- 	end)
	-- end,
}
