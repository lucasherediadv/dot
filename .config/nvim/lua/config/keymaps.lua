local map = vim.keymap.set

-- Clear highlight search with <esc><esc>
map({ "i", "n" }, "<esc><esc>", "<cmd>noh<cr><esc>", { desc = "Clear highlight search" })

-- Goes to the next/prev result on the search and put the cursor in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

