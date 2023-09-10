vim.g.mapleader = " "
local bind = vim.keymap.set

bind("n", "<leader>pv", vim.cmd.Ex)
bind("n", "<leader>x", ":source $HOME/.config/nvim/init.lua <CR>")
bind("n", "<leader>m", ":!gcc % -o %< && ./%< <CR>")
bind("n", "<leader>n", ":Neorg index <CR>")
bind("n", "<leader>s", ":w <CR>")

bind("v", "J", ":m '>+1<CR>gv=gv")
bind("v", "K", ":m '>-2<CR>gv=gv")

bind("n", "<leader>y", "\"+y");
bind("v", "<leader>y", "\"+y");
bind("n", "<leader>Y", "\"+Y");

bind("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
