vim.g.mapleader = " "

-- Vim options
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2

-- Keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
