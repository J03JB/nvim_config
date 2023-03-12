--###################################################################################
--       __  __
--      /  |/  /____ _ ____   ____   (_)____   ____ _ _____
--     / /|_/ // __ `// __ \ / __ \ / // __ \ / __ `// ___/
--    / /  / // /_/ // /_/ // /_/ // // / / // /_/ /(__  )
--   /_/  /_/ \__,_// .___// .___//_//_/ /_/ \__, //____/
--                 /_/    /_/               /____/
--
-- ###################################################################################

local key_mapper = function(mode, key, result)
	vim.api.nvim_set_keymap(mode, key, result, { noremap = true, silent = true })
end

-- ***********************************************************************************
-- Vim Key Bindings
-- ***********************************************************************************

-- Map leader to space
vim.g.mapleader = " "

-- Faster scrolling
key_mapper("n", "<c-DOWN>", "3<c-e>")
key_mapper("n", "<c-UP>", "3<c-y>")

--whenever you're in parentheses, you can simple invoke dp or cp to wipe it's contents (same for brackets, but db or cb).
key_mapper("o", "p", 'i"')
key_mapper("o", "b", "i(|")

--PAGEUP/PAGEDN ONLY HALF PAGE AT A TIME
key_mapper("n", "<PageUp>", "<C-U>")
key_mapper("n", "<PageDown>", "<C-D>")

-- "greatest remap ever" thePrimagen
key_mapper("x", "<leader>p", '"_dP')

-- next greatest remap: asbjornHaland
key_mapper("n", "<leader>y", '"+y')
key_mapper("x", "<leader>y", '"+y')
key_mapper("n", "<leader>Y", '"+Y')

key_mapper("n", "Q", "<nop>")

-- Change word to uppercase(ctrl+u) or lower(space+l)
key_mapper("n", "<leader>l", "viwgui<ESC>")
key_mapper("n", "<leader>u", "viwUi<ESC>")

-- Window Navigation
key_mapper("n", "<C-h>", "<C-w>h")
key_mapper("n", "<C-l>", "<C-w>l")

-- Kill buffer with leader bd
key_mapper("n", "<leader>bd", ":bdelete<CR>")

-- reload luafile
key_mapper("n", "<leader>lf", ":luafile %<CR>")

-- Move line up or down
key_mapper("n", "<C-k>", ":m-2<cr>")
key_mapper("n", "<C-j>", ":m+<cr>")

-- DITCH THOSE ARROW KEYS --> MOVE UP AND DOWN IN INSERT MODE WITH HJKL BY SIMPLY HOLDING CONTROL
key_mapper("i", "<c-j>", "<esc>ji")
key_mapper("i", "<c-k>", "<esc>ki")
key_mapper("i", "<c-h>", "<esc>i")
key_mapper("i", "<c-l>", "<esc>la")

-- Clear highlights
key_mapper("n", "<leader>h", ":noh<CR>")

-- insert new line above without enerting insert mode.
key_mapper("n", "<leader>o", "moO<ESC>k ")
key_mapper("n", "<leader>O", "moo<ESC>k")

-- Better indentaion (tab)
key_mapper("v", ">", ">gv")
key_mapper("v", "<", "<gv")

-- Copy to end of line from current position
key_mapper("n", "Y", "yg$")

-- Move selected line / block of text in visual mode
key_mapper("v", "J", ":move '>+1<CR>gv=gv")
key_mapper("v", "K", ":move '<-2<CR>gv=gv")

-- jj as Escape key
key_mapper("i", "jk", "<Esc>")
key_mapper("i", "jj", "<Esc>")

-- 2xleader to source file.
-- key_mapper("n", "<leader><leader>", ":so<CR>")

-- space + x to make file executable
key_mapper("n", "<leader>x", "<cmd>!chmod +x %<CR>")

key_mapper("n", "Q", "<nop>")
key_mapper("n", "U", "<nop>")

-- *************************************************************************************
-- Plugin Bindings
-- *************************************************************************************

-- Packer
key_mapper("n", "<Leader>ps", ":PackerSync <CR>")
key_mapper("n", "<Leader>pi", ":PackerInstall <CR>")
key_mapper("n", "<leader>pu", ":PackerUpdate <CR>")

-- Bufferline
key_mapper("n", "<TAB>", ":BufferLineCycleNext<CR>")
key_mapper("n", "<S-TAB>", ":BufferLineCyclePrev<CR>")

-- Codeium
key_mapper("n", "<leader>ce", ":Codeium EnableBuffer<CR>")
key_mapper("n", "<leader>ce", ":Codeium DisableBuffer<CR>")
vim.keymap.set("i", "<C-g>", function()
	return vim.fn["codeium#Accept"]()
end, { expr = true })
vim.keymap.set("i", "<c-;>", function()
	return vim.fn["codeium#CycleCompletions"](1)
end, { expr = true })
vim.keymap.set("i", "<c-,>", function()
	return vim.fn["codeium#CycleCompletions"](-1)
end, { expr = true })
vim.keymap.set("i", "<c-x>", function()
	return vim.fn["codeium#Clear"]()
end, { expr = true })

-- comment
key_mapper("n", "<leader>/", ":CommentToggle<CR>")
key_mapper("v", "<leader>/", ":CommentToggle<CR>")

-- FTerm
key_mapper("n", "<leader>t", '<CMD>lua require("FTerm").toggle()<CR>')
key_mapper("t", "<leader>t", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- cmp
key_mapper("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
key_mapper("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>")
key_mapper("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
key_mapper("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
key_mapper("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
key_mapper("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
key_mapper("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
key_mapper("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
key_mapper("n", "<space>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
key_mapper("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
key_mapper("n", "<Leader>E", "<cmd>lua vim.diagnostic.open_float()<CR>")
key_mapper("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
key_mapper("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
key_mapper("n", "<space>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

-- Nvim Tree Toggle
key_mapper("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
key_mapper("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")
key_mapper("n", "<leader>fb", ":Telescope file_browser<CR>")
key_mapper("n", "<leader>fl", ":Telescope live_grep<CR>")
key_mapper("n", "<leader>bb", ":Telescope buffers theme=dropdown<CR>")
key_mapper("n", "<leader>fh", ":Telescope help_tags<CR>")
key_mapper("n", "<leader>fg", ":Telescope git_files<CR>")
key_mapper("n", "<leader>fq", ":Telescope quickfix<CR>")
key_mapper("n", "<leader>fx", ":Telescope git_status<cr>")
key_mapper("n", "<leader>fc", ":Telescope git_commits<cr>")
key_mapper("n", "<leader>fgw", ":Telescope grep_string<cr>")
key_mapper("n", "<leader>fp", ":Telescope packer<CR>")
key_mapper("n", "<leader>fs", ":Telescope possession list theme=dropdown<CR>")
key_mapper("n", "<leader>fr", ":Telescope oldfiles <CR>")
key_mapper("n", "<leader>fa", ":Telescope aerial theme=dropdown<CR>")

-- Toggle Markdown Preview
key_mapper("n", "<leader>md", ":MarkdownPreviewToggle<CR>")

-- TrueZen
key_mapper("n", "<leader>tz", ":TZAtaraxis <CR>")

-- Which-Key
key_mapper("n", "<C-h>", ":WhichKey<CR>")
