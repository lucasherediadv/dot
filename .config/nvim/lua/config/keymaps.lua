local map = vim.keymap.set

-- Move to window using the <ctrl> hjkl keys
map("n", "<C-h>", "<C-w>h", { desc = "Go to left window", remap = true})
map("n", "<C-j>", "<C-w>j", { desc = "Go to lower window", remap = true})
map("n", "<C-k>", "<C-w>k", { desc = "Go to upper window", remap = true})
map("n", "<C-l>", "<C-w>l", { desc = "Go to right window", remap = true})

-- Move lines with <Alt> jk keys
map("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move line down" })
map("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move line up" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

