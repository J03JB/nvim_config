return {
    'tamago324/lir.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'kyazdani42/nvim-web-devicons',
        'tamago324/lir-git-status.nvim',
        'tamago324/lir-mmv.nvim',
    },
    config = function()
		local actions = require("lir.actions")
		local mark_actions = require("lir.mark.actions")
		local clipboard_actions = require("lir.clipboard.actions")

		require("lir").setup({
			show_hidden_files = false,
			ignore = {}, -- { ".DS_Store", "node_modules" } etc.
			devicons = {
				enable = true,
				highlight_dirname = true,
			},
			mappings = {
                ["<CR>"] = actions.edit,
				["<C-s>"] = actions.split,
				["<C-v>"] = actions.vsplit,
				["<C-t>"] = actions.tabedit,

				["-"] = actions.up,
				["q"] = actions.quit,

				["K"] = actions.mkdir,
				["N"] = actions.newfile,
				["R"] = actions.rename,
				["@"] = actions.cd,
				["Y"] = actions.yank_path,
				["."] = actions.toggle_show_hidden,
				["D"] = actions.delete,

				["J"] = function()
					mark_actions.toggle_mark()
					vim.cmd("normal! j")
				end,
				["C"] = clipboard_actions.copy,
				["X"] = clipboard_actions.cut,
				["P"] = clipboard_actions.paste,

                ['M']     = require'lir.mmv.actions'.mmv,
			},
			float = {
                float = { winblend = 15 },
				-- curdir_window = {
				-- 	enable = false,
				-- 	highlight_dirname = false,
				-- },
			},
			hide_cursor = true,
		})

        vim.api.nvim_set_keymap("n", "<leader>-", ":edit %:h<CR>", { noremap = true })
        vim.keymap.set("n", "<leader>e", "<cmd>lua require'lir.float'.toggle()<CR>", {noremap = true, desc = "open file manager"} )

		vim.api.nvim_create_autocmd({ "FileType" }, {
			pattern = { "lir" },
			callback = function()
				-- use visual mode
				vim.api.nvim_buf_set_keymap(
					0,
					"x",
					"J",
					':<C-u>lua require"lir.mark.actions".toggle_mark("v")<CR>',
					{ noremap = true, silent = true }
				)

				-- echo cwd
				vim.api.nvim_echo({ { vim.fn.expand("%:p"), "Normal" } }, false, {})
			end,
		})

		-- custom folder icon
		require("nvim-web-devicons").set_icon({
			lir_folder_icon = {
				icon = "",
				color = "#7ebae4",
				name = "LirFolderNode",
			},
		})

        require("lir.git_status").setup {
            show_ignored = false,
        }
	end,
}
