local lsp = vim.lsp

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client:supports_method "textDocument/implementation" then
      vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = true })
    end
    if client:supports_method "textDocument/inlayHint" then
      vim.lsp.inlay_hint.enable(true)
    end
    if client:supports_method "textDocument/declaration" then
      vim.keymap.set("n", "grD", vim.lsp.buf.declaration, { buffer = true })
    end
    vim.keymap.set("n", "grd", vim.lsp.buf.definition, { buffer = true })
    vim.keymap.set("n", "ca", vim.lsp.buf.code_action, { buffer = true })
    vim.keymap.set("n", "]d", function()
      vim.diagnostic.jump { count = vim.v.count1, float = true }
    end, { desc = "Jump to the next diagnostic in the current buffer" })
    vim.keymap.set("n", "[d", function()
      vim.diagnostic.jump { count = vim.v.count - 1, float = true }
    end, { desc = "Jump to the previous diagnostic in the current buffer" })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

    if client.server_capabilities.documentHighlightProvider then
      vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
        buffer = args.buf,
        callback = vim.lsp.buf.document_highlight,
      })

      vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
        buffer = args.buf,
        callback = vim.lsp.buf.clear_references,
      })
    end
  end,
})

-- Diagnostic Settings
-- Change the Diagnostic symbols in the sign column (gutter)
-- local deez_icons = {
-- 	[vim.diagnostic.severity.ERROR] = " ",
-- 	[vim.diagnostic.severity.WARN] = " ",
-- 	[vim.diagnostic.severity.HINT] = " ",
-- 	[vim.diagnostic.severity.INFO] = " ",
-- }

-- Remove icons from statuscolumn
local deez_icons = {
  [vim.diagnostic.severity.ERROR] = "",
  [vim.diagnostic.severity.WARN] = "",
  [vim.diagnostic.severity.HINT] = "",
  [vim.diagnostic.severity.INFO] = "",
}

local number_hl = {
  [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
  [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
  [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
  [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
}
-- Apply diagnostics settings
vim.diagnostic.config {
  float = { border = vim.g.floating_window_border, source = "if_many", true },
  signs = { text = deez_icons, numhl = number_hl },
  virtual_text = true,
}

-- LSP setup
lsp.config("*", {
  capabilities = require("blink.cmp").get_lsp_capabilities(),
  root_markers = { ".git" },
})

-- Enable servers
local lsp_dir = vim.fn.stdpath "config" .. "/lsp"
local files = require("plenary.scandir").scan_dir(lsp_dir, { depth = 1 })

for _, file in ipairs(files) do
  local server_name = file:match "([^/]+)%.lua$"
  if server_name then
    lsp.enable(server_name)
  end
end
