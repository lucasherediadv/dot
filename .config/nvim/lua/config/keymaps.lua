local map = vim.keymap.set

-- Better movement in splits with <Ctrl>hjkl
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true})
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true})
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true})
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true})

-- Move lines up and down with <Atl>jk
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

-- Clear highlight search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- Move between buffers with <space>lh
map("n", "<space>n", vim.cmd.bnext)
map("n", "<space>p", vim.cmd.bprev)

