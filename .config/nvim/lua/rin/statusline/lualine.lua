local M = {}

M.plugin = {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-lua/lsp-status.nvim",
  },
  -- event = "VeryLazy",
  config = function()
    M.setup()
  end,
}

M.setup = function()
  local navic = require "nvim-navic"
  local safe_require = require("rin.utils.safe_require")
  local ok_lualine, lualine = safe_require("lualine")
  local ok_lsp_status, lsp_status = safe_require("lsp-status")

  if not (ok_lualine and ok_lsp_status) then
    return
  end

  lsp_status.register_progress()
  lsp_status.config({
    status_symbol = "",
    show_filename = true,
    diagnostics = true,
  })
  local function get_relative_line_num(ctx_node_line_num)
    local cursor_line_num = vim.fn.line "."
    local num_folded_lines = 0

    -- Find all folds between the context node and the cursor
    local current_line = ctx_node_line_num
    while current_line < cursor_line_num do
      local fold_end = vim.fn.foldclosedend(current_line)
      if fold_end == -1 then
        current_line = current_line + 1
      else
        num_folded_lines = num_folded_lines + fold_end - current_line
        current_line = fold_end + 1
      end
    end
    return cursor_line_num - ctx_node_line_num - num_folded_lines
  end

  local function get_custom_location()
    local data = navic.get_data() or {}
    local context = {}
    for _, d in ipairs(data) do
      local line_num = d.scope["start"].line
      if vim.o.relativenumber then
        line_num = get_relative_line_num(line_num)
      end
      table.insert(context, d.name .. "[" .. line_num .. "]")
    end
    if vim.tbl_count(context) > 0 then
      return " " ..">".. " " .. table.concat(context, " " ..">".. " ")
    end
    return ""
  end

  local function LSP()
    local msg = lsp_status.status()
    local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
    local clients = vim.lsp.get_active_clients()
    if next(clients) == nil then
      return msg
    end
    local lsp_clients = ""
    for _, client in ipairs(clients) do
      local filetypes = client.config.filetypes
      if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
        lsp_clients = lsp_clients .. " " .. client.name .. " "
      end
    end
    return lsp_clients .. msg
  end

  local setup_winbar = {
    options = {
      globalstatus = true,
      disabled_filetypes = {
        statusline = {
        },
        winbar = {
          "dap-repl",
        },
      },
    },
    sections = {
      lualine_a = {
        {
          "mode",
          separator = {
            left = "",
            right = "",
          },
        },
      },
      lualine_b = {
        {
          "branch",
          icon = "שׂ",
          separator = {
            right = "",
          },
        },
      },
      lualine_c = {
        {
          LSP,
          separator = "",
        },
      },
      lualine_x = {
        {
          require("rin.personal.tab").statusline,
          padding = 0,
        },
      },
      lualine_y = {
        "progress"
      },
      lualine_z = {
        "location"
      },
    },
    winbar = {
      lualine_a = {
        {
          "filename",
          path = 1,
          symbols = {
            modified = " 洛",
            readonly = " ",
            unnamed = "NO NAME",
          },
        },
      },
      lualine_b = {
        get_custom_location,
      },
      lualine_x = {
        {
          "diagnostics",
          always_visible = true,
          separator = "",
        },
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
          separator = "",
        },
        {
          "filetype",
        },
      },
      lualine_y = {
      },
      lualine_z = {
      },
    },
    inactive_winbar = {
      lualine_a = {
        {
          "filename",
          path = 1,
          symbols = {
            modified = " 洛",
            readonly = " ",
            unnamed = "NO NAME",
          },
        },
      },
      lualine_b = {
      },
      lualine_c = {
      },
      lualine_x = {
      },
      lualine_y = {
      },
      lualine_z = {
        {
          "diagnostics",
          always_visible = false,
          separator = "",
        },
        {
          "diff",
          symbols = {
            added = " ",
            modified = " ",
            removed = " ",
          },
          separator = "",
        },
        {
          "filetype",
        },
      },
    }
  }

  lualine.setup(setup_winbar)

  vim.cmd("set noshowmode")
end

if not pcall(debug.getlocal, 4, 1) then
  M.setup()
end

return M
