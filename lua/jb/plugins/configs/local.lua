-----------------------------------------------------------------------------------------------
-- Plugin Dev
-----------------------------------------------------------------------------------------------
local M = {
  -- { dir = "~/Dev/Plugins/teleprompt.nvim" },
  -- {
  -- 	dir = "~/Dev/Plugins/gitbar.nvim",
  -- 	dev = true,
  --    },
  {
    "J03JB/pasta.nvim",
    dir = "~/Dev/Plugins/pasta.nvim",
    init = function()
      require("pasta").setup()
    end,
  },
  --    { dir = "~/Dev/Plugins/fzf-undo/" },
}

return M
