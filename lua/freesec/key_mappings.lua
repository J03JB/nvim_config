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

-- 'qq' to record instead of 'q'
key_mapper("n", "qq", "q")
key_mapper("n", "q", "<nop>")

-- Faster scrolling
key_mapper("n", "<c-DOWN>", "3<c-e>")
key_mapper("n", "<c-UP>", "3<c-y>")

-- whenever you're in parentheses, you can simple invoke dp or cp to wipe it's contents (same for brackets, but db or cb).
key_mapper("o", "p", 'i"')
key_mapper("o", "b", "i(|")

-- pageup/pagedn only half page at a time
key_mapper("n", "<PageUp>", "<C-U>")
key_mapper("n", "<PageDown>", "<C-D>")

-- Reselect the text that has just been pasted, see also https://stackoverflow.com/a/4317090/6064933.
key_mapper("n", "<leader>v", "printf('`[%s`]', getregtype()[0])")

-- "greatest remap ever" thePrimagen
key_mapper("x", "<leader>p", '"_dP')

-- next greatest remap: asbjornHaland
key_mapper("n", "<leader>y", '"+y')
key_mapper("x", "<leader>y", '"+y')
key_mapper("n", "<leader>Y", '"+Y')

--- toggle capitalisation
key_mapper("n", "<leader>w", "g~iw")
key_mapper("v", "<leader>w", "~")

-- Window Navigation
key_mapper("n", "<C-h>", "<C-w>h")
key_mapper("n", "<C-l>", "<C-w>l")

-- easier navigation
key_mapper("n", "E", "5e")
key_mapper("n", "B", "5b")
key_mapper("n", "H", "^")
key_mapper("v", "H", "^")
key_mapper("n", "L", "$")
key_mapper("v", "L", "$")

-- Move line up or down
key_mapper("n", "<C-k>", ":m-2<cr>")
key_mapper("n", "<C-j>", ":m+<cr>")

-- ditch those arrow keys --> move up and down in insert mode with hjkl by simply holding control
key_mapper("i", "<c-j>", "<esc>ji")
key_mapper("i", "<c-k>", "<esc>ki")
key_mapper("i", "<c-h>", "<esc>i")
key_mapper("i", "<c-l>", "<esc>la")

-- replace a word with yanked text
key_mapper("n", "rw", "viwpyiw")

-- replace till the end of line with yanked text
key_mapper("n", "rl", 'Pl"_D')

-- Clear highlights
key_mapper("n", "<leader>h", ":noh<CR>")

-- insert new line above without enerting insert mode.
key_mapper("n", "<leader>o", "moO<ESC>k ")
key_mapper("n", "<leader>O", "moo<ESC>k")

-- Better indentaion
key_mapper("v", ">", ">gv")
key_mapper("v", "<", "<gv")

-- Copy to end of line from current position
key_mapper("n", "Y", "yg$")

-- Copy entire buffer.
key_mapper("n", "<leader>yb", "<cmd>%yank<cr>")

-- Move selected line / block of text in visual mode
key_mapper("v", "J", ":move '>+1<CR>gv=gv")
key_mapper("v", "K", ":move '<-2<CR>gv=gv")

-- jj as Escape key
key_mapper("i", "jk", "<Esc>")

-- space + x to make file executable
key_mapper("n", "<leader>x", "<cmd>!chmod +x %<CR>")

-- insert semicolon in the end
key_mapper("i", "<A-;>", "<Esc>miA;<Esc>`ii")

-- Toggle spell checking
key_mapper("n", "<F11>", "<cmd>set spell!<cr>")
key_mapper("i", "<F11>", "<c-o><cmd>set spell!<cr>")

key_mapper("n", "Q", "<nop>")
key_mapper("n", "U", "<nop>")

-- *************************************************************************************
-- Plugin Bindings
-- *************************************************************************************

-- Lazy.nvim
key_mapper("n", "<Leader>ls", ":Lazy sync <CR>")

-- Bufferline
key_mapper("n", "<A-]>", ":BufferLineCycleNext<CR>")
key_mapper("n", "<A-[>", ":BufferLineCyclePrev<CR>")
key_mapper("n", "<TAB>", ":BufferLineCycleNext<CR>")
key_mapper("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
-- Kill buffer with leader bd
key_mapper("n", "<leader>bd", ":bdelete<CR>")

-- Comment
key_mapper("n", "<leader>/", ":CommentToggle<CR>")
key_mapper("v", "<leader>/", ":CommentToggle<CR>")

-- nvim-dap keymappings
key_mapper("n", "<F5>", [[:lua require'dap'.continue()<CR>]])
key_mapper("n", "<C-b>", [[:lua require'dap'.toggle_breakpoint()<CR>]])
key_mapper("n", "<C-c>", [[:lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint Condition: '))<CR>]])
key_mapper("n", "<C-l>", [[:lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log Point Msg: '))<CR>]])
key_mapper("n", "<F10>", [[:lua require'dap'.step_over()<CR>]])
-- key_mapper("n", "<F11>", [[:lua require'dap'.step_into()<CR>]])
key_mapper("n", "<F12>", [[:lua require'dap'.step_out()<CR>]])
key_mapper("n", "<F6>", [[:lua require'dap'.repl.open()<CR>]])
key_mapper("n", "dl", [[:lua require'dap'.run_last()<CR>]])

-- FTerm
key_mapper("n", "<leader>t", '<CMD>lua require("FTerm").toggle()<CR>')
key_mapper("t", "<leader>t", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')

-- Fugitive
key_mapper("n", "<leader>gs", "<CMD>Git<CR>")

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

-- Tagbar
key_mapper("n", "<F8>", ":TagbarToggle<CR>")

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

-- Toggle Markdown Preview
key_mapper("n", "<leader>md", ":MarkdownPreviewToggle<CR>")

-- TrueZen
key_mapper("n", "<leader>tz", ":TZAtaraxis <CR>")

-- Which-Key
key_mapper("n", "<C-h>", ":WhichKey<CR>")
