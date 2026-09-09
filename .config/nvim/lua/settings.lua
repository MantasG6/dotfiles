vim.g.mapleader = " "

-- Vim options
-- share clipboard with system
vim.opt.clipboard = "unnamedplus"
-- show line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- indent
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- other options
vim.opt.colorcolumn = "120"
vim.opt.updatetime = 100
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.undofile = true

-- highlight motions when yanking or doing other actions
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- Keymaps
-- Go to explore with leader + -
vim.keymap.set("n", "<leader>-", vim.cmd.Ex)
-- move code blocks up and down with K and J
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
-- don't put cursor at the end when using J
vim.keymap.set("n", "J", "mzJ`z")
-- keep it at the center
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
-- leader + p or d will replace / delete to void and keep the clipboard in tact
vim.keymap.set("n", "<leader>p", '"_dP')
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')
-- just go back to normal mode with <C-c>
vim.keymap.set("i", "<C-c>", "<Esc>")
-- open diagnostic(errors, warnings, etc.) in quickfix
vim.keymap.set("n", "<leader>sd", vim.diagnostic.setqflist)
-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
