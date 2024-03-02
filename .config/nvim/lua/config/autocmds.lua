local autocmd = vim.api.nvim_create_autocmd -- Create auto command

-- Remove white space on save
autocmd("BufWritePre", {
  pattern = {"*"},
  command = [[%s/\s\+$//e]],
})

-- Don't auto comment new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o"
})

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({
      higroup = "IncSearch",
      timeout = "1000",
    })
  end
})

-- Resize splits if windows got resized
autocmd({ "VimResized" }, {
  callback = function()
    vim.cmd "tabdo wincmd ="
  end,
})

-- Wrap and check for spell in text filetypes
autocmd("Filetype", {
  pattern = { "gitcommit", "markdown", "text"},
  callback = function()
    vim.opt_local.wrap = true -- Enable wrap
    vim.opt_local.spell = true -- Check for spell
    vim.opt.linebreak = true -- Better line break
  end,
})

-- For python files
autocmd("Filetype", {
  pattern = { "python" },
  callback = function ()
    vim.opt_local.expandtab = true -- Use spaces instead of tabs
    vim.opt_local.tabstop = 4 -- Number of spaces tabs count for
    vim.opt_local.shiftwidth = 4 -- Size of an indent
    vim.opt_local.colorcolumn = "79" -- Display color when line reach PEP8 standards
  end,
})

