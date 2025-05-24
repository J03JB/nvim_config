local cmd = vim.cmd
local M = {}

function M.create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		cmd("augroup " .. group_name)
		cmd("autocmd!")
		for _, def in ipairs(definition) do
            local command = table.concat(vim.iter({ "autocmd", def }):flatten():totable(), " ")
			cmd(command)
		end
		cmd("augroup END")
	end
end

-- set keymaps
function M.map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end

	vim.keymap.set(mode, lhs, rhs, options)
end

--- get current visual selection rows
--- @return integer start_row beginning of visual selection
--- @return integer end_row end of visual selection
M.get_visual_selection_rows = function()
	local start_row = math.min(vim.fn.getpos("v")[2], vim.fn.getpos(".")[2])
	local end_row = math.max(vim.fn.getpos("v")[2], vim.fn.getpos(".")[2])
	return start_row, end_row
end

-- Shift numbered registers up (1 becomes 2, etc.)
-- autocmd is set up in jb/autocmds.lua
-- credit: Reddit PieceAdventurous9467
function M.yank_shift()
  for i = 9, 1, -1 do
    vim.fn.setreg(tostring(i), vim.fn.getreg(tostring(i - 1)))
  end
end

M.icons = {
	kind = {
		Text = " ",
		Method = "󰆧 ",
		Function = "󰊕 ",
		Constructor = " ",
		Field = "󰇽 ",
		Variable = "󰂡 ",
		Property = "󰜢 ",
		Class = "󰠱 ",
		Interface = " ",
		Struct = " ",
		Module = " ",
		Unit = " ",
		Value = "󰎠 ",
		Enum = " ",
		EnumMember = " ",
		Keyword = "󰌋 ",
		Constant = "󰏿 ",
		Snippet = "󱄽 ",
		Color = " ",
		File = "󰈙 ",
		Reference = " ",
		Folder = "󰉋 ",
		Event = " ",
		Operator = " ",
		TypeParameter = "󰅲 ",
		Copilot = " ",
		Supermaven = " ",
	},
}

return M
