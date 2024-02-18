return {
  'lewis6991/gitsigns.nvim',
  opts = {
    on_attach = function(bufnr)
      local gitsigns = require "gitsigns"
      vim.keymap.set("n", "<leader>ph", gitsigns.preview_hunk, {buffer = bufnr}, { desc = "Preview hunk"})
    end,
    max_file_length = 10000, -- Don't load if file size is > 10000
  },
}

