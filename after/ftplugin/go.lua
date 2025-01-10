local opt = vim.opt_local

opt.expandtab = false
opt.tabstop = 4
opt.shiftwidth = 4

vim.keymap.set("n", "<space>td", function()
  require("dap-go").debug_test()
end, { buffer = 0 })
