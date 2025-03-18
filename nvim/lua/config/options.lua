-- Map leader
vim.g.mapleader = ","

local options = {
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
  wrap = true, -- Disable line wrap
  cursorline = true, -- Enable highlighting of the current line
  termguicolors = true, -- True color support
  clipboard = "unnamedplus",-- Sync with system clipboard
  undofile = true, -- Persistent undo history
  undodir = os.getenv "HOME" .. "/.cache/nvim/undodir", -- Undo directory
  swapfile = false, -- Disable use of swap files
  backup = false, -- Disable backup file
  writebackup = false, -- If a file is begin edited by another program (or was written to a file while editing with another program), it is not allowed to be edited
  fileencoding = "utf-8", -- The encoding written to a file
  cmdheight = 0, -- Set height of command line
  shortmess = aoOtTI, -- Avoid most of the 'Hit Enter ...' messages
}

for option, value in pairs(options) do
  vim.opt[option] = value
end
