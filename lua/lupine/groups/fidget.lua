-- Fidget plugin support for Lupine colorscheme
local M = {}

---@type lupine.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    FidgetTask = { fg = c.muted },
    FidgetTitle = { fg = c.blue, bold = true },
  }
end

return M
