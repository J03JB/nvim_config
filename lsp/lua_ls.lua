vim.lsp.config["lua_ls"] = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        -- library = {
        -- 	[vim.fn.expand("$VIMRUNTIME/lua")] = true,
        --       [vim.fn.expand("$VIMRUNTIME/${3rd}/luv/library")] = true
        --
        -- },
        -- checkThirdParty = false,
      },
    },
  },
}
