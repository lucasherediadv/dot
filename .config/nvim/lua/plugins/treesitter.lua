return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate', -- Ensure that all installed parsers are updated to the latest version
  main = 'nvim-treesitter.configs', -- Main module
  opts = {
    ensure_installed = {
      'lua',
      'python',
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}

