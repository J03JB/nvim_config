local M = {

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
  },

  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
      bigfile = { enabled = false },
      dashboard = { enabled = false },
      explorer = { enabled = false },
      indent = { enabled = false },
      input = { enabled = true },
      picker = { enabled = false },
      notifier = { enabled = false },
      quickfile = { enabled = false },
      scope = { enabled = false },
      scroll = { enabled = false },
      statuscolumn = { enabled = false },
      words = { enabled = false },
    },
  },
  -- {
  -- 	"laytan/cloak.nvim",
  --
  -- 	config = function()
  -- 		local cloak = require("cloak")
  -- 		cloak.setup({
  -- 			enabled = true,
  -- 			cloak_character = "*",
  -- 			highlight_group = "Comment",
  -- 			cloak_length = nil, -- Provide a number if you want to hide the true length of the value.
  -- 			try_all_patterns = true,
  -- 			patterns = {
  -- 				{
  -- 					file_pattern = ".env*",
  -- 					cloak_pattern = "=.+",
  -- 					replace = nil,
  -- 				},
  -- 			},
  -- 		})
  -- 	end,
  -- },
  -- {
  -- 	"brenoprata10/nvim-highlight-colors",
  -- 	config = function()
  -- 		require("nvim-highlight-colors").setup({
  -- 			---Render style
  -- 			---@usage 'background'|'foreground'|'virtual'
  -- 			render = "foreground",
  -- 			---Set virtual symbol (requires render to be set to 'virtual')
  -- 			virtual_symbol = "■■■■",
  -- 			---Highlight named colors, e.g. 'green'
  -- 			enable_named_colors = true,
  -- 			---Highlight tailwind colors, e.g. 'bg-blue-500'
  -- 			enable_tailwind = true,
  -- 		})
  -- 	end,
  -- },
}

return M
