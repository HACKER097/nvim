-- settings

vim.api.nvim_create_autocmd({"BufRead", "BufNewFile"}, {
  pattern = "*",
  callback = function()
    vim.cmd("TSBufEnable highlight")
  end,
})

vim.o.guifont = "JetBrainsMono Nerd Font:h11" 

vim.opt.clipboard:append('unnamedplus')

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.scrolloff = 8

-- plugins

-- imports
require("truegav.remap")
require("truegav.packer")
require("truegav.lsp")
require("truegav.transparent")
