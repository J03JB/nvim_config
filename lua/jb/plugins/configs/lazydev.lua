return {
  "folke/lazydev.nvim",
  ft = "lua", -- only load on lua files
  opts = {
    library = {
      -- Library paths can be absolute
      "~/Dev/plugins/",
      -- Only load luvit types when the `vim.uv` word is found
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      -- Load the wezterm types when the `wezterm` module is required
      -- Needs `justinsgithub/wezterm-types` to be installed
      -- { path = "wezterm-types", mods = { "wezterm" } },
    },
    -- always enable unless `vim.g.lazydev_enabled = false`
    -- This is the default
    enabled = function(root_dir)
      return vim.g.lazydev_enabled == nil and true or vim.g.lazydev_enabled
    end,
    -- disable when a .luarc.json file is found
    -- enabled = function(root_dir)
      -- return not vim.uv.fs_stat(root_dir .. "/.luarc.json")
    -- end,
  },
}
