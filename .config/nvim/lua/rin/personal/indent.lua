local M = {}

M.setup = function(args)
  vim.cmd("set tabstop=4")
  vim.cmd("set softtabstop=4")
  vim.cmd("set shiftwidth=4")
  vim.cmd("set expandtab")
  vim.cmd("set autoindent")
  vim.cmd("set copyindent")
  vim.cmd("set smartindent")
  vim.cmd("set signcolumn")

  local keymap = require("rin.utils.keymap").keymap
  -- keymap("n", "<A-k>", ":move -2<CR>")
  keymap('v', '<s-tab>', "<gv")
  keymap('n', '<s-tab>', "<gv")
  keymap('v', '<tab>', ">gv")
  keymap('n', '<tab>', ">gv")

  -- # Duplicate Line

  keymap("n", "<A-J>", ":copy .<CR>")
  keymap("n", "<A-K>", ":copy .<CR>:move -2<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
