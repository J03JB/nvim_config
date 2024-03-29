return {

	"terrortylor/nvim-comment",

	config = function()
		require("nvim_comment").setup({
			-- Linters prefer comment and line to have a space in between markers
			marker_padding = true,
			-- should comment out empty or whitespace only lines
			comment_empty = false,
			-- trim empty comment whitespace
			comment_empty_trim_whitespace = true,
			-- Visual/Operator mapping left hand side
			operator_mapping = "gc",
			-- text object mapping, comment chunk,,
			comment_chunk_text_object = "ic",
			-- Hook function to call before commenting takes place
			hook = function()
				require("ts_context_commentstring").update_commentstring()
			end,
		})
		-- keymaps
		local map = require("freesec.utils").map

		map("n", "<leader>/", ":CommentToggle<CR>")
		map("v", "<leader>/", ":CommentToggle<CR>")
	end,
}
