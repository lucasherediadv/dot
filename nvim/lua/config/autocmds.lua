-- This one is for gopass
vim.api.nvim_create_autocmd({"BufNewFile", "BufRead"}, {
  pattern = "/dev/shm/gopass*",
  callback = function()
    vim.opt_local.swapfile = false
    vim.opt_local.backup = false
    vim.opt_local.undofile = false
    vim.opt_local.shada = ""
  end,
})
