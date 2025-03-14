return {
	"nvim-tree/nvim-tree.lua",

	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	-- keys = {
	-- 	{ "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle NvimTree" },
	-- },
    enabled = false,

	config = function()
		require("nvim-tree").setup({
			auto_reload_on_write = true,
			disable_netrw = false,
			hijack_cursor = false,
			hijack_netrw = true,
			hijack_unnamed_buffer_when_opening = false,
			open_on_tab = false,
			sort_by = "name",
			update_cwd = false,
			view = {
				width = 32,
				side = "left",
				preserve_window_proportions = false,
				number = false,
				relativenumber = false,
				signcolumn = "yes",
			},
			renderer = {
				indent_markers = {
					enable = true,
					icons = {
						corner = "└ ",
						edge = "│ ",
						none = "  ",
					},
				},
			},
			hijack_directories = {
				enable = true,
				auto_open = true,
			},
			update_focused_file = {
				enable = true,
				update_cwd = true,
				ignore_list = {},
			},
			-- ignore_ft_on_setup = {},
			system_open = {
				cmd = nil,
				args = {},
			},
			diagnostics = {
				enable = true,
				show_on_dirs = false,
				icons = {
					hint = "",
					info = "",
					warning = "",
					error = "",
				},
			},
			filters = {
				dotfiles = false,
				custom = {},
				exclude = { ".gitignore" },
			},
			git = {
				enable = true,
				ignore = false,
				timeout = 400,
			},
			actions = {
				use_system_clipboard = true,
				change_dir = {
					enable = true,
					global = true,
				},
				open_file = {
					quit_on_open = true,
					resize_window = false,
					window_picker = {
						enable = true,
						chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
						exclude = {
							filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
							buftype = { "nofile", "terminal", "help" },
						},
					},
				},
			},
			trash = {
				cmd = "trash",
				require_confirm = true,
			},
		})
	end,
    -- vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { silent = true, desc = "Open file tree" })
}
