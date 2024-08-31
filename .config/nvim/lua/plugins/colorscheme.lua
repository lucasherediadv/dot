return {
  'Mofiqul/vscode.nvim',
  lazy = false,    -- Make sure to load this during startup
  priority = 1000, -- Make sure to load this before all the other start plugins
  config = function()
    vim.cmd([[colorscheme vscode]])
  end,
}

