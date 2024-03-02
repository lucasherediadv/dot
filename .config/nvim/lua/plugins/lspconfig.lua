-- Language Server Protocol configuration

return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    'folke/neodev.nvim',
  },
  config = function()
    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '<leader>d', vim.diagnostic.open_float) -- Open diagnostic in float
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)         -- Got to previous diagnostic
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)         -- Go to next diagnostic
    -- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        -- vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        -- vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        -- vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        -- vim.keymap.set('n', '<space>wl', function()
        -- print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        -- end, opts)
        -- vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        -- vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>fr', function()
          vim.lsp.buf.format { async = true }
        end, opts)

        vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
          vim.lsp.handlers.hover,
          { border = 'rounded' }
        )

        vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
          vim.lsp.handlers.signature_help,
          { border = 'rounded' }
        )
        vim.diagnostic.config({
          float = {
            border = 'rounded',
          },
        })
      end,
    })

    require("neodev").setup()
    require('lspconfig').lua_ls.setup({})
    require("lspconfig").pyright.setup({
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
      require "lspconfig".marksman.setup {}
    })
  end,
}
