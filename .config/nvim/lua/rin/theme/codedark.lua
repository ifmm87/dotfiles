local M = {}

M.plugin = {
  "ifmm87/vim-code-dark",
  name = "vim-code-dark",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  vim.cmd("colorscheme codedark")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
