local root = vim.fn.getcwd()
local modes = {
  n = "NORMAL",
  i = "INSERT",
  v = "VISUAL",
  V = "V-LINE",
  c = "COMMAND",
  R = "REPLACE",
  s = "SELECT",
  S = "S-LINE",
  t = "TERMINAl",
  r = "PROMPT",
}

function _G.mode_name() return modes[vim.fn.mode()] or vim.fn.mode() end

function _G.rel_dir()
  local name = vim.api.nvim_buf_get_name(0)
  if name:match("^fugitive://") or vim.bo.filetype:match("^fugitive") then
    return ""
  end
  local dir
  if vim.bo.filetype == "netrw" then
    dir = vim.b.netrw_curdir
  else
    local name = vim.api.nvim_buf_get_name(0)
    dir = name ~= "" and vim.fn.fnamemodify(name, ":p:h") or root
  end
  dir = dir:gsub("/$", "")

  if dir == root then return "./" end
  if dir:sub(1, #root + 1) == root .. "/" then
    return dir:sub(#root + 2) .. "/"
  end
  return vim.fn.fnamemodify(dir, ":~") .. "/"
end

vim.api.nvim_set_hl(0, "StatusMode", { bold = true })

vim.o.laststatus = 3
vim.o.showmode = false
vim.o.statusline = "%#StatusMode#%{v:lua.mode_name()}%*%( %{&modified ? '*' : ''}%) %{v:lua.rel_dir()}"
