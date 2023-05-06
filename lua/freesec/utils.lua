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

M.ansi_codes = {
	_clear = "[0m",
	_red = "[0;31m",
	_green = "[0;32m",
	_yellow = "[0;33m",
	_blue = "[0;34m",
	_magenta = "[0;35m",
	_cyan = "[0;36m",
	_grey = "[0;90m",
	_dark_grey = "[0;97m",
	_white = "[0;98m",
	red = function(self, string)
		return self._red .. string .. self._clear
	end,
	green = function(self, string)
		return self._green .. string .. self._clear
	end,
	yellow = function(self, string)
		return self._yellow .. string .. self._clear
	end,
	blue = function(self, string)
		return self._blue .. string .. self._clear
	end,
	magent = function(self, string)
		return self._magenta .. string .. self._clear
	end,
	cyan = function(self, string)
		return self._cyan .. string .. self._clear
	end,
	grey = function(self, string)
		return self._grey .. string .. self._clear
	end,
	dark_grey = function(self, string)
		return self._dark_grey .. string .. self._clear
	end,
	white = function(self, string)
		return self._white .. string .. self._clear
	end,
}

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

local function show_documentation()
	local filetype = vim.bo.filetype
	if vim.tbl_contains({ "vim", "help" }, filetype) then
		vim.cmd("h " .. vim.fn.expand("<cword>"))
	elseif vim.tbl_contains({ "man" }, filetype) then
		vim.cmd("Man " .. vim.fn.expand("<cword>"))
	elseif vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
		require("crates").show_popup()
	else
		vim.lsp.buf.hover()
	end
end

vim.keymap.set("n", "K", show_documentation, { silent = true })

return M
