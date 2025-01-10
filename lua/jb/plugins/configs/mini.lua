return {

  { "echasnovski/mini.ai" },
  {
    "echasnovski/mini.surround",
    version = "*",
    opts = {
      custom_surroundings = nil,
      highlight_duration = 500,
      -- Module mappings. Use `''` (empty string) to disable one.
      mappings = {
        add = "sa", -- Add surrounding in Normal and Visual modes
        delete = "sd", -- Delete surrounding
        highlight = "sh", -- Highlight surrounding
        replace = "sr", -- Replace surrounding
      },
      search_method = "cover",
    },
  },
}
