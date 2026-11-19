local set = vim.opt

set.expandtab = true
set.tabstop = 2
set.softtabstop = 2
set.shiftwidth = 2
set.smartindent = true

set.fileencoding = 'utf-8'
set.termguicolors = true
set.swapfile = false
set.backup = false

set.incsearch = true
set.cursorline = true

set.splitbelow = true
set.splitright = true
set.scrolloff = 8
set.signcolumn = 'yes'
set.guicursor = 'i:block'

set.nu = true
set.relativenumber = false
set.statuscolumn = "%s%=%{v:virtnum ? '' : v:lnum}  "
vim.api.nvim_create_autocmd("FileType", {
  pattern = "fugitive",
  command = "setlocal statuscolumn= nonumber",
})
set.list = true
set.listchars = { tab = "→ " }

set.hidden = true

vim.opt.fillchars:append({ eob = " " })
vim.api.nvim_set_hl(0, "WinSeparator", { link = "LineNr" })
