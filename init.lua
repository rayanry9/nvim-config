vim.opt.termguicolors = true
require("keymaps")
require("config.lazy")
require("keymaps.others")
require("lsp")
require("autocmd")

vim.cmd.colorscheme("catppuccin-mocha")

vim.opt.smarttab = false
vim.opt.autoindent = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.linebreak = true
vim.opt.scrolloff = 8
vim.opt.wrap = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.history = 1000

vim.opt.wildmenu = true

vim.g.clipboard = "wl-copy"
vim.opt.clipboard = "unnamedplus"

vim.opt.timeoutlen = 500
