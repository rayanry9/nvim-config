require("keymaps.telescope")

vim.keymap.set("i", "<C-j>", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true })
vim.keymap.set("n", "<leader><tab>", ":b#<CR>")

vim.keymap.set("n", "<Esc>", ":nohlsearch<CR><Esc>", { noremap = true })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true })
