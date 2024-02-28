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

    -- Allows lua to work with neovim
    require("neodev").setup()

    -- Lua LSP setup and config
    require('lspconfig').lua_ls.setup({
      on_attach = my_on_attach,
      filetypes = {"lua"}
    })

    -- Pyright config
    require("lspconfig").pyright.setup({
      on_attach = my_on_attach(),
      filetypes = {"python"},

      settings = {
        python = {
          analysis = {
            -- Determines whether pyright analyzes all files in the workspace
            diagnosticMode = "openFilesOnly",
            -- Determines the default type-checking level used by pyright
            typeCheckingMode = "strict",
            -- Determines whether pyright offers auto-import completions
            autoImportCompletions = true,
            -- Determines whether pyright automatically adds common
            -- search paths like "src" if there are no execution
            -- environments defined in the config file
            autoSearchPaths = true,
            -- Determines whether pyright reads, parses and analyzes library
            -- code to extract type information in the absence of type
            -- stubs files
            useLibraryCodeForTypes = true,
          }
        }
      },
      keys = {
        -- Organize imports in python files
        vim.keymap.set("n", "<leader>oi", ": PyrightOrganizeImports<CR>", { desc = "Organize Imports in python files" })
      },
    })
  end,
}

