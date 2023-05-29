local M = {}

M.plugin = {
"folke/zen-mode.nvim",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_zenmode, zenmode = safe_require("zen-mode")

  if not ok_zenmode then
    return
  end

  zenmode.setup({ })

local keymap = require("rin.utils.keymap").keymap
  keymap("n", "<leader>zm", ":ZenMode<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M

