return {
  "ibhagwan/fzf-lua",

  dependencies = { "nvim-tree/nvim-web-devicons" },

  keys = {
    { "<leader>ev", "<cmd>lua require'jb.fzf_custom'.edit_nvim()<cr>", desc = "Fzf Nvim Config" },
    { "<C-g>", "<Cmd>lua require'fzf-lua'.grep_project()<CR>", desc = "Fzf Grep Project" },
    { "<C-k>", "<Cmd>lua require'fzf-lua'.builtin()<CR>", desc = "Fzf Builtin" },
    { "<leader>bb", "<Cmd>lua require'fzf-lua'.buffers()<CR>", desc = "Fzf Buffers" },
    { "<leader>fc", "<cmd>lua require'fzf-lua'.commands()<cr>", desc = "Fzf Commands" },
    { "<leader>ff", "<Cmd>lua require'fzf-lua'.files()<CR>", desc = "Fzf Find Files" },
    { "<leader>fg", "<Cmd>lua require'fzf-lua'.git_files()<CR>", desc = "Fzf Git Files" },
    { "<leader>fh", "<Cmd>lua require'fzf-lua'.help_tags()<CR>", desc = "Fzf Help Tags" },
    { "<leader>fk", "<cmd>lua require'fzf-lua'.keymaps()<CR>", desc = "Fzf Show Keymaps" },
    { "<leader>fq", "<cmd>lua require'fzf-lua'.quickfix()<CR>", desc = "Fzf Quickfix" },
    { "<leader>fr", "<Cmd>lua require'fzf-lua'.oldfiles()<CR>", desc = "Fzf Recent Files" },
    { "<leader>fs", "<cmd>lua require'fzf-lua'.grep_cword()<cr>", desc = "Fzf word Under Cursor" },
    { "<leader>fS", "<cmd>lua require'fzf-lua'.grep_cWORD()<cr>", desc = "Fzf WORD Under Cursor" },
    { "<leader>ft", "<cmd>lua require'fzf-lua'.tags()<cr>", desc = "Fzf Tags" },
    { "<leader>fw", "<Cmd>lua require'fzf-lua'.live_grep_glob()<CR>", mode = "n", desc = "Fzf Live Grep" },
    { "<leader>fw", "<cmd>lua require'fzf-lua'.grep_visual()<cr>", mode = "x", desc = "Fzf Grep Visual Seleciton" },
    { "<leader>gc", "<cmd>lua require'fzf-lua'.git_commits()<cr>", desc = "Fzf Git Commits" },
    -- { "<leader>fu", "<cmd>Telescope undo<CR>",                         desc = "show undo list" },
  },

  config = function()
    require("fzf-lua").setup {
      fzf = {
        keymap = {
          -- use cltr-q to select all items and convert to quickfix list
          ["ctrl-q"] = "select-all+accept",
        },
      },
      oldfiles = {
        cwd_only = true,
        stat_file = true, -- verify files exist on disk
      },
      git = {
        icons = {
          ["M"] = { icon = "~", color = "yellow" },
          ["D"] = { icon = "✗", color = "red" },
          ["A"] = { icon = "+", color = "green" },
        },
      },
    }

    local actions = require("fzf-lua").actions
    actions = {
      files = {
        ["enter"] = actions.file_edit_or_qf,
        ["ctrl-s"] = actions.file_split,
        ["ctrl-v"] = actions.file_vsplit,
        -- ["ctrl-t"] = actions.file_tabedit,
        ["ctrl-q"] = actions.file_sel_to_qf,
        ["alt-Q"] = actions.file_sel_to_ll,
        ["ctrl-t"] = require("trouble.sources.fzf").actions.open,
      },
    }

    -- use `fzf-lua` for replace vim.ui.select
    -- https://github.com/ibhagwan/fzf-lua/wiki#ui-select-auto-size
    -- require("fzf-lua").register_ui_select(function(_, items)
    --     local min_h, max_h = 0.15, 0.70
    --     local h = (#items + 4) / vim.o.lines
    --     if h < min_h then
    --         h = min_h
    --     elseif h > max_h then
    --         h = max_h
    --     end
    --     return { winopts = { height = h, width = 0.60, row = 0.40 } }
    -- end)
  end,
}
