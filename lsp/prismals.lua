return {
  root_markers = { ".git", "package.json" },
  cmd = { "prisma-language-server", "--stdio" },
  filetypes = { "prisma" },
  settings = {
    prisma = {
      prismaFmtBinPath = "",
    },
  },
}
