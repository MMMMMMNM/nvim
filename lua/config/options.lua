local opt = vim.opt

opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.number = true
opt.relativenumber = true
opt.cursorline = true
opt.termguicolors = true
opt.confirm = true
opt.showmode = false

opt.pumblend = 15
opt.cmdheight = 1

opt.mouse = "a"
opt.clipboard = "unnamedplus"
opt.wrap = false
opt.scrolloff = 8

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 2
opt.autoindent = true
opt.smartindent = true
opt.breakindent = true

opt.undofile = true

-- opt.list = true
-- opt.listchars = { tab = "__",trail = "-"}

vim.g.mapleader = " "
vim.g.maplocalleader = ","

require("vim._core.ui2").enable({})
