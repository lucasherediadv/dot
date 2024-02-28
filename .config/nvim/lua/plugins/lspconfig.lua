-- Language Server Protocol configuration

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'folke/neodev.nvim',
  },
  config = function()

    -- Keymaps to navigate through diagnostics
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float) -- Open diagnostic in float
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev) -- Got to previous diagnostic
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next) -- Go to next diagnostic

    -- Function to display hover information about the symbol
    -- under the cursor in a floating window
    -- Calling the function twice will jump into the floating window
    local my_on_attach = function (_, bufnr)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {buffer = bufnr})
    end

    require("neodev").setup()
    require('lspconfig').lua_ls.setup({
      on_attach = my_on_attach,
    })

    require('lspconfig').pyright.setup({
      on_attach = my_on_attach,
    })
  end,
}

