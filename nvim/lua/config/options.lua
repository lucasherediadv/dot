local options = {
  list = true, -- Show some invisible characters
  listchars = { tab = '→ ', trail = '•', extends = '»', precedes = '«' }, -- Replace with symbols
  expandtab = true, -- Use spaces instead of tabs
  tabstop = 2, -- Number of spaces tabs count for
  shiftwidth = 2, -- Size of an indent
  smartindent = true, -- Insert indents automatically
  ignorecase = true, -- Ignore case in search
  showmode = false, -- Don't show mode
  laststatus = 0, -- No status line
}

for option, value in pairs(options) do
  vim.opt[option] = value
end
