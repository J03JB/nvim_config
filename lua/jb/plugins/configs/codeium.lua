return {
  "Exafunction/codeium.nvim",
  enabled = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    require("codeium").setup {}
  end,
}
