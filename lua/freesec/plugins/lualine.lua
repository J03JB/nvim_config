local colors = {
	bg = "#282c34",
	fg = "#abb2bf",
	yellow = "#e0af68",
	cyan = "#56b6c2",
	darkblue = "#081633",
	green = "#98c379",
	orange = "#d19a66",
	violet = "#a9a1e1",
	magenta = "#c678dd",
	blue = "#61afef",
	red = "#e86671",
}

require("lualine").setup({
	options = {
		icons_enabled = true,
		-- theme = "auto",
		theme = {
			normal = {
				a = { fg = colors.fg, bg = colors.bg },
				b = { fg = colors.yellow, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
			},
			insert = {
				a = { fg = colors.blue, bg = colors.bg },
				b = { fg = colors.yellow, bg = colors.bg },
				x = { fg = colors.fg, bg = colors.bg },
				z = { fg = colors.fg, bg = colors.bg },
			},
			visual = {
				a = { fg = colors.magenta, bg = colors.bg },
				b = { fg = colors.yellow, bg = colors.bg },
				c = { fg = colors.fg, bg = colors.bg },
				z = { fg = colors.fg, bg = colors.bg },
			},
			command = { a = { fg = colors.orange, bg = colors.bg }, b = { fg = colors.yellow, bg = colors.bg } },
			replace = { a = { fg = colors.fg, bg = colors.bg }, b = { fg = colors.yellow, bg = colors.bg } },

			inactive = {
				a = { bg = colors.fg, fg = colors.bg },
				b = { bg = colors.yellow, fg = colors.bg },
				c = { bg = colors.fg, fg = colors.bg },
			},
		},
		-- section_separators = { left = "", right = "" },
		-- component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		ciiiiiiomponent_separators = { left = "", right = "" },
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
			"encoding",
		},
		lualine_y = { "fileformat" },
		lualine_z = { "progress", "location" },
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
	extensions = { "nvim-tree", "quickfix", "toggleterm", "aerial", "fugitive" },
})
