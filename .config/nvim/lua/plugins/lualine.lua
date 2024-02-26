-- Neovim statusline written in Lua

return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    theme = "vscode", -- Enable colorscheme in lualine
    options = { globalstatus = true }, -- Don't break the bar in splits
  },
}

