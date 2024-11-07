return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    require("gruvbox").setup({
      bold = false,
      italic = {
        strings = false,
        emphasis = false,
        comments = false,
        operators = false,
        folds = false,
      },
      contrast = "hard",
      palette_overrides = {
        dark0_hard = "#1a1c1d",
      },
    })
    vim.cmd([[colorscheme gruvbox]])
 end,
}
