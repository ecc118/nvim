require("mini.tabline").setup({
  show_icons = false,
  format = nil,
  tabpage_section = 'left',
})

local function get(name)
  return vim.api.nvim_get_hl(0, { name = name, link = false })
end

local function set_tabline_colors()
  local normal  = get("Normal")
  local accent  = get("Function")
  local comment = get("Comment")
  local line    = get("CursorLine")
  local err     = get("DiagnosticError")


  local hl = vim.api.nvim_set_hl
  hl(0, "MiniTablineCurrent",         { fg = normal.fg, bg = normal.bg, underline = true })
  hl(0, "MiniTablineVisible",         { fg = normal.fg, bg = normal.bg })
  hl(0, "MiniTablineHidden",          { fg = comment.fg, bg = normal.bg })
  hl(0, "MiniTablineModifiedCurrent", { fg = accent.fg, bg = normal.bg, underline = true })
  hl(0, "MiniTablineModifiedVisible", { fg = accent.fg, bg = normal.bg })
  hl(0, "MiniTablineModifiedHidden",  { fg = accent.fg, bg = normal.bg })
  hl(0, "MiniTablineFill",            { bg = "NONE" })
end

set_tabline_colors()
vim.api.nvim_create_autocmd("ColorScheme", { callback = set_tabline_colors })

local WIDTH = 120

function _G.AlignedTabline()
  local content = MiniTabline.make_tabline_string()
  local pad = math.max(0, math.floor((vim.o.columns - WIDTH) / 2))
  local used = vim.api.nvim_eval_statusline(content, { use_tabline = true }).width
  pad = math.min(pad, math.max(0, vim.o.columns - used))

  return "%#MiniTablineFill#%=" .. content .. "%#MiniTablineFill#" .. string.rep(" ", pad)
end

vim.o.tabline = "%!v:lua.AlignedTabline()"
