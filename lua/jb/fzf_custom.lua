local M = {}

function M.edit_nvim()
	local dir = "~/.config/nvim"
	require("fzf-lua").files({
        prompt = "Nvim Config> ",
        cmd = "rg --files " .. dir,
        cwd = dir,
    })
end

vim.keymap.set("n", "<leader>ev", '<cmd>lua require"jb.fzf_custom".testies()<cr>')
-- { "<leader>ev", "<cmd>lua require'jb.fzf_custom'.edit_nvim()<cr>",       desc = "Fzf Nvim Config" },

return M
