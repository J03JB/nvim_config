local lspconfig = require("lspconfig")
return {
        root_dir = lspconfig.util.root_pattern("package.json", "package-lock.json"),
        filetypes = {
          "typescript",
          "typescriptreact",
          "typescript.tsx",
          "javascript",
          "javascriptreact",
          "javascript.jsx"
        },
        single_file_support = true,
}
