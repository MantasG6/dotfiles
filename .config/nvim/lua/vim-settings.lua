vim.g.mapleader = " "

-- Vim options
vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Keymaps
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
