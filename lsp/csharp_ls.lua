vim.lsp.config["csharp_ls"] = {
  cmd = { "csharp-ls" },
  filetypes = { "cs" },
  init_options = {
    enableCodeActions = true,
  },
}
