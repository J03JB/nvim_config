return {}
-- return {
--     "sourcegraph/sg.nvim",

--     config = function ()
--         require("sg").setup({
--          on_attach = require("freesec.plugins.lsp.lspconfig").on_attach,
--             enable_cody = true,
--         })
--     end,

--     vim.keymap.set("n", "<leader>ss", "<cmd>lua require('sg.extensions.telescope').fuzzy_search_results()<CR>"),
--     -- print hello world function

--     -- Toggle cody chat
--     vim.keymap.set("n", "<space>cc", function()
--         require("sg.cody.commands").toggle()
--     end),

--     vim.keymap.set("n", "<space>cn", function()
--         local name = vim.fn.input "chat name: "
--         require("sg.cody.commands").chat(name)
--     end),
--     vim.keymap.set("v", "<space>a", ":CodyContext<CR>"),
--     vim.keymap.set("v", "<space>e", ":CodyExplain<CR>"),

--     vim.keymap.set("n", "<space>ss", function()
--         require("sg.extensions.telescope").fuzzy_search_results()
--     end),

-- }
-- --     local ok, msg = pcall(require, "sg")
-- --         if not ok then
-- --         print("sg failed to load with:", msg)
-- --     return
-- -- end

