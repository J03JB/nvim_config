return {
	"ibhagwan/fzf-lua",

	dependencies = { "nvim-tree/nvim-web-devicons" },

	keys = {
        { "<leader>ev", "<cmd>lua require'jb.fzf_custom'.edit_nvim()<cr>",       desc = "Fzf Nvim Config" },
		{ "<C-g>",      "<Cmd>lua require'fzf-lua'.grep_project()<CR>",          desc = "Fzf Grep Project" },
		{ "<C-k>",      "<Cmd>lua require'fzf-lua'.builtin()<CR>",               desc = "Fzf Builtin" },
		{ "<leader>bb", "<Cmd>lua require'fzf-lua'.buffers()<CR>",               desc = "Fzf Buffers" },
		{ "<leader>fc", "<cmd>lua require'fzf-lua'.commands()<cr>",              desc = "Fzf Commands" },
		{ "<leader>ff", "<Cmd>lua require'fzf-lua'.files()<CR>",                 desc = "Fzf Find Files" },
		{ "<leader>fh", "<Cmd>lua require'fzf-lua'.help_tags()<CR>",             desc = "Fzf Help Tags" },
		{ "<leader>fk", "<cmd>lua require'fzf-lua'.keymaps()<CR>",               desc = "Fzf Show Keymaps" },
		{ "<leader>fq", "<cmd>lua require'fzf-lua'.quickfix()<CR>",              desc = "Fzf Quickfix" },
		{ "<leader>fr", "<Cmd>lua require'fzf-lua'.oldfiles()<CR>",              desc = "Fzf Recent Files" },
		{ "<leader>fs", "<cmd>lua require'fzf-lua'.grep_cword()<cr>",            desc = "Fzf word Under Cursor" },
		{ "<leader>fS", "<cmd>lua require'fzf-lua'.grep_cWORD()<cr>",            desc = "Fzf WORD Under Cursor" },
        { "<leader>ft", "<cmd>lua require'fzf-lua'.tags()<cr>",                  desc = "Fzf Tags" },
		{ "<leader>fw", "<Cmd>lua require'fzf-lua'.live_grep_glob()<CR>",        desc = "Fzf Live Grep" },
		{ "<leader>gc", "<cmd>lua require'fzf-lua'.git_commits()<cr>",           desc = "Fzf Git Commits" },
		-- { "<leader>fu", "<cmd>Telescope undo<CR>",                         desc = "show undo list" },
	},

	config = function()
		require("fzf-lua").setup({
            oldfiles = {
                cwd_only = true,
                stat_file = true,         -- verify files exist on disk
            },
            git = {
                icons = {
                    ["M"]        = { icon = "~", color = "yellow" },
                    ["D"]        = { icon = "✗", color = "red" },
                    ["A"]        = { icon = "+", color = "green" },
                },
            },


        })

		local actions = require("fzf-lua").actions
		actions = {
			files = {
				["enter"] = actions.file_edit_or_qf,
				["ctrl-s"] = actions.file_split,
				["ctrl-v"] = actions.file_vsplit,
				["ctrl-t"] = actions.file_tabedit,
				["ctrl-q"] = actions.file_sel_to_qf,
				["alt-Q"] = actions.file_sel_to_ll,
			},
		}

        -- use `fzf-lua` for replace vim.ui.select 
        require("fzf-lua").register_ui_select()
	end,
    -- require("jb.fzf_custom")
}
