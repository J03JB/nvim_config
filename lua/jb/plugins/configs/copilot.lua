return {
  {
    "zbirenbaum/copilot.lua",
    enabled = false,
    cmd = "Copilot",
    event = "InsertEnter",
    build = ":Copilot auth",
    opts = {
      suggestion = {
        enabled = false,
        auto_trigger = false,
        hide_during_completion = false,
        debounce = 75,
        keymap = {
          accept = "<M-a>",
          accept_word = false,
          accept_line = false,
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { enabled = false },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    lazy = true,
    event = "VeryLazy",
    enabled = false,
    branch = "main",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = {
      debug = false, -- Enable debugging
    },

    config = function(_, opts)
      require("CopilotChat").setup(opts)
    end,
    keys = {},
  },
}
