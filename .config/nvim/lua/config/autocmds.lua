local autocmd = vim.api.nvim_create_autocmd -- Create auto command

-- Remove white space on save
autocmd("BufWritePre", {
  pattern = {"*"},
  command = [[%s/\s\+$//e]],
})

-- Don't auto commenting new lines
autocmd("BufEnter", {
  pattern = "",
  command = "set fo-=c fo-=r fo-=o"
})

-- Highlight on yank (copy)
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

-- Close some file types with <q>
autocmd("FileType", {
  pattern = {
    "qf",
    "query",
    "checkhealth",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Wrap and check for spell in text filetypes
autocmd("Filetype", {
  pattern = { "gitcommit", "markdown", "text"},
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = true
  end,
})

