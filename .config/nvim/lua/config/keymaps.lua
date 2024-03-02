local map = vim.keymap.set -- Set new keymap

-- Better movement in splits with <Ctrl>hjkl
map("n", "<C-h>", "<C-w>h", { remap = true})
map("n", "<C-j>", "<C-w>j", { remap = true})
map("n", "<C-k>", "<C-w>k", { remap = true})
map("n", "<C-l>", "<C-w>l", { remap = true})

-- Clear highlight search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Clear highlight search" })

-- Move between buffers with <space>[]
map("n", "<space>]", vim.cmd.bnext, { desc = "Go to next buffer" })
map("n", "<space>[", vim.cmd.bprev, { desc = "Go to previous buffer "})

 -- Close current buffer
map("n", "<leader>bd", ":bd!<CR>")

-- Goes to the next/prev result on the search and put the cursor in
-- the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

