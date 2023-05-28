local M = {}

M.plugin = {
  "numToStr/Comment.nvim",
  event = "VeryLazy",
  config = function()
    M.setup()
  end
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_comment, comment = safe_require("Comment") -- < why has the same name to bufferline ?

  if not ok_comment then
    return
  end
  comment.setup()

end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
