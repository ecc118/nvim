require("poimandres").setup({
  disable_background = true,
  disable_float_background = true,
})
vim.cmd("colorscheme poimandres")
vim.api.nvim_set_hl(0, "Whitespace", { fg = "#1b1e28" })
