return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      theme = "auto",
      globalstatus = true, -- Don't break the bar in splits
      icons_enabled = false, -- Disable icons
      component_separators = '|', -- Change default separator
      section_separators = '', -- Change default separator
    },
    sections = {
      -- Show relative path to file
      lualine_c = { { "filename", file_status = true, path = 1 } },
    },
  },
}

