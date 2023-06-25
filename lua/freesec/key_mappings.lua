--###################################################################################
--       __  __
--      /  |/  /____ _ ____   ____   (_)____   ____ _ _____
--     / /|_/ // __ `// __ \ / __ \ / // __ \ / __ `// ___/
--    / /  / // /_/ // /_/ // /_/ // // / / // /_/ /(__  )
--   /_/  /_/ \__,_// .___// .___//_//_/ /_/ \__, //____/
--                 /_/    /_/               /____/
--
-- ###################################################################################

local map = require("freesec.utils").map

-- Map space to leader
vim.g.mapleader = " "

-- ***********************************************************************************
-- Vim Key Bindings
-- ***********************************************************************************

-- replace a word with yanked text
map("n", "rw", "viwpyiw")

-- Ctrl + backspace to delete word (insert mode)
map("i", "<C-BS>", "<Esc>cvb")

-- Ctrl + s to save. (for old times sake.)
map("n", "<c-s>", ":w<cr>")

-- <BS> to change word in normal mode
map("n", "<BS>", "ciw")

-- replace to the end of line with yanked text
map("n", "rl", 'Pl"_D')

-- "greatest remap ever" thePrimagen
map("x", "p", '"_dP')

--  next greatest remap: asbjornHaland
map("n", "<leader>y", '"+y')
map("x", "<leader>y", '"+y')
map("n", "<leader>Y", '"+Y')

-- Copy to end of line from current position
map("n", "Y", "yg$")

-- Copy entire buffer.
map("n", "<leader>yb", "<cmd>%yank<cr>")

--- toggle capitalisation
map("n", "<leader>w", "g~iw")
map("v", "<leader>w", "~")

-- Window Navigation
map("n", "<C-h>", "<C-w>h")
map("n", "<C-l>", "<C-w>l")

-- easier navigation
map("n", "H", "^")
map("v", "H", "^")
map("n", "L", "$")
map("v", "L", "$")

-- ditch those arrow keys --> move up and down in insert mode with hjkl by simply holding control
map("i", "<c-j>", "<esc>ji")
map("i", "<c-k>", "<esc>ki")
map("i", "<c-h>", "<esc>i")
map("i", "<c-l>", "<esc>la")

-- Clear highlights
map("n", "<leader>h", ":nohlsearch<CR>")

-- insert new line above without enerting insert mode.
map("n", "<leader>o", "moO<ESC>")
map("n", "<leader>O", "moo<ESC>k")

-- Better indentaion
map("v", ">", ">gv")
map("v", "<", "<gv")

-- Move line up or down
map("n", "<C-k>", ":m-2<cr>")
map("n", "<C-j>", ":m+<cr>")

-- Move selected line / block of text in visual mode
map("v", "J", ":move '>+1<CR>gv=gv")
map("v", "K", ":move '<-2<CR>gv=gv")

-- ctrl+c or jk as Escape key
map("i", "jk", "<Esc>")
map("i", "<C-c>", "<Esc>")

-- make file executable
map("n", "<leader>x", "<cmd>!chmod +x %<CR>")

-- insert semicolon at the end of line
map("i", "<A-;>", "<Esc>miA;<Esc>`ii")
map("i", "…", "<Esc>miA;<Esc>`ii") -- mac keymap.

-- could just use ctrl+j but meh.
map("i", "<C-CR>", "<Esc>o")

map("n", "U", "<nop>")

-- dd doesn't yank empty line to default register
vim.keymap.set("n", "dd", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end, { expr = true })

-- change to cwd
vim.keymap.set("n", "<leader><F9>", ":lcd %:p:h<CR>")

-- Search and replace word under cursor
map("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })

-- variable rename
map("n", "<leader>vrn", "<cmd>lua vim.lsp.buf.rename()<CR>")

-- *************************************************************************************
-- Plugin Bindings
-- *************************************************************************************

-- Lazy.nvim
map("n", "<Leader>ls", ":Lazy sync <CR>")

-- Bufferline
map("n", "<TAB>", ":BufferLineCycleNext<CR>")
map("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
map("n", "<leader>bd", ":bdelete<CR>")

-- Comment
map("n", "<leader>/", ":CommentToggle<CR>")
map("v", "<leader>/", ":CommentToggle<CR>")

-- nvim-dap keymappings
-- map("n", "<F5>", [[:lua require'dap'.continue()<CR>]])
-- map("n", "<C-b>", [[:lua require'dap'.toggle_breakpoint()<CR>]])
-- map("n", "<C-c>", [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]])
-- map("n", "<C-l>", [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>]])
-- map("n", "<F10>", [[:lua require'dap'.step_over()<CR>]])
-- -- map("n", "<F11>", [[:lua require'dap'.step_into()<CR>]])
-- map("n", "<F12>", [[:lua require'dap'.step_out()<CR>]])
-- map("n", "<F6>", [[:lua require'dap'.repl.open()<CR>]])
-- map("n", "dl", [[:lua require'dap'.run_last()<CR>]])

-- FTerm
map("n", "<leader>t", '<CMD>lua require("FTerm").toggle()<CR>')
map("t", "<leader>t", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
map("n", "<leader>tb", "<cmd> lua require('FTerm').scratch({ cmd = {'cargo', 'build', '--release'} })<CR>")
map("n", "<leader>tj", "<cmd> lua require('FTerm').run({'node', vim.api.nvim_get_current_buf()})<CR>")

-- Fzf-lua
map("n", "<c-P>", "<cmd>lua require('fzf-lua').files()<CR>")

-- Fugitive
map("n", "<leader>gs", "<CMD>Git<CR>")

-- cmp
map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>")
map("n", "gh", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>")
map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>")
map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>")
map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>")
map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>")
map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>")
map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>")
map("n", "<Leader>E", "<cmd>lua vim.diagnostic.open_float()<CR>")
map("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
map("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>")
map("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>")

-- Markdown Preview
map("n", "<leader>md", "<cmd>MarkdownPreview<CR>")

-- Nvim Tree Toggle
map("n", "<leader>e", ":NvimTreeToggle<CR>")

-- Telescope
map("n", "<leader>bb", ":Telescope buffers theme=dropdown<CR>")
map("n", "<leader>fc", ":Telescope git_commits<cr>")
map("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")
map("n", "<leader>fg", ":Telescope git_files<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")
map("n", "<leader>fl", ":Telescope live_grep<CR>")
map("n", "<leader>fm", ":Telescope harpoon marks theme=dropdown<CR>")
map("n", "<leader>fq", ":Telescope quickfix<CR>")
map("n", "<leader>fr", ":Telescope oldfiles <CR>")
-- map("n", "<leader>fs", ":Telescope possession list theme=dropdown<CR>")
map("n", "<leader>fx", ":Telescope git_status<cr>")
map("n", "<leader>fgw", ":Telescope grep_string<cr>")
map("n", "<leader>lh", ":Telescope lazy<CR>")

-- TrueZen
map("n", "<leader>tz", ":TZAtaraxis <CR>")
