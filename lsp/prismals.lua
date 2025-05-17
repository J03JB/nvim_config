vim.lsp.config["prismals"] = {
  root_markers = { ".git", "package.json" },
  cmd = { "prisma-language-server", "--stdio" },
  filetypes = { "prisma" },
  settings = {
    prisma = {
      prismaFmtBinPath = "",
    },
  },
}
