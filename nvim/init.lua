vim.g.mapleader = " "
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h8"
vim.loader.enable()

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smarttab = true

vim.opt.clipboard = "unnamedplus"

vim.opt.foldmethod = "indent"
vim.opt.foldexpr = nil
vim.opt.foldlevel = 99

vim.wo.relativenumber = true
vim.wo.number = true
vim.wo.numberwidth = 2
vim.wo.signcolumn = "yes"

vim.g.neovide_cursor_animation_length = 0.05
vim.g.neovide_cursor_trail_size = 0.8
vim.g.neovide_cursor_antialiasing = true

-- vim.opt.hlsearch = false

vim.api.nvim_set_keymap('n', '<S-Tab>', '<<', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Tab>', '==', { noremap = true, silent = true })

vim.api.nvim_set_keymap("n", "<M-l>", ":BufferLineCycleNext<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<M-h>", ":BufferLineCyclePrev<CR>", { noremap = true })

require("pine.lazy")
