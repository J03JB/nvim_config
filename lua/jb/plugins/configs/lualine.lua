return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "AndreM222/copilot-lualine" },

  config = function()
    require("lualine").setup {
      options = {
        icons_enabled = true,
        theme = "auto",
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          {
            "diff",
            diff_color = {
              added = { fg = "#99c794" },
              modified = { fg = "#5bb7b8" },
              removed = { fg = "#ec5f67" },
            },
          },
        },
        lualine_c = { "filename" },
        lualine_x = {
          { "diagnostics", sources = { "nvim_diagnostic" } },
          "filetype",
          -- "encoding",
        },
        lualine_y = {
          "fileformat",
        },
        lualine_z = {
          "progress",
          -- "location",
          -- {
          -- "copilot",
          -- show_colors = true,
          -- padding = 1,
          -- symbols = {
          -- spinners = require("copilot-lualine.spinners").dots,
          -- },
          -- },
        },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "nvim-tree", "quickfix", "fugitive" },
    }
  end,
}
