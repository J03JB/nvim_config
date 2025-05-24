return {
  "cordx56/rustowl",
  version = "*", -- Latest stable version
  build = "cargo binstall rustowl",
  lazy = false,
  enabled = false,
  opts = {
    client = {
      on_attach = function(_, buffer)
        vim.keymap.set("n", "<leader>ro", function()
          require("rustowl").toggle(buffer)
        end, { buffer = buffer, desc = "Toggle RustOwl" })
      end,
    },
  },
}
