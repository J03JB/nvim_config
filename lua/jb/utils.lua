local cmd = vim.cmd
local M = {}

function M.create_augroups(definitions)
	for group_name, definition in pairs(definitions) do
		cmd("augroup " .. group_name)
		cmd("autocmd!")
		for _, def in ipairs(definition) do
			local command = table.concat(vim.tbl_flatten({ "autocmd", def }), " ")
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

-- DEV : from tjdevries:globals.lua
-- Save the local require here
local require = require

local ok, plenary_reload = pcall(require, "plenary.reload")
local reloader = require
if ok then
  reloader = plenary_reload.reload_module
end

M.P = function(v)
  print(vim.inspect(v))
  return v
end

M.RELOAD = function(...)
  local ok, plenary_reload = pcall(require, "plenary.reload")
  if ok then
    reloader = plenary_reload.reload_module
  end

  return reloader(...)
end

M.R = function(name)
  M.RELOAD(name)
  return require(name)
end

M.icons = {
	kind = {
		Text = " ",
		Method = "",
		Function = "",
		Constructor = "",
		Field = "",
		Variable = "",
		Property = "ﰠ",
		Class = "ﴯ",
		Interface = "",
		Struct = "",
		Module = "",
		Unit = "",
		Value = "",
		Enum = "",
		EnumMember = "",
		Keyword = " ",
		Constant = "",
		Snippet = "󱄽 ",
		Color = " ",
		File = "",
		Reference = "",
		Folder = "",
		Event = "",
		Operator = " ",
		TypeParameter = "",
		Copilot = " ",
	},
}

return M
