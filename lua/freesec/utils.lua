local cmd = vim.cmd
local M = {}

M.merge = function(t1, t2)
	for k, v in pairs(t2) do
		t1[k] = v
	end
	return t1
end

M._if = function(bool, a, b)
	if bool then
		return a
	else
		return b
	end
end

function _G.copy(obj, seen)
	if type(obj) ~= "table" then
		return obj
	end
	if seen and seen[obj] then
		return seen[obj]
	end
	local s = seen or {}
	local res = {}
	s[obj] = res
	for k, v in next, obj do
		res[copy(k, s)] = copy(v, s)
	end
	return setmetatable(res, getmetatable(obj))
end

function _G.R(package)
	package.loaded[package] = nil
	return require(package)
end

function _G.T()
	print(require("nvim-treesitter.ts_utils").get_node_at_cursor():type())
end

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

return M
