return {
  "nvim-lualine/lualine.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons"
  },
  opts = {
    options = {
      globalstatus = true, -- Don't break the bar in splits
    },
    sections = {
      lualine_c = {
        {
          "filename", file_status = true, path = 1, -- Show relative path to file
        },
      },

    },
  },
}

