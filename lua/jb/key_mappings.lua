--###################################################################################
--       __  __
--      /  |/  /____ _ ____   ____   (_)____   ____ _ _____
--     / /|_/ // __ `// __ \ / __ \ / // __ \ / __ `// ___/
--    / /  / // /_/ // /_/ // /_/ // // / / // /_/ /(__  )
--   /_/  /_/ \__,_// .___// .___//_//_/ /_/ \__, //____/
--                 /_/    /_/               /____/
--
-- ###################################################################################

local map = require("jb.utils").map

-- Map space to leader
vim.g.mapleader = " "

-- ***********************************************************************************
-- Vim Key Bindings
-- ***********************************************************************************

map("n", "rw",         "viwpyiw")             -- replace a word with yanked text
map("n", "<c-s>",      ":w<cr>")              -- (for old times sake.)
map("n", "<BS>",       "ciw")                 -- <BS> to change word in normal mode
map("n", "Y",          "yg$")                 -- Copy to end of line from current position
map("n", "<leader>yb", "<cmd>%yank<cr>")      -- Copy entire buffer.
map("n", "<leader>bd", "<cmd>bdelete<CR>")    -- close/remove buffer
map("n", "<leader>w",  "g~iw")                -- toggle capitalisation
map("n", "<leader>O",  "moO<ESC>")            -- insert line above
map("n", "<leader>o",  "moo<ESC>")            -- insert line below
map("n", "<leader>h",  ":nohlsearch<CR>")     -- Clear highlights
map("n", "J",          ":m+<cr>")             -- move line up
map("n", "<leader>x",  "<cmd>!chmod +x %<CR>")-- make file executable
map("n", "U",          "<nop>")               -- unmap 'U'
map("n", "<leader>y",  [["+y]])               -- copy to system clipboard
map("n", "<leader>Y",  [["+Y]])               -- copy line to system clipboard
map("n", "<C-h>",      "<C-w>h")              -- ctrl + h to go to left pane
map("n", "H",          "^")                   -- H to go to start of line
map("n", "L",          "$")                   -- L to go to end of line
map("n", "Q",          "@qj")                 -- Q to repeat macro and move down a line
map("n", "[b",         ":bprev<CR>")          -- go to previous buffer
map("n", "]b",         ":bnext<CR>")          -- go to next buffer
map("n", "<C-k>",      "<cmd>cprev<CR>zz")    -- go to previous item in quickfix
map("n", "<leader>k",  "<cmd>lnext<CR>zz")    -- go to next item in loclist
map("n", "<leader>j",  "<cmd>lprev<CR>zz")    -- go to previous item in loclist
map("n", "<C-j>",      "<cmd>cnext<CR>zz")    -- go to next item in quickfix
map("n", "<C-d>",      "<C-d>zz")             -- page down and center
map("n", "<C-u>",      "<C-u>zz")             -- page up and center
map("n", "<leader>xp", ":call setreg('+', getreg('@'))<CR>") -- copy paste register to system clipboard
map("n", "<F9>",       ":lcd %:p:h<CR>", { silent = false }) -- change to cwd
map("n", "<leader>/",  ":normal gcc<CR>")         -- comment line in normal mode

map("i", "<c-j>",      "<esc>ji")             -- ctrl + j to down a line in insert mode
map("i", "<c-k>",      "<esc>ki")             -- ctrl + k to move up a line in insert mode
map("i", "<c-h>",      "<esc>i")              -- ctrl + h to move left in insert mode
map("i", "<c-l>",      "<esc>la")             -- ctrl + l to move right in insert mode
map("i", "jk",         "<Esc>")               -- "jk" as escape key in insert mode
map("i", "<C-BS>",     "<Esc>cvb")            -- Ctrl + backspace to delete word (insert mode)
map("i", "<A-;>",      "<Esc>miA;<Esc>`ii")   -- insert semicolon at the end of line
map("i", "…",          "<Esc>miA;<Esc>`ii")   -- mac keymap for above.

map("v", "H",          "^")                   -- H to go to start of line in visual mode
map("v", "L",          "$")                   -- L to go to end of line in visual mode
map("v", ">",          ">gv")                 -- better indentation
map("v", "<",          "<gv")                 -- better indentation
map("v", "J",          ":move '>+1<CR>gv=gv") -- Move selected line / block of text down in visual mode
map("v", "K",          ":move '<-2<CR>gv=gv") -- Move selected line / block of text up in visual mode
map("x", "<leader>p",          '"_dP')                -- replace selected text in visual mode. sends to blackhole.
map("x", "Q",          ":norm @q<CR>")        -- Q in visual mode to repeat macro
map("x", "<leader>y",  [["+y]])               -- copy to system clipboard in visual mode
map("x", "<leader>/",  ":normal gcc<CR>")     -- comment line in visual mode


-- Search and replace word under cursor
map("n", "<leader>s",  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { silent = false })
-- Same but for 'big word'
map("n", "<leader>S",  [[:%s/\<<C-r><C-a>\>/<C-r><C-a>/gI<Left><Left><Left>]], { silent = false })

-- Don't yank to register if line is empty
vim.keymap.set("n", "dd", function()
	if vim.api.nvim_get_current_line():match("^%s*$") then
		return '"_dd'
	else
		return "dd"
	end
end, { expr = true })

