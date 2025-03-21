vim.g.mapleader = " "
local bind = vim.keymap.set

bind("n", "n", "nzz")
bind("n", "N", "Nzz")

bind("n", "<C-M>", ":bnext<CR>")
bind("n", "<C-N>", ":bprev<CR>")
bind("n", "<leader>X", ":bdel<CR>")

bind("n", "<leader>q", ":source $HOME/.config/nvim/init.lua <CR>")
bind("n", "<leader>n", ":Neorg index <CR>")
bind("n", "<leader>s", ":w <CR>")
bind("n", "<leader>ll", ":VimtexCompile<CR>")

bind("v", "J", ":m '>+1<CR>gv=gv")
bind("v", "K", ":m '<-2<CR>gv=gv")

bind("n", "<leader>y", "\"+y");
bind("v", "<leader>y", "\"+y");
bind("n", "<leader>Y", "\"+Y");
