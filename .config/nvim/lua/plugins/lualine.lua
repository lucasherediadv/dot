-- Neovim statusline written in Lua

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = { globalstatus = true }, -- Don't break the bar in splits
    sections = {
      -- Show relative path to file
      lualine_c = { { "filename", file_status = true, path = 1 } },
      -- Notify in status line when plugins have updates
      lualine_x = { { require("lazy.status").updates, cond = require("lazy.status").has_updates, } }
    },
  },
}

