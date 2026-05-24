---@class lupine
---@field config lupine.Config
---@field colors ColorScheme
local M = {}

---Load the colorscheme
---@param opts? lupine.Config
---@return ColorScheme colors
---@return table<string, vim.api.keyset.highlight> groups
---@return lupine.Config opts
function M.load(opts)
  opts = require("lupine.config").extend(opts)
  return require("lupine.theme").setup(opts)
end

---Configure lupine.
---@param opts? lupine.Config
function M.setup(opts)
  require("lupine.config").setup(opts)
  -- Invalidate any cached palette so consumers (e.g. lualine theme) that
  -- read lupine.colorscheme before setup() see the new opts immediately,
  -- not after the next :colorscheme call.
  local ok, colorscheme = pcall(require, "lupine.colorscheme")
  if ok then
    colorscheme.invalidate()
  end
end

return M
