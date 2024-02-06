-- if true then return {} end
return {
    "akinsho/bufferline.nvim",
    enabled = false,
    version = "*",
    dependencies = { "nvim-tree/nvim-web-devicons" },

    opts = {
        options = {
            themable = true,
            numbers = function(opts)
                return string.format("%s", opts.raise(opts.ordinal))
            end,
            separator_style = "thick",
            -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
            offsets = {
                {
                    filetype = "NvimTree",
                    text = function()
                        return vim.fn.getcwd()
                    end,
                    highlight = "Directory",
                    text_align = "left",
                },
            },
        },
    },
    -- keymaps
    vim.keymap.set("n", "<TAB>", ":BufferLineCycleNext<CR>"),
    vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>"),
    vim.keymap.set("n", "<leader>bd", ":bdelete<CR>"),
}
