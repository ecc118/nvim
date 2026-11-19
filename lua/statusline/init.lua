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

function _G.recording()
  local reg = vim.fn.reg_recording()
  return reg ~= "" and ("recording @" .. reg) or ""
end

function _G.search_count()
  if vim.v.hlsearch == 0 then return "" end
  local ok, s = pcall(vim.fn.searchcount, { maxcount = 999, timeout = 50 })
  if not ok or s.total == 0 then return "" end
  return string.format("[%d/%d]", s.current, s.total)
end

vim.api.nvim_create_autocmd({ "RecordingEnter", "RecordingLeave" }, {
  callback = function() vim.schedule(function() vim.cmd.redrawstatus() end) end,
})

vim.api.nvim_set_hl(0, "StatusMode", { bold = true })

vim.o.cmdheight = 0
vim.o.showcmdloc = "statusline"
vim.o.laststatus = 3
vim.o.showmode = false
vim.o.statusline = table.concat({
  "%#StatusMode#%{v:lua.mode_name()}%*",  -- mode
  "%( %{&modified ? '*' : ''}%)",         -- * when unsaved
  "%( %S%)",                              -- pending keys / selection size
  "%( %{v:lua.recording()}%)",            -- recording
  "%( %{v:lua.search_count()}%)",         -- search count
  "%=",                                   -- everything after this goes right
  "%{v:lua.rel_dir()} ",                  -- folder
})
