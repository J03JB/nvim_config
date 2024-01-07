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

map("n", "rw",         "viwpyiw")             -- replace a word with yanked text
map("n", "<c-s>",      ":w<cr>")              -- Ctrl + s to save. (for old times sake.)
map("n", "<BS>",       "ciw")                 -- <BS> to change word in normal mode
map("n", "Y",          "yg$")                 -- Copy to end of line from current position
map("n", "<leader>yb", "<cmd>%yank<cr>")      -- Copy entire buffer.
map("n", "<leader>w",  "g~iw")                -- toggle capitalisation
map("n", "<leader>O",  "moO<ESC>")            -- insert line above
map("n", "<leader>o",  "moo<ESC>k")           -- insert line below
map("n", "<leader>h",  ":nohlsearch<CR>")     -- Clear highlights
map("n", "<C-k>",      ":m-2<cr>")            -- move line down
map("n", "<C-j>",      ":m+<cr>")             -- move line up
map("n", "<leader>x",  "<cmd>!chmod +x %<CR>")-- make file executable
map("n", "U",          "<nop>")               -- unmap 'U'
map("n", "<leader>y",  '"+y')                 -- copy to system clipboard
map("x", "<leader>y",  '"+y')                 -- copy to system clipboard in visual mode
map("n", "<leader>Y",  '"+Y')                 -- copy line to system clipboard
map("n", "<C-h>",      "<C-w>h")              -- ctrl + h to go to left pane
map("n", "<F9>",       ":lcd %:p:h<CR>", { silent = false }) -- change to cwd
map("n", "H",          "^")                   -- H to go to start of line
map("n", "L",          "$")                   -- L to go to end of line
map("n", "Q",          "@qj")                 -- Q to repeat macro and move down a line
map("x", "Q",          ":norm @q<CR>")        -- Q in visual mode to repeat macro
map("x", "p",          '"_dP')                -- replace selected text in visual mode. sends to blackhole.

map("i", "<c-j>",      "<esc>ji")             -- ctrl + j to down a line in insert mode
map("i", "<c-k>",      "<esc>ki")             -- ctrl + k to move up a line in insert mode
map("i", "<c-h>",      "<esc>i")              -- ctrl + h to move left in insert mode
map("i", "<c-l>",      "<esc>la")             -- ctrl + l to move right in insert mode
map("i", "jk",         "<Esc>")               -- "jk" as escape key in insert mode
map("i", "<C-c>",      "<Esc>")               -- ctrl + c as escape key in insert mode
map("i", "<C-BS>",     "<Esc>cvb")            -- Ctrl + backspace to delete word (insert mode)
map("i", "<A-;>",      "<Esc>miA;<Esc>`ii")   -- insert semicolon at the end of line
map("i", "…",          "<Esc>miA;<Esc>`ii")   -- mac keymap for above.

map("v", "H",          "^")                   -- H to go to start of line in visual mode
map("v", "L",          "$")                   -- L to go to end of line in visual mode
map("v", ">",          ">gv")                 -- better indentation
map("v", "<",          "<gv")                 -- better indentation
map("v", "J",          ":move '>+1<CR>gv=gv") -- Move selected line / block of text down in visual mode
map("v", "K",          ":move '<-2<CR>gv=gv") -- Move selected line / block of text up in visual mode


-- Search and replace word under cursor
map("n", "<leader>s",  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })

-- dd doesn't yank empty line to default register
vim.keymap.set("n", "dd", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end, { expr = true })

-- *************************************************************************************
-- Plugin Bindings
-- *************************************************************************************

-- Lazy.nvim
map("n", "<Leader>ls", ":Lazy sync <CR>")

-- Comment
map("n", "<leader>/",  ":CommentToggle<CR>")
map("v", "<leader>/",  ":CommentToggle<CR>")

-- Markdown Preview
map("n", "<leader>md", "<cmd>MarkdownPreview<CR>")

-- TrueZen
map("n", "<leader>tz", ":TZAtaraxis <CR>")
