return {
  'nvim-telescope/telescope.nvim',
  event = "VeryLazy",
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-file-browser.nvim',
    {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'}
  },
  opts = {
    extensions = {
      fzf = {
        fuzzy = true, -- false will only do exact matching
        override_generic_sorter = true, -- override the generic sorter
        override_file_sorter = true, -- override the file sorter
        case_mode = "smart_case", -- or 'ignore_case or 'respect_case'
                                  -- the default case_mode is 'smart_case'
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
      "<leader>bb",
      function()
        require("telescope").extensions.file_browser.file_browser({path = "%:h:p", select_buffer = true, hidden = true})
      end,
      desc = "Telescope file browser"
    },
    {
      "<leader>ff",
      function()
        require('telescope.builtin').find_files( {file_ignore_patterns = { "Dotfiles" } })
      end,
      desc = "Telescope find files"
    },
    {
    "<leader>kk",
      function()
        require("telescope.builtin").keymaps()
      end,
      desc = "Telescope key mappings"
    },
    {
      "<leader>hh",
      function()
        require("telescope.builtin").help_tags()
      end,
      desc = "Telescope help"
    },
  },
}

