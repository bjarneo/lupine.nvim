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
end

return M
