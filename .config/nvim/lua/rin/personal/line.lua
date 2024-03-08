local M = {}

M.setup = function()
  -- # Line

  --vim.cmd("set relativenumber")
  vim.cmd("set number")
  vim.cmd("set nowrap")
  vim.cmd("set cursorline")
  vim.cmd("set title")
  vim.cmd("set ruler")
  vim.cmd("set timeoutlen=1000")

  vim.opt.list = true
  vim.opt.listchars = {
    -- tab = "→ ",
    --lead = "·",
    trail = "·",
    -- eol = "↵",
  }

  -- # Line manipulation

  local keymap = require("rin.utils.keymap").keymap

  -- # Move Line

  -- keymap("n", "<A-k>", ":move -2<CR>")
  keymap('v', 'J', ":m '>+1<CR>gv=gv")
  keymap('v', 'K', ":m '<-2<CR>gv=gv")

  -- # Duplicate Line

  keymap("n", "<A-J>", ":copy .<CR>")
  keymap("n", "<A-K>", ":copy .<CR>:move -2<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
