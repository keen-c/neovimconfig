vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.completopt = "menu, noselect, menuone,"
vim.opt.mouse = "a"
vim.opt.conceallevel = 2
vim.opt.concealcursor = ""
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
vim.opt.foldenable = false
vim.opt.swapfile = false
vim.opt.autoindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.list = false
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.copyindent = true
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.autowriteall = true
vim.opt.list = false
vim.opt.updatetime = 100
vim.opt.foldlevel = 1
vim.opt.foldmethod = "syntax"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"

local opts = { noremap = true, silent = true }
local keymap = vim.keymap
keymap.set("n", "q", ":close<CR>", opts)
keymap.set("v", "cc", '"+y', opts)
vim.keymap.set("n", "<esc>", ":nohlsearch<CR>", opts)
-- Bind Option (Alt) + Arrow keys to window navigation
vim.keymap.set("n", "<M-Left>", "<C-w>h", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Down>", "<C-w>j", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Up>", "<C-w>k", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Right>", "<C-w>l", { noremap = true, silent = true })
