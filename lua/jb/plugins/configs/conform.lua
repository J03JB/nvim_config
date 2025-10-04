return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    formatters_by_ft = {
      cs = { "csharpier" },
      html = { "prettier" },
      lua = { "stylua" },
      python = { "autopep8", "black" },
      javascript = { { "prettierd", "prettier" } },
      json = { "jq" },
      yaml = { "yamlfmt" },
      go = { "gofumpt" },
      markdown = { "prettier", "markdownlint" },
    },
    -- Set up format-on-save
    -- format_on_save = { timeout_ms = 500, lsp_fallback = true },
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
      csharpier = {
        command = "dotnet-csharpier",
        args = { "--write-stdout" },
      },
    },
  },
  init = function()
    vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
  end,

  -- formatting for visual selection
  vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
      range = {
        start = { args.line1, 0 },
        ["end"] = { args.line2, end_line:len() },
      }
    end
    require("conform").format { async = true, lsp_fallback = true, range = range }
  end, { range = true }),

  -- Keymaps
  vim.keymap.set({ "n", "v" }, "<leader>F", ":Format<CR>", { desc = "Format" }),
}
