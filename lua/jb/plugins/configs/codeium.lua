return {
    "Exafunction/codeium.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
   },
    config = function()
        require("codeium").setup({
        })
    end
}
