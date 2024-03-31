local M = {}

-- Remap leader and local leader to <Space>
-- api.nvim_set_keymap("", "<Space>", "<Nop>", { noremap = true, silent = true })

M.setup = function(args)
  vim.cmd('hi Normal ctermbg=NONE guibg=NONE')
  vim.cmd('hi NonText ctermbg=NONE guibg=NONE')
  vim.cmd('hi EndOfBuffer ctermfg=NONE guibg=NONE')
  vim.keymap.set("", "<Space>", "<Nop>", { noremap = true, silent = true })
  vim.g.mapleader = " "
  vim.api.nvim_set_keymap("v", "<C-c>", '"+y<CR>', { silent = true })
  vim.api.nvim_set_keymap("n", "<C-v>", '"+p<CR>', { silent = true })
  vim.api.nvim_set_keymap("v", "<C-v>", '"+p<CR>', { silent = true })
  vim.api.nvim_set_keymap("i", "<C-v>", '<Esc>"+p<CR>', { silent = true })
  vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", { silent = true })
  vim.api.nvim_set_keymap("i", "<C-s>", "<Esc>:w<CR>", { silent = true })
  vim.api.nvim_set_keymap("n", "+", "<c-w>5>", { silent = true })
  vim.api.nvim_set_keymap("n", "-", "<c-w>5<", { silent = true })
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M

