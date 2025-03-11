local M = {

    "ThePrimeagen/harpoon",
    event = "VeryLazy",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },

}

function M. config()
    local harpoon = require("harpoon")

    harpoon:setup({
        settings = {
            save_on_toggle = true,
            sync_on_ui_close = true,
        },
    })

    harpoon:extend({
        UI_CREATE = function(cx)
            vim.keymap.set("n", "<C-v>", function()
                harpoon.ui:select_menu_item({ vsplit = true })
            end, { buffer = cx.bufnr })

            vim.keymap.set("n", "<C-x>", function()
                harpoon.ui:select_menu_item({ split = true })
            end, { buffer = cx.bufnr })

            vim.keymap.set("n", "<C-t>", function()
                harpoon.ui:select_menu_item({ tabedit = true })
            end, { buffer = cx.bufnr })
        end,
    })

    local toggle_opts = {
        border = "rounded",
        title_pos = "center",
        ui_width_ratio = 0.40,
    }

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() vim.notify("Added to Harpoon") end, { desc = "Harpoon add file to list"})
    vim.keymap.set("n", "<C-l>", function() harpoon.ui:toggle_quick_menu(harpoon:list(), toggle_opts) end, { desc = "Harpoon open list"})

    for _, idx in ipairs({ 1, 2, 3, 4 }) do
		vim.keymap.set("n", string.format("<leader>%d", idx), function()
			harpoon:list():select(idx)
		end, { desc = string.format("Harpoon file: ", idx) })
    end

    -- not sure on the keys yet... 
    vim.keymap.set("n", "<C-1>", function() harpoon:list():replace_at(1) end, { desc = "Harpoon file: 1"})
    vim.keymap.set("n", "<C-2>", function() harpoon:list():replace_at(2) end, { desc = "Harpoon file: 2"})
    vim.keymap.set("n", "<C-3>", function() harpoon:list():replace_at(3) end, { desc = "Harpoon file: 3"})
    vim.keymap.set("n", "<C-4>", function() harpoon:list():replace_at(4) end, { desc = "Harpoon file: 4"})

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<M-p>", function() harpoon:list():prev() end, { desc = "Harpoon previous file"})
    vim.keymap.set("n", "<M-n>", function() harpoon:list():next() end, { desc = "Harpoon next file"} )

end


return M
