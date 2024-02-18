return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'folke/neodev.nvim',
  },
  config = function()
    local my_on_attach = function(_, bufnr)
      vim.keymap.set('n', 'K', vim.lsp.buf.hover, { buffer = bufnr })
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

