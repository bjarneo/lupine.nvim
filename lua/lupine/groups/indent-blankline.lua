-- Indent blankline plugin support for Lupine colorscheme
local M = {}

---@type lupine.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    IblIndent = { fg = c.muted, nocombine = true },
    IblScope  = { fg = c.blue, nocombine = true },
  }
end

return M
