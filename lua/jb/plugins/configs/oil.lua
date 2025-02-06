return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup {
        -- Skip the confirmation popup for simple operations
        skip_confirm_for_simple_edits = true,
        keymaps = {
          ["q"] = "actions.close",
          ["<C-v>"] = "actions.select_vsplit",
        },

        float = {
          -- Padding around the floating window
          padding = 2,
          -- max_width and max_height can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
          max_width = 0.5,
          max_height = 0.25,
          border = "rounded",
          win_options = {
            winblend = 10,
          },
        },
      }
      vim.keymap.set("n", "-", "<cmd>Oil<CR>")
      vim.keymap.set("n", "<leader>e", "<cmd>lua require'oil'.toggle_float()<CR>")
    end,
  },
}
