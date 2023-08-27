vim.g.mapleader = " "
local bind = vim.keymap.set

bind("n", "<leader>pv", vim.cmd.Ex)
bind("n", "<leader>x", ":source $HOME/.config/nvim/init.lua <CR>")
bind("n", "<leader>m", ":!gcc % -o %< && ./%< <CR>")
bind("n", "<leader>n", ":Neorg index <CR>")
bind("n", "<leader>s", ":w <CR>")
