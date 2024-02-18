return {
'Mofiqul/vscode.nvim',
  lazy = false,
  priority = 1000,
  config = function()
    require('vscode').setup({
      italic_comments = true, -- Set italic format to comments
     })
     vim.cmd([[colorscheme vscode]]) -- Set theme
  end,
}

