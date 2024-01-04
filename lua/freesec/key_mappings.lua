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
map("i", "<C-BS>",     "<Esc>cvb")            -- Ctrl + backspace to delete word (insert mode)
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
map("v", "J",          ":move '>+1<CR>gv=gv") -- Move selected line / block of text down in visual mode
map("v", "K",          ":move '<-2<CR>gv=gv") -- Move selected line / block of text up in visual mode
map("i", "jk",         "<Esc>")               -- "jk" as escape key in insert mode
map("i", "<C-c>",      "<Esc>")               -- ctrl + c as escape key in insert mode
map("n", "<leader>x",  "<cmd>!chmod +x %<CR>")-- make file executable
map("n", "U",          "<nop>")               -- unmap 'U'
map("x", "p",          '"_dP')                -- replace selected text in visual mode. sends to blackhole.
map("i", "<A-;>",      "<Esc>miA;<Esc>`ii")   -- insert semicolon at the end of line
map("i", "…",          "<Esc>miA;<Esc>`ii")   -- mac keymap for above.
map("n", "<leader>y",  '"+y')                 -- copy to system clipboard
map("x", "<leader>y",  '"+y')                 -- copy to system clipboard in visual mode
map("n", "<leader>Y",  '"+Y')                 -- copy line to system clipboard
map("n", "<C-h>",      "<C-w>h")              -- ctrl + h to go to left pane
-- map("n", "<C-l>",      "<C-w>l")              -- ctrl + l to go to right pane
map("n", "H",          "^")                   -- H to go to start of line
map("v", "H",          "^")                   -- H to go to start of line in visual mode
map("n", "L",          "$")                   -- L to go to end of line
map("v", "L",          "$")                   -- L to go to end of line in visual mode
map("v", ">",          ">gv")                 -- better indentation
map("v", "<",          "<gv")                 -- better indentation
map("i", "<c-j>",      "<esc>ji")             -- ctrl + j to down a line in insert mode
map("i", "<c-k>",      "<esc>ki")             -- ctrl + k to move up a line in insert mode
map("i", "<c-h>",      "<esc>i")              -- ctrl + h to move left in insert mode
map("i", "<c-l>",      "<esc>la")             -- ctrl + l to move right in insert mode
map("n", "Q",          "@qj")                 -- Q to repeat macro and move down a line
map("x", "Q",          ":norm @q<CR>")        -- Q in visual mode to repeat macro

map("n", "<F9>",       ":lcd %:p:h<CR>", { silent = false }) -- change to cwd

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

-- Bufferline
map("n", "<TAB>",      ":BufferLineCycleNext<CR>")
map("n", "<S-Tab>",    ":BufferLineCyclePrev<CR>")
map("n", "<leader>bd", ":bdelete<CR>")

-- Comment
map("n", "<leader>/",  ":CommentToggle<CR>")
map("v", "<leader>/",  ":CommentToggle<CR>")

-- Fugitive
map("n", "<leader>gs", "<CMD>Git<CR>")

-- Markdown Preview
map("n", "<leader>md", "<cmd>MarkdownPreview<CR>")

-- Nvim Tree Toggle
map("n", "<leader>e",  ":NvimTreeToggle<CR>")

-- Telescope
map("n", "<leader>bb", ":Telescope buffers theme=dropdown<CR>")
map("n", "<leader>fb", ":Telescope current_buffer_fuzzy_find<CR>")
map("n", "<leader>fc", ":Telescope git_commits<cr>")
map("n", "<leader>fd", '<cmd>lua require"freesec.telescope-custom".dotfiles()<cr>')
map("n", "<leader>ff", ":Telescope find_files hidden=true<CR>")
map("n", "<leader>fg", ":Telescope git_files<CR>")
map("n", "<leader>fh", ":Telescope help_tags<CR>")
map("n", "<leader>fl", ":Telescope live_grep<CR>")
map("n", "<leader>fm", ":Telescope harpoon marks theme=dropdown<CR>")
map("n", "<leader>fp", ":Telescope find_files<CR>")
map("n", "<leader>fq", ":Telescope quickfix<CR>")
map("n", "<leader>fr", ":Telescope oldfiles <CR>")
map("n", "<leader>fx", ":Telescope git_status<cr>")
map("n", "<leader>fs", ":Telescope grep_string<cr>")
map("n", "<leader>lh", ":Telescope lazy<CR>")
map("n", "<leader>tr", ":Telescope resume<CR>")

-- TrueZen
map("n", "<leader>tz", ":TZAtaraxis <CR>")
