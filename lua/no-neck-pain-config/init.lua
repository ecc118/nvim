require("no-neck-pain").setup({
  width = 120,
  autocmds = {
    skipEnteringNoNeckPainBuffer = true,
  },
  buffers = {
    wo = {
      statuscolumn = "",
      fillchars = "eob: ,vert:│,horiz: ,horizup: ,horizdown: ,vertleft:│,vertright: ,verthoriz: "
    },
  },
})
