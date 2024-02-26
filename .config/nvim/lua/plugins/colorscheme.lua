-- Neovim color scheme inspired by Dark theme in Visual Studio Code

return {
'Mofiqul/vscode.nvim',
  lazy = false, -- Make sure to load this during startup
  priority = 1000, -- Make sure to load this before all the other start plugins
  config = function()
    require('vscode').setup({
      italic_comments = true, -- Set italic format to comments
      underline_links = true, -- Underline `@markup.link.*` variants
     })
     vim.cmd([[colorscheme vscode]])
  end,
}

