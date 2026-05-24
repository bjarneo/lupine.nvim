-- Lint plugin support for Lupine colorscheme
local M = {}

---@type lupine.HighlightsFn
function M.get(c, opts)
  -- stylua: ignore
  return {
    LintError   = { fg = c.bright_red },
    LintWarning = { fg = c.warning },
    LintInfo    = { fg = c.info },
    LintHint    = { fg = c.hint },
  }
end

return M
