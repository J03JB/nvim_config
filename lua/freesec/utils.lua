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
	-- mode = mode or "n"

	if opts then
		options = vim.tbl_extend("force", options, opts)
	end

	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

P = function(v)
	print(vim.inspect(v))
	return v
end

return M
