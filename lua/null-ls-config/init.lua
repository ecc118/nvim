local null_ls = require("null-ls")

local sources = {
  null_ls.builtins.formatting.prettier.with({
    filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "css", "scss", "html", "json", "jsonc", "markdown" },
  }),
  --null_ls.builtins.formatting.eslint,
}

null_ls.setup({ sources = sources })
