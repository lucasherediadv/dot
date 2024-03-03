local map = vim.keymap.set -- Set new keymap

-- Clear highlight search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear highlight search" })

-- Move between buffers with <space>[]
map("n", "<space>]", vim.cmd.bnext, { desc = "Go to next buffer" })
map("n", "<space>[", vim.cmd.bprev, { desc = "Go to previous buffer "})

-- Goes to the next/prev result on the search and put the cursor in the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

