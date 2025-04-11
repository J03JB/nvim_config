local paths_to_check = { "/", "/../" }
local is_godot_project = false
local godot_project_path = ""
local cwd = vim.fn.getcwd()

for key, value in pairs(paths_to_check) do
  if vim.uv.fs_stat(cwd .. value .. "project.godot") then
    is_godot_project = true
    godot_project_path = cwd .. value
    break
  end
end

local is_server_running = vim.uv.fs_stat(godot_project_path .. "/server.pipe")
if is_godot_project and not is_server_running then
  vim.fn.serverstart(godot_project_path .. "/server.pipe")
end

local port = os.getenv "GDScript_Port" or "6005"
local cmd = vim.lsp.rpc.connect("127.0.0.1", tonumber(port))

local lsp_config = {
  name = 'Godot',
  cmd = cmd,
  root_dir = vim.fs.dirname(vim.fs.find({ 'project.godot', '.git' }, { upward = true })[1]),
  capabilities = require("blink.cmp").get_lsp_capabilities(),
}

vim.api.nvim_create_autocmd("BufReadPost", {
  pattern = "*.gd",
  callback = function()
    if not vim.lsp.get_active_clients({name = 'Godot'})[1] then
      local client_id = vim.lsp.start(lsp_config)
      if client_id then
        vim.print("Connected to Godot LSP")
      end
    end
  end
})
