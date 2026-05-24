-- Conform plugin support for Lupine colorscheme
local M = {}

---@type lupine.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    ConformProgress = { fg = c.blue },
    ConformDone     = { fg = c.green },
    ConformError    = { fg = c.bright_red },
  }
end

return M
