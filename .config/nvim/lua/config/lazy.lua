local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup {
  spec = {
    { import = "plugins" },
  },
  default = {
    lazy = true, -- Should plugins be lazy-loaded?
  },
  checker = {
    enabled = true, -- Automatically check for plugin updates
    notify = false, -- Disable notification when new updates are found
    frequency = 86400, -- Checks for updates every day
  },
}

