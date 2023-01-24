require("lualine").setup {
    options = {
        icons_enabled = true,
        -- theme = "catppuccin",
        theme = "onedark",
        -- theme = 'auto',
        -- section_separators = {left = "", right = ""},
        -- component_separators = {left = "", right = ""},
        section_separators = {left = "", right = ""},
        component_separators = {left = "", right = ""},
        disabled_filetypes = {"packer"}
    },
    sections = {
        lualine_a = {"mode"},
        lualine_b = {"branch", "diff"},
        lualine_c = {"filename"},
        lualine_x = {
            {"diagnostics", sources = {"nvim_diagnostic"}},
            "filetype",
            "encoding"
        },
        lualine_y = {"fileformat"},
        lualine_z = {"progress", "location"}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {"filename"},
        lualine_x = {"location"},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {"nvim-tree", "quickfix", "toggleterm"}
}
