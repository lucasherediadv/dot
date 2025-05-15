-- Map leader
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Auto format
vim.g.autoformat = true

-- Fix markdown indentation settings
vim.g.markdown_recommended_style = 0

local options = {
  autowrite = true, -- Enable auto write
  expandtab = true, -- Use spaces instead of tabs
  tabstop = 2, -- Number of spaces tabs count for
  shiftwidth = 2, -- Size of an indent
  shiftround = true, -- Round indent
  smartindent = true, -- Insert indents automatically
  number = true, -- Print line number
  numberwidth = 1, -- Width of the number column
  relativenumber = true, -- Relative line numbers
  ignorecase = true, -- Ignore case in search
  smartcase = true, -- Don't ignore case with capitals
  wrap = false, -- Disable line wrap
  cursorline = true, -- Enable highlighting of the current line
  termguicolors = true, -- True color support
  clipboard = vim.env.SSH_TTY and "" or "unnamedplus", -- Sync with system clipboard
  undofile = true, -- Persistent undo history
  undolevels = 10000,
  undodir = os.getenv "HOME" .. "/.cache/nvim/undodir", -- Undo directory
  swapfile = false, -- Disable use of swap files
  backup = false, -- Disable backup file
  writebackup = false, -- If a file is begin edited by another program (or was written to a file while editing with another program), it is not allowed to be edited
  fileencoding = "utf-8", -- The encoding written to a file
  cmdheight = 0, -- Set height of command line
  -- conceallevel = 2, -- Hide * markup for bold and italic, but not markers with substitutions
  confirm = true, -- Confirm to save changes before exiting modified buffer
  scrolloff = 4, -- Lines of context
  sidescrolloff = 8, -- Columns of context
  formatoptions = "jcroqlnt", -- tcqj
  jumpoptions = "view",
  linebreak = true, -- Wrap lines at convenient points
  smoothscroll = true,
  mouse = "a", -- Enable mouse mode
  ruler = false, -- Disable the default ruler
  showmode = false, -- Dont show mode since we have a statusline
  virtualedit = "block", -- Allow cursor to move where there is no text in visual block mode
  wildmode = "longest:full,full", -- Command-line completion mode
}

for option, value in pairs(options) do
  vim.opt[option] = value
end
