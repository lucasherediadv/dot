local map = vim.keymap.set

-- Better movement in splits with <Ctrl>hjkl
map("n", "<C-h>", "<C-w>h", { remap = true})
map("n", "<C-j>", "<C-w>j", { remap = true})
map("n", "<C-k>", "<C-w>k", { remap = true})
map("n", "<C-l>", "<C-w>l", { remap = true})

-- Move lines up and down with <Atl>jk
map("n", "<A-j>", "<cmd>m .+1<cr>==")
map("n", "<A-k>", "<cmd>m .-2<cr>==")

-- Clear highlight search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- Move between buffers with <space>[]
map("n", "<space>]", vim.cmd.bnext)
map("n", "<space>[", vim.cmd.bprev)

 -- Close current buffer
map("n", "<leader>bd", ":bd!<CR>")

-- After tab in/out re-select the same
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Goes to the next/prev result on the search and put the cursor in
-- the middle
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

