--[=[
# DEPENDENCY
- [ripgrep](github.com/BurntSushi/ripgrep) for live_grep continuación
--]=]

local M = {}

M.plugin = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
  },
  event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local safe_require = require("rin.utils.safe_require")
  local ok_telescope, telescope = safe_require("telescope")

  if not ok_telescope then
    return
  end

  telescope.setup({
    defaults = {
      prompt_prefix = " 什",
      selection_caret = " ",
      vimgrep_arguments = {
        'rg',
        '--no-heading',
        '--with-filename',
        '--line-number',
        '--column',
        '--smart-case',
        '--hidden',
        '--trim',
      },
    },
    pickers = {
        find_files = {
            find_command = {"rg", "--files", "--hidden", "--glob", "!**/.git/*", "--glob", "!**/node_modules/*"},
        }
    },
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,

      }
    }
  })
  telescope.load_extension("fzy_native")

  local keymap = require("rin.utils.keymap").keymap

  keymap("n", "<leader>ff", ":Telescope find_files hidden=true no_ignore=true<CR>")
  keymap("n", "<leader>ft", ":Telescope git_files<CR>")
  keymap("n", "<leader>fg", ":Telescope live_grep<CR>")
  keymap("n", "<leader>fb", ":Telescope buffers<CR>")
  keymap("n", "<leader>fh", ":Telescope oldfiles<CR>")
  keymap("n", "<leader>fm", ":Telescope marks<CR>")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
