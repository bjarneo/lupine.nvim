-- Gitsigns plugin support for Lupine colorscheme
local M = {}

---@type lupine.HighlightsFn
function M.get(c, opts)
  return {
    GitSignsAdd = { fg = c.git.add },
    GitSignsChange = { fg = c.git.change },
    GitSignsDelete = { fg = c.bright_red },
  }
end

return M
