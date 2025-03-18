return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-treesitter/nvim-treesitter',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
  },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true,                   -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true,    -- override the file sorter
        case_mode = "smart_case",       -- or 'ignore_case or 'respect_case'
      },
    },
  },

  config = function(opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('fzf')
  end,

 -- Custom Keymaps
  keys = {
    {
      "<leader>fzf",
      function()
        require('telescope.builtin').find_files({ file_ignore_patterns = { "Dotfiles" } })
      end,
    },
  }
}
